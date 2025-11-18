/**
 * CheckpointMonitor Class
 * 
 * Class-based checkpoint monitor for use in Electron apps
 * Can be started and stopped programmatically
 * Uses file system watching instead of clipboard monitoring
 */

const fs = require('fs');
const path = require('path');
const { EventEmitter } = require('events');

class CheckpointMonitor extends EventEmitter {
  constructor(config = {}) {
    super();
    
    this.config = {
      checkpointsDir: path.join(__dirname, '../checkpoints'),
      dashboardDataPath: path.join(__dirname, '../economics-dashboard-data.json'),
      tokenPattern: /<system_warning>Token usage: (\d+)\/(\d+); (\d+) remaining<\/system_warning>/g,
      costRates: {
        input: 0.03 / 1_000_000,
        output: 0.06 / 1_000_000
      },
      inputOutputSplit: {
        input: 0.60,
        output: 0.40
      },
      ...config
    };
    
    this.checkpointCount = 0;
    this.watcher = null;
    this.processedFiles = new Set();
    this.currentSessionType = null;
    
    // Ensure checkpoints directory exists
    if (!fs.existsSync(this.config.checkpointsDir)) {
      fs.mkdirSync(this.config.checkpointsDir, { recursive: true });
    }
    
    // Load existing files to avoid reprocessing
    this.loadExistingFiles();
  }
  
  /**
   * Load existing checkpoint files to avoid reprocessing
   */
  loadExistingFiles() {
    try {
      const files = fs.readdirSync(this.config.checkpointsDir);
      files.forEach(file => {
        if (file.endsWith('.txt')) {
          this.processedFiles.add(file);
        }
      });
      this.emit('log', `📁 Found ${this.processedFiles.size} existing checkpoint files`);
    } catch (err) {
      this.emit('log', `⚠️  Could not load existing files: ${err.message}`);
    }
  }
  
  /**
   * Parse checkpoint file for token data
   */
  parseCheckpointFile(filepath) {
    try {
      const text = fs.readFileSync(filepath, 'utf-8');
      const checkpoints = [];
      
      // Extract all token usage warnings
      let match;
      const pattern = new RegExp(this.config.tokenPattern);
      const globalPattern = new RegExp(this.config.tokenPattern.source, 'g');
      
      while ((match = globalPattern.exec(text)) !== null) {
        checkpoints.push({
          used: parseInt(match[1]),
          budget: parseInt(match[2]),
          remaining: parseInt(match[3])
        });
      }
      
      if (checkpoints.length === 0) {
        return null;
      }
      
      // Calculate session totals
      const first = checkpoints[0];
      const last = checkpoints[checkpoints.length - 1];
      const totalTokens = last.used - first.used;
      
      // Estimate input/output split
      const inputTokens = Math.floor(totalTokens * this.config.inputOutputSplit.input);
      const outputTokens = Math.floor(totalTokens * this.config.inputOutputSplit.output);
      
      // Calculate cost
      const inputCost = inputTokens * this.config.costRates.input;
      const outputCost = outputTokens * this.config.costRates.output;
      const totalCost = inputCost + outputCost;
      
      return {
        checkpoints,
        totalTokens,
        tokenBreakdown: {
          input: inputTokens,
          output: outputTokens,
          thinking: 0,
          tools: 0
        },
        totalCost,
        checkpointCount: checkpoints.length
      };
    } catch (err) {
      this.emit('log', `❌ Error parsing ${filepath}: ${err.message}`);
      return null;
    }
  }
  
  /**
   * Update dashboard with parsed checkpoint data
   */
  updateDashboard(parsedData, filename) {
    try {
      // Load existing dashboard data
      let dashboardData = { sessions: [], patterns: [], analysis: {} };
      
      if (fs.existsSync(this.config.dashboardDataPath)) {
        dashboardData = JSON.parse(fs.readFileSync(this.config.dashboardDataPath, 'utf-8'));
      }
      
      // Extract session ID from filename (checkpoint-[sessionId].txt)
      const match = filename.match(/checkpoint[_-](\d+)\.txt/);
      const sessionId = match ? parseInt(match[1]) : null;
      
      // Find existing session or find active session
      let session = null;
      
      if (sessionId) {
        session = dashboardData.sessions.find(s => s.id === sessionId);
      }
      
      if (!session) {
        // Find any active session (no endTime)
        session = dashboardData.sessions.find(s => !s.endTime);
      }
      
      if (!session) {
        // Create new session
        session = {
          id: sessionId || Date.now(),
          type: this.currentSessionType || 'scms',
          startTime: new Date().toISOString(),
          tokenBreakdown: { input: 0, output: 0, thinking: 0, tools: 0 },
          totalCost: 0,
          interactions: [],
          patterns: [],
          retrievalRatio: 0
        };
        dashboardData.sessions.push(session);
        this.emit('log', `🆕 Created new session: ${session.id}`);
      }
      
      // Update session with parsed data
      session.tokenBreakdown = parsedData.tokenBreakdown;
      session.totalCost = parsedData.totalCost;
      
      // Recalculate analysis
      this.recalculateAnalysis(dashboardData);
      
      // Save updated dashboard
      dashboardData.exportDate = new Date().toISOString();
      fs.writeFileSync(
        this.config.dashboardDataPath,
        JSON.stringify(dashboardData, null, 2),
        'utf-8'
      );
      
      this.emit('log', `💾 Dashboard updated: ${session.type} session`);
      this.emit('log', `   Total cost: $${parsedData.totalCost.toFixed(4)}`);
      this.emit('log', `   Checkpoints: ${parsedData.checkpointCount}`);
    } catch (error) {
      this.emit('log', `❌ Dashboard update error: ${error.message}`);
    }
  }
  
