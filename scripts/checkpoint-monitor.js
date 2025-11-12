/**
 * SCMS Checkpoint Monitor
 * Watches clipboard for Cascade checkpoint data and automatically processes it
 */

const clipboardy = require('clipboardy');
const fs = require('fs');
const path = require('path');

// Configuration
const CHECK_INTERVAL = 3000; // Check clipboard every 3 seconds
const CHECKPOINTS_DIR = path.join(__dirname, '..', 'checkpoints');
const DATA_FILE = path.join(__dirname, '..', 'docs', 'tools', 'scms-cost-data.json');

// Ensure directories exist
if (!fs.existsSync(CHECKPOINTS_DIR)) {
    fs.mkdirSync(CHECKPOINTS_DIR, { recursive: true });
}

let lastClipboard = '';
let sessionId = null;
let monitorActive = false;

// Parse checkpoint data from conversation text
function parseCheckpointData(text) {
    const checkpoints = [];
    
    // Match: Token usage: 78652/200000; 121348 remaining
    const tokenRegex = /Token usage:\s*(\d+)\/(\d+);\s*(\d+)\s*remaining/g;
    let match;
    
    while ((match = tokenRegex.exec(text)) !== null) {
        checkpoints.push({
            used: parseInt(match[1]),
            budget: parseInt(match[2]),
            remaining: parseInt(match[3]),
            timestamp: Date.now()
        });
    }
    
    return checkpoints;
}

// Extract pattern events from conversation
function extractPatternEvents(text) {
    const events = [];
    
    // Match file creation: Created file file:///...
    const createRegex = /Created file.*?([^\/\n]+\.md)/g;
    let match;
    
    while ((match = createRegex.exec(text)) !== null) {
        events.push({
            type: 'pattern_created',
            name: match[1],
            timestamp: Date.now()
        });
    }
    
    // Match pattern usage mentions
    const patternRegex = /(?:using|retrieved|applied)\s+(?:pattern|L0|L1):?\s*([A-Za-z0-9_-]+)/gi;
    while ((match = patternRegex.exec(text)) !== null) {
        events.push({
            type: 'pattern_used',
            name: match[1],
            timestamp: Date.now()
        });
    }
    
    return events;
}

// Save checkpoint data to file
function saveCheckpoint(text, checkpoints) {
    if (!sessionId) {
        sessionId = Date.now();
    }
    
    const filename = path.join(CHECKPOINTS_DIR, `checkpoint-${sessionId}.txt`);
    fs.writeFileSync(filename, text, 'utf8');
    
    console.log(`✅ Checkpoint saved: ${filename}`);
    console.log(`   Found ${checkpoints.length} token measurement(s)`);
    
    // Trigger auto-parse
    processCheckpoint(filename, checkpoints, text);
}

