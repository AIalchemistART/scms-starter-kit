/**
 * SCMS Terminal Dashboard
 * Display cost tracking results in terminal
 */

const fs = require('fs');
const path = require('path');

// Configuration
const DATA_FILE = path.join(__dirname, '..', 'docs', 'tools', 'scms-cost-data.json');

// Color codes for terminal output
const colors = {
    reset: '\x1b[0m',
    bright: '\x1b[1m',
    dim: '\x1b[2m',
    
    red: '\x1b[31m',
    green: '\x1b[32m',
    yellow: '\x1b[33m',
    blue: '\x1b[34m',
    magenta: '\x1b[35m',
    cyan: '\x1b[36m',
    white: '\x1b[37m',
    gray: '\x1b[90m',
    
    bgRed: '\x1b[41m',
    bgGreen: '\x1b[42m',
    bgYellow: '\x1b[43m',
    bgBlue: '\x1b[44m',
    bgCyan: '\x1b[46m'
};

// Formatting helpers
function formatCurrency(amount) {
    return `$${amount.toFixed(5)}`;
}

function formatNumber(num) {
    return num.toLocaleString();
}

function formatPercent(num) {
    return `${num.toFixed(1)}%`;
}

function printHeader(text) {
    const width = 70;
    const padding = Math.floor((width - text.length) / 2);
    console.log('');
    console.log(colors.cyan + '═'.repeat(width) + colors.reset);
    console.log(colors.cyan + ' '.repeat(padding) + colors.bright + text + colors.reset);
    console.log(colors.cyan + '═'.repeat(width) + colors.reset);
    console.log('');
}

function printSection(title) {
    console.log('');
    console.log(colors.yellow + colors.bright + '▶ ' + title + colors.reset);
    console.log(colors.gray + '─'.repeat(70) + colors.reset);
}

function printMetric(label, value, color = colors.white) {
    const padding = 40 - label.length;
    console.log(
        colors.gray + '  ' + label + ':' + ' '.repeat(padding) + 
        color + colors.bright + value + colors.reset
    );
}

function printBar(label, value, maxValue, color) {
    const barWidth = 40;
    const fillWidth = Math.round((value / maxValue) * barWidth);
    const emptyWidth = barWidth - fillWidth;
    
    const bar = color + '█'.repeat(fillWidth) + colors.gray + '░'.repeat(emptyWidth) + colors.reset;
    
    console.log(`  ${label.padEnd(15)} ${bar} ${colors.bright}${formatCurrency(value)}${colors.reset}`);
}

