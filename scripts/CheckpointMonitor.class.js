/**
 * CheckpointMonitor Class
 * 
 * Class-based checkpoint monitor for use in Electron apps
 * Can be started and stopped programmatically
 */

const fs = require('fs');
const path = require('path');
const { EventEmitter } = require('events');

class CheckpointMonitor extends EventEmitter {
  constructor(config = {}) {
    super();
    
    this.config = {
      checkpointsDir: path.join(__dirname, '../checkpoints'),
      dashboardDataPath: path.join(__dirname, '../docs/tools/scms-cost-data.json'),
      checkInterval: 3000,
      tokenPattern: /<system_warning>Token usage: (\d+)\/(\d+); (\d+) remaining<\/system_warning>/,
      minCheckpointLength: 1000,
      ...config
    };
    
    this.lastClipboard = '';
    this.checkpointCount = 0;
    this.intervalId = null;
    this.clipboardy = null;
    
    // Load clipboardy
    try {
      this.clipboardy = require('clipboardy');
    } catch (err) {
      throw new Error('clipboardy not installed. Run: npm install clipboardy');
    }
    
    // Ensure checkpoints directory exists
    if (!fs.existsSync(this.config.checkpointsDir)) {
      fs.mkdirSync(this.config.checkpointsDir, { recursive: true });
    }
  }
  
  /**
   * Check if text contains checkpoint data
   */
  isCheckpointData(text) {
    return text.includes('<system_warning>Token usage:') &&
           text.length > this.config.minCheckpointLength;
  }
  
  /**
   * Extract checkpoint metadata
   */
  extractMetadata(text) {
    const match = text.match(this.config.tokenPattern);
    if (!match) return null;
    
    const [, used, total, remaining] = match;
    return {
      tokensUsed: parseInt(used),
      tokensTotal: parseInt(total),
      tokensRemaining: parseInt(remaining),
      timestamp: new Date().toISOString()
    };
  }
  
  /**
   * Save checkpoint to file
   */
  saveCheckpoint(text, metadata) {
    const timestamp = Date.now();
    const filename = `checkpoint_${timestamp}.txt`;
    const filepath = path.join(this.config.checkpointsDir, filename);
    
    // Add metadata header
    const header = `<!-- CHECKPOINT METADATA
Timestamp: ${metadata.timestamp}
Tokens Used: ${metadata.tokensUsed}
Tokens Total: ${metadata.tokensTotal}
Tokens Remaining: ${metadata.tokensRemaining}
-->\n\n`;
    
    fs.writeFileSync(filepath, header + text, 'utf-8');
    
    return {
      filename,
      filepath,
      timestamp,
      ...metadata
    };
  }
  
  /**
   * Update economics dashboard with new checkpoint
   */
  updateDashboard(checkpointData) {
    try {
      // Load existing dashboard data
      let dashboardData = { sessions: [], patterns: {}, analysis: {} };
      
      if (fs.existsSync(this.config.dashboardDataPath)) {
        dashboardData = JSON.parse(fs.readFileSync(this.config.dashboardDataPath, 'utf-8'));
      }
      
      // Find or create current session
      let currentSession = dashboardData.sessions.find(s => !s.endTime);
      
      if (!currentSession) {
        // No active session, skip dashboard update
        return;
      }
      
      // Update session with checkpoint data
      if (!currentSession.checkpoints) {
        currentSession.checkpoints = [];
      }
      
      currentSession.checkpoints.push({
        timestamp: checkpointData.timestamp,
        tokensUsed: checkpointData.tokensUsed
      });
      
      // Recalculate session totals if we have multiple checkpoints
      if (currentSession.checkpoints.length > 1) {
        const lastCheckpoint = currentSession.checkpoints[currentSession.checkpoints.length - 1];
        const firstCheckpoint = currentSession.checkpoints[0];
        
        const sessionTokens = lastCheckpoint.tokensUsed - firstCheckpoint.tokensUsed;
        
        // Estimate input/output split (60/40 typical for SCMS)
        currentSession.tokenBreakdown.input = Math.floor(sessionTokens * 0.6);
        currentSession.tokenBreakdown.output = Math.floor(sessionTokens * 0.4);
        
        // Recalculate cost ($3 per million input, $15 per million output)
        const inputCost = (currentSession.tokenBreakdown.input / 1000000) * 3;
        const outputCost = (currentSession.tokenBreakdown.output / 1000000) * 15;
        currentSession.totalCost = inputCost + outputCost;
      }
      
      // Save updated dashboard data
      fs.writeFileSync(
        this.config.dashboardDataPath,
        JSON.stringify(dashboardData, null, 2),
        'utf-8'
      );
      
      this.emit('log', 'Dashboard updated with checkpoint data');
    } catch (error) {
      this.emit('log', `Dashboard update error: ${error.message}`);
    }
  }
  
  /**
   * Monitor clipboard
   */
  async monitorClipboard() {
    try {
      const clipboard = await this.clipboardy.read();
      
      // Skip if clipboard unchanged
      if (clipboard === this.lastClipboard) {
        return;
      }
      
      // Check if clipboard contains checkpoint data
      if (this.isCheckpointData(clipboard)) {
        const metadata = this.extractMetadata(clipboard);
        
        if (metadata) {
          this.checkpointCount++;
          const checkpoint = this.saveCheckpoint(clipboard, metadata);
          
          this.emit('log', `✅ Checkpoint ${this.checkpointCount} saved`);
          this.emit('log', `   Tokens: ${metadata.tokensUsed.toLocaleString()} used`);
          this.emit('log', `   File: ${checkpoint.filename}`);
          
          // Update dashboard
          this.updateDashboard(checkpoint);
          this.emit('checkpoint', checkpoint);
        }
      }
      
      this.lastClipboard = clipboard;
    } catch (error) {
      this.emit('log', `Clipboard check error: ${error.message}`);
    }
  }
  
  /**
   * Start monitoring
   */
  async start() {
    if (this.intervalId) {
      throw new Error('Monitor already running');
    }
    
    this.emit('log', '🔍 Checkpoint Monitor Started');
    this.emit('log', `Checking clipboard every ${this.config.checkInterval}ms`);
    
    // Check immediately
    await this.monitorClipboard();
    
    // Start interval
    this.intervalId = setInterval(() => {
      this.monitorClipboard().catch(err => {
        this.emit('log', `Monitor error: ${err.message}`);
      });
    }, this.config.checkInterval);
  }
  
  /**
   * Stop monitoring
   */
  async stop() {
    if (this.intervalId) {
      clearInterval(this.intervalId);
      this.intervalId = null;
      
      this.emit('log', '👋 Checkpoint Monitor Stopped');
      this.emit('log', `Processed ${this.checkpointCount} checkpoints`);
      this.emit('stopped');
    }
  }
  
  /**
   * Check if running
   */
  isRunning() {
    return this.intervalId !== null;
  }
}

module.exports = CheckpointMonitor;