// Process checkpoint and update dashboard data
function processCheckpoint(filename, checkpoints, text) {
    if (checkpoints.length === 0) return;
    
    // Calculate token usage
    const latestCheckpoint = checkpoints[checkpoints.length - 1];
    const totalTokens = latestCheckpoint.used;
    
    // Estimate input/output split (60% input, 40% output based on typical Cascade usage)
    const inputTokens = Math.round(totalTokens * 0.6);
    const outputTokens = Math.round(totalTokens * 0.4);
    
    // Calculate cost ($3/1M input, $15/1M output)
    const inputCost = (inputTokens / 1000000) * 3.00;
    const outputCost = (outputTokens / 1000000) * 15.00;
    const totalCost = inputCost + outputCost;
    
    // Extract pattern events
    const patterns = extractPatternEvents(text);
    
    // Load existing data
    let data = { sessions: [], patterns: {} };
    if (fs.existsSync(DATA_FILE)) {
        try {
            const existing = fs.readFileSync(DATA_FILE, 'utf8');
            data = JSON.parse(existing);
        } catch (err) {
            console.warn('⚠️  Could not parse existing data, starting fresh');
        }
    }
    
    // Update or create current session
    let session = data.sessions.find(s => s.id === sessionId);
    if (!session) {
        session = {
            id: sessionId,
            type: 'scms',
            startTime: sessionId,
            endTime: null,
            interactions: [],
            patterns: [],
            totalCost: 0,
            tokenBreakdown: {
                input: 0,
                output: 0,
                thinking: 0,
                tools: 0
            },
            retrievalRatio: 0
        };
        data.sessions.push(session);
    }
    
    // Update session with checkpoint data
    session.totalCost = totalCost;
    session.tokenBreakdown.input = inputTokens;
    session.tokenBreakdown.output = outputTokens;
    session.endTime = Date.now();
    
    // Add pattern events
    patterns.forEach(p => {
        if (!session.patterns.includes(p.name)) {
            session.patterns.push(p.name);
        }
        
        // Update global pattern tracking
        if (!data.patterns[p.name]) {
            data.patterns[p.name] = 0;
        }
        data.patterns[p.name]++;
    });
    
    // Save updated data
    const dataDir = path.dirname(DATA_FILE);
    if (!fs.existsSync(dataDir)) {
        fs.mkdirSync(dataDir, { recursive: true });
    }
    fs.writeFileSync(DATA_FILE, JSON.stringify(data, null, 2), 'utf8');
    
    console.log(`📊 Dashboard updated:`);
    console.log(`   Total tokens: ${totalTokens.toLocaleString()}`);
    console.log(`   Input: ${inputTokens.toLocaleString()} ($${inputCost.toFixed(5)})`);
    console.log(`   Output: ${outputTokens.toLocaleString()} ($${outputCost.toFixed(5)})`);
    console.log(`   Total cost: $${totalCost.toFixed(5)}`);
    console.log(`   Patterns detected: ${patterns.length}`);
}

// Monitor clipboard
async function monitorClipboard() {
    try {
        const current = await clipboardy.read();
        
        // Check if clipboard changed and contains checkpoint data
        if (current !== lastClipboard && current.length > 100) {
            const checkpoints = parseCheckpointData(current);
            
            if (checkpoints.length > 0) {
                console.log(`\n🔍 Checkpoint data detected!`);
                saveCheckpoint(current, checkpoints);
                lastClipboard = current;
            }
        }
    } catch (err) {
        console.error('❌ Error reading clipboard:', err.message);
    }
}

// Start monitoring
console.log('╔═══════════════════════════════════════════════════════════╗');
console.log('║     SCMS Checkpoint Monitor - Automated Token Tracking    ║');
console.log('╚═══════════════════════════════════════════════════════════╝');
console.log('');
console.log('📋 Monitoring clipboard for Cascade checkpoint data...');
console.log('');
console.log('How to use:');
console.log('  1. Work normally in Cascade');
console.log('  2. When you want to capture checkpoint:');
console.log('     - Select all conversation (Ctrl+A)');
console.log('     - Copy (Ctrl+C)');
console.log('  3. Monitor auto-processes and updates dashboard');
console.log('');
console.log('💾 Data saved to: docs/tools/scms-cost-data.json');
console.log('📁 Checkpoints saved to: checkpoints/');
console.log('');
console.log('Press Ctrl+C to stop monitoring');
console.log('─────────────────────────────────────────────────────────────');
console.log('');

monitorActive = true;
setInterval(monitorClipboard, CHECK_INTERVAL);

// Handle graceful shutdown
process.on('SIGINT', () => {
    console.log('\n');
    console.log('─────────────────────────────────────────────────────────────');
    console.log('🛑 Stopping checkpoint monitor...');
    
    if (sessionId) {
        console.log(`✅ Session ${sessionId} data saved`);
        console.log(`📊 View dashboard: open docs/tools/scms-dashboard.html`);
    }
    
    console.log('');
    process.exit(0);
});