// Load and display dashboard data
function displayDashboard() {
    printHeader('SCMS COST TRACKING DASHBOARD');
    
    // Check if data file exists
    if (!fs.existsSync(DATA_FILE)) {
        console.log(colors.yellow + '⚠️  No tracking data found yet.' + colors.reset);
        console.log('');
        console.log('To start tracking:');
        console.log(colors.cyan + '  1. Run: npm run checkpoint:monitor' + colors.reset);
        console.log(colors.gray + '  2. Work in Cascade normally' + colors.reset);
        console.log(colors.gray + '  3. Copy conversation (Ctrl+A, Ctrl+C)' + colors.reset);
        console.log(colors.gray + '  4. Monitor auto-processes data' + colors.reset);
        console.log(colors.gray + '  5. Run: npm run dashboard (to see results)' + colors.reset);
        console.log('');
        console.log('Or use the web dashboard:');
        console.log(colors.cyan + '  Open: docs/tools/scms-dashboard.html' + colors.reset);
        console.log('');
        return;
    }
    
    // Load data
    let data;
    try {
        const content = fs.readFileSync(DATA_FILE, 'utf8');
        data = JSON.parse(content);
    } catch (err) {
        console.log(colors.red + '❌ Error reading dashboard data:' + colors.reset, err.message);
        return;
    }
    
    // Extract data
    const sessions = data.sessions || [];
    const patterns = data.patterns || {};
    
    if (sessions.length === 0) {
        console.log(colors.yellow + 'ℹ️  No sessions tracked yet.' + colors.reset);
        console.log('');
        console.log('Start tracking with: ' + colors.cyan + 'npm run checkpoint:monitor' + colors.reset);
        console.log('');
        return;
    }
    
    // Calculate totals
    const totalSessions = sessions.length;
    const scmsSessions = sessions.filter(s => s.type === 'scms');
    const baselineSessions = sessions.filter(s => s.type === 'baseline');
    
    const totalCost = sessions.reduce((sum, s) => sum + (s.totalCost || 0), 0);
    const totalTokens = sessions.reduce((sum, s) => 
        sum + (s.tokenBreakdown?.input || 0) + (s.tokenBreakdown?.output || 0), 0
    );
    
    const scmsCost = scmsSessions.reduce((sum, s) => sum + (s.totalCost || 0), 0);
    const baselineCost = baselineSessions.reduce((sum, s) => sum + (s.totalCost || 0), 0);
    
    const avgScmsCost = scmsSessions.length > 0 ? scmsCost / scmsSessions.length : 0;
    const avgBaselineCost = baselineSessions.length > 0 ? baselineCost / baselineSessions.length : 0;
    
    const savings = avgBaselineCost - avgScmsCost;
    const savingsPercent = avgBaselineCost > 0 ? (savings / avgBaselineCost) * 100 : 0;
    
    // Display Overview
    printSection('📊 SESSION OVERVIEW');
    printMetric('Total Sessions', totalSessions.toString(), colors.cyan);
    printMetric('SCMS Sessions', scmsSessions.length.toString(), colors.green);
    printMetric('Baseline Sessions', baselineSessions.length.toString(), colors.yellow);
    printMetric('Total Cost', formatCurrency(totalCost), colors.magenta);
    printMetric('Total Tokens', formatNumber(totalTokens), colors.blue);
    
    // Display Cost Analysis
    printSection('💰 COST ANALYSIS');
    printMetric('Average SCMS Cost', formatCurrency(avgScmsCost), colors.green);
    printMetric('Average Baseline Cost', formatCurrency(avgBaselineCost), colors.yellow);
    
    if (avgBaselineCost > 0) {
        const savingsColor = savingsPercent >= 30 ? colors.green : 
                            savingsPercent >= 20 ? colors.cyan : colors.yellow;
        printMetric('Cost Savings', formatCurrency(savings), savingsColor);
        printMetric('Savings Percentage', formatPercent(savingsPercent), savingsColor);
        
        if (savingsPercent >= 30) {
            console.log(colors.green + '\n  ✅ Exceeding conservative 30-45% target!' + colors.reset);
        } else if (savingsPercent >= 20) {
            console.log(colors.cyan + '\n  ⚡ Good progress toward 30-45% target!' + colors.reset);
        }
    }
    
    // Display Cost Comparison Bar Chart
    if (scmsSessions.length > 0 && baselineSessions.length > 0) {
        printSection('📊 COST COMPARISON');
        const maxCost = Math.max(avgScmsCost, avgBaselineCost);
        printBar('SCMS', avgScmsCost, maxCost, colors.green);
        printBar('Baseline', avgBaselineCost, maxCost, colors.yellow);
    }
    
    // Display Pattern Analytics
    const patternEntries = Object.entries(patterns).sort((a, b) => b[1] - a[1]);
    if (patternEntries.length > 0) {
        printSection('🎯 TOP PATTERNS (by usage)');
        const topPatterns = patternEntries.slice(0, 10);
        
        topPatterns.forEach(([name, uses], index) => {
            const savings = uses * 0.015; // $0.015 per reuse
            const rank = (index + 1).toString().padStart(2, ' ');
            const usesStr = uses.toString().padStart(3, ' ');
            
            console.log(
                colors.gray + `  ${rank}. ` + colors.reset +
                colors.white + name.padEnd(35) + colors.reset +
                colors.cyan + usesStr + ' uses' + colors.reset +
                colors.gray + '  →  ' + colors.reset +
                colors.green + formatCurrency(savings) + ' saved' + colors.reset
            );
        });
        
        const totalPatternUses = patternEntries.reduce((sum, [, uses]) => sum + uses, 0);
        const totalPatternSavings = totalPatternUses * 0.015;
        
        console.log('');
        printMetric('Total Pattern Reuses', totalPatternUses.toString(), colors.cyan);
        printMetric('Total Pattern Savings', formatCurrency(totalPatternSavings), colors.green);
    }
    
    // Display Recent Sessions
    printSection('📅 RECENT SESSIONS');
    const recentSessions = sessions.slice(-5).reverse();
    
    recentSessions.forEach((session, index) => {
        const typeColor = session.type === 'scms' ? colors.green : 
                         session.type === 'baseline' ? colors.yellow : colors.blue;
        const typeLabel = session.type.toUpperCase().padEnd(10);
        
        const date = new Date(session.startTime).toLocaleString();
        const cost = formatCurrency(session.totalCost || 0);
        const tokens = formatNumber(
            (session.tokenBreakdown?.input || 0) + (session.tokenBreakdown?.output || 0)
        );
        
        console.log(
            colors.gray + `  ${index + 1}. ` + colors.reset +
            typeColor + typeLabel + colors.reset +
            colors.gray + date.padEnd(25) + colors.reset +
            colors.magenta + cost.padEnd(12) + colors.reset +
            colors.blue + tokens + ' tokens' + colors.reset
        );
    });
    
    // Display Export Information
    printSection('💾 EXPORT DATA');
    console.log(colors.gray + '  Data location: ' + colors.cyan + DATA_FILE + colors.reset);
    console.log(colors.gray + '  Last updated:  ' + colors.white + new Date(fs.statSync(DATA_FILE).mtime).toLocaleString() + colors.reset);
    console.log('');
    console.log(colors.gray + '  Open web dashboard for export: ' + colors.cyan + 'docs/tools/scms-dashboard.html' + colors.reset);
    
    // Footer
    console.log('');
    console.log(colors.cyan + '═'.repeat(70) + colors.reset);
    console.log(colors.gray + '  Target: 30-45% cost reduction through algorithmic validation' + colors.reset);
    console.log(colors.cyan + '═'.repeat(70) + colors.reset);
    console.log('');
}

// Run dashboard
try {
    displayDashboard();
} catch (err) {
    console.error(colors.red + '❌ Error displaying dashboard:' + colors.reset, err.message);
    process.exit(1);
}
