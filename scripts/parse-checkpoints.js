/**
 * SCMS Checkpoint Parser
 * Parses saved checkpoint files and updates dashboard data
 */

const fs = require('fs');
const path = require('path');

// Configuration
const CHECKPOINTS_DIR = path.join(__dirname, '..', 'checkpoints');
const DATA_FILE = path.join(__dirname, '..', 'docs', 'tools', 'scms-cost-data.json');

// Parse checkpoint data from file
function parseCheckpointFile(filePath) {
    const content = fs.readFileSync(filePath, 'utf8');
    const checkpoints = [];
    
    // Match: Token usage: 78652/200000; 121348 remaining
    const tokenRegex = /Token usage:\s*(\d+)\/(\d+);\s*(\d+)\s*remaining/g;
    let match;
    
    while ((match = tokenRegex.exec(content)) !== null) {
        checkpoints.push({
            used: parseInt(match[1]),
            budget: parseInt(match[2]),
            remaining: parseInt(match[3])
        });
    }
    
    return { checkpoints, content };
}

// Extract pattern events
function extractPatternEvents(text) {
    const events = [];
    
    // File creation
    const createRegex = /Created file.*?([^\/\n]+\.md)/g;
    let match;
    
    while ((match = createRegex.exec(text)) !== null) {
        events.push({ type: 'created', name: match[1] });
    }
    
    // Pattern usage
    const patternRegex = /(?:using|retrieved|applied)\s+(?:pattern|L0|L1):?\s*([A-Za-z0-9_-]+)/gi;
    while ((match = patternRegex.exec(text)) !== null) {
        events.push({ type: 'used', name: match[1] });
    }
    
    return events;
}

// Process all checkpoint files
function processAllCheckpoints() {
    if (!fs.existsSync(CHECKPOINTS_DIR)) {
        console.error(`❌ Checkpoints directory not found: ${CHECKPOINTS_DIR}`);
        return;
    }
    
    const files = fs.readdirSync(CHECKPOINTS_DIR)
        .filter(f => f.startsWith('checkpoint-') && f.endsWith('.txt'))
        .sort();
    
    if (files.length === 0) {
        console.log('ℹ️  No checkpoint files found');
        return;
    }
    
    console.log(`📁 Processing ${files.length} checkpoint file(s)...`);
    console.log('');
    
    let data = { sessions: [], patterns: {} };
    
    files.forEach(file => {
        const filePath = path.join(CHECKPOINTS_DIR, file);
        const sessionId = parseInt(file.match(/checkpoint-(\d+)\.txt/)[1]);
        
        const { checkpoints, content } = parseCheckpointFile(filePath);
        
        if (checkpoints.length === 0) {
            console.log(`⚠️  ${file}: No checkpoint data found`);
            return;
        }
        
        const latestCheckpoint = checkpoints[checkpoints.length - 1];
        const totalTokens = latestCheckpoint.used;
        
        // 60/40 split
        const inputTokens = Math.round(totalTokens * 0.6);
        const outputTokens = Math.round(totalTokens * 0.4);
        
        // Calculate cost
        const inputCost = (inputTokens / 1000000) * 3.00;
        const outputCost = (outputTokens / 1000000) * 15.00;
        const totalCost = inputCost + outputCost;
        
        // Extract patterns
        const patterns = extractPatternEvents(content);
        
        // Create session
        const session = {
            id: sessionId,
            type: 'scms',
            startTime: sessionId,
            endTime: sessionId + 3600000, // Estimate 1 hour
            interactions: [],
            patterns: [...new Set(patterns.map(p => p.name))],
            totalCost: totalCost,
            tokenBreakdown: {
                input: inputTokens,
                output: outputTokens,
                thinking: 0,
                tools: 0
            },
            retrievalRatio: 0
        };
        
        data.sessions.push(session);
        
        // Update pattern tracking
        patterns.forEach(p => {
            if (!data.patterns[p.name]) {
                data.patterns[p.name] = 0;
            }
            data.patterns[p.name]++;
        });
        
        console.log(`✅ ${file}:`);
        console.log(`   Tokens: ${totalTokens.toLocaleString()}`);
        console.log(`   Cost: $${totalCost.toFixed(5)}`);
        console.log(`   Patterns: ${patterns.length}`);
        console.log('');
    });
    
    // Save data
    const dataDir = path.dirname(DATA_FILE);
    if (!fs.existsSync(dataDir)) {
        fs.mkdirSync(dataDir, { recursive: true });
    }
    fs.writeFileSync(DATA_FILE, JSON.stringify(data, null, 2), 'utf8');
    
    console.log('─────────────────────────────────────────────────────────────');
    console.log(`✅ Dashboard data updated: ${DATA_FILE}`);
    console.log(`📊 Total sessions: ${data.sessions.length}`);
    console.log(`💰 Total cost: $${data.sessions.reduce((sum, s) => sum + s.totalCost, 0).toFixed(5)}`);
    console.log('');
}

// Watch mode
if (process.argv.includes('--watch')) {
    console.log('👀 Watching checkpoints directory for changes...');
    console.log('Press Ctrl+C to stop');
    console.log('');
    
    processAllCheckpoints();
    
    fs.watch(CHECKPOINTS_DIR, (eventType, filename) => {
        if (filename && filename.endsWith('.txt')) {
            console.log(`📝 Change detected: ${filename}`);
            setTimeout(processAllCheckpoints, 1000); // Debounce
        }
    });
} else {
    processAllCheckpoints();
}