  /**
   * Recalculate dashboard analysis
   */
  recalculateAnalysis(dashboardData) {
    const scmsSessions = dashboardData.sessions.filter(s => s.type === 'scms');
    const baselineSessions = dashboardData.sessions.filter(s => s.type === 'baseline');
    
    const scmsCosts = scmsSessions.map(s => s.totalCost).filter(c => c > 0);
    const baselineCosts = baselineSessions.map(s => s.totalCost).filter(c => c > 0);
    
    const scmsAvg = scmsCosts.length > 0 
      ? scmsCosts.reduce((a, b) => a + b, 0) / scmsCosts.length 
      : 0;
      
    const baselineAvg = baselineCosts.length > 0
      ? baselineCosts.reduce((a, b) => a + b, 0) / baselineCosts.length
      : 0;
    
    const savings = baselineAvg - scmsAvg;
    const savingsPercent = baselineAvg > 0 ? (savings / baselineAvg) * 100 : null;
    
    dashboardData.analysis = {
      scmsAvgCost: scmsAvg,
      baselineAvgCost: baselineAvg,
      savings: savings,
      savingsPercent: savingsPercent,
      scmsSessions: scmsSessions.length,
      baselineSessions: baselineSessions.length
    };
  }
  
  /**
   * Process new checkpoint file
   */
  processCheckpointFile(filename) {
    // Skip if already processed
    if (this.processedFiles.has(filename)) {
      return;
    }
    
    const filepath = path.join(this.config.checkpointsDir, filename);
    
    this.emit('log', '');
    this.emit('log', `📄 New checkpoint detected: ${filename}`);
    
    // Parse checkpoint file
    const parsedData = this.parseCheckpointFile(filepath);
    
    if (!parsedData) {
      this.emit('log', '   ⚠️  No valid checkpoint data found');
      return;
    }
    
    this.checkpointCount++;
    this.emit('log', `✅ Checkpoint ${this.checkpointCount} PROCESSED`);
    this.emit('log', `   Total tokens: ${parsedData.totalTokens.toLocaleString()}`);
    this.emit('log', `   Input: ${parsedData.tokenBreakdown.input.toLocaleString()}`);
    this.emit('log', `   Output: ${parsedData.tokenBreakdown.output.toLocaleString()}`);
    this.emit('log', `   Cost: $${parsedData.totalCost.toFixed(4)}`);
    this.emit('log', `   Checkpoints in file: ${parsedData.checkpointCount}`);
    
    // Update dashboard
    this.updateDashboard(parsedData, filename);
    
    // Mark as processed
    this.processedFiles.add(filename);
    
    this.emit('checkpoint', { filename, ...parsedData });
    this.emit('log', '');
  }
  
  /**
   * Start monitoring
   */
  async start(sessionStamp = {}) {
    if (this.watcher) {
      throw new Error('Monitor already running');
    }
    
    // Store session type for new sessions
    this.currentSessionType = sessionStamp.type || 'scms';
    
    this.emit('log', '🔍 Checkpoint Monitor Started');
    this.emit('log', `📁 Watching directory: ${this.config.checkpointsDir}`);
    this.emit('log', `💾 Dashboard data: ${this.config.dashboardDataPath}`);
    this.emit('log', `🏷️  Session type: ${this.currentSessionType}`);
    this.emit('log', '');
    this.emit('log', '⏳ Waiting for checkpoint files...');
    this.emit('log', '   → Checkpoint files will be auto-detected');
    this.emit('log', '   → Save chat history to checkpoint file in checkpoints/ folder');
    this.emit('log', '');
    
    // Watch for new files in checkpoints directory
    this.watcher = fs.watch(this.config.checkpointsDir, { recursive: false }, (eventType, filename) => {
      if (filename && filename.endsWith('.txt')) {
        // Small delay to ensure file is fully written
        setTimeout(() => {
          this.processCheckpointFile(filename);
        }, 100);
      }
    });
    
    this.emit('log', '✅ File watcher active');
  }
  
  /**
   * Stop monitoring
   */
  async stop() {
    if (this.watcher) {
      this.watcher.close();
      this.watcher = null;
      
      this.emit('log', '');
      this.emit('log', '========================================');
      this.emit('log', '👋 Checkpoint Monitor STOPPED');
      this.emit('log', `📊 Session Summary:`);
      this.emit('log', `   Checkpoint files processed: ${this.checkpointCount}`);
      
      if (this.checkpointCount === 0) {
        this.emit('log', '');
        this.emit('log', '⚠️  WARNING: No checkpoint files detected!');
        this.emit('log', '   Possible reasons:');
        this.emit('log', '   1. No checkpoint files were saved to checkpoints/ folder');
        this.emit('log', '   2. Work happened outside Windsurf IDE');
        this.emit('log', '   3. Checkpoint files were saved elsewhere');
        this.emit('log', '');
        this.emit('log', '   To track work, save Windsurf chat history as a .txt file');
        this.emit('log', '   in the checkpoints/ directory.');
      }
      
      this.emit('log', '========================================');
      this.emit('log', '');
      this.emit('stopped');
    }
  }
  
  /**
   * Check if running
   */
  isRunning() {
    return this.watcher !== null;
  }
  
  /**
   * Set session type for new sessions
   */
  setSessionType(type) {
    this.currentSessionType = type;
    this.emit('log', `🏷️  Session type changed to: ${type}`);
  }
}

module.exports = CheckpointMonitor;
