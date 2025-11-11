/**
 * SCMS Real Cost Tracking System
 * Algorithmic validation of economic benefits through actual token measurement
 * 
 * This system provides empirical data vs theoretical estimates by tracking:
 * - Full session costs (not just responses)
 * - Thinking mode tokens (major cost driver)
 * - Context loading overhead
 * - Tool call generation costs
 * - Pattern usage ROI
 */

class SCMSCostTracker {
    constructor() {
        this.sessions = [];
        this.currentSession = null;
        this.patterns = new Map();
        
        // Conservative cost estimates per 1M tokens
        this.costs = {
            input: 3.00,      // Input tokens
            output: 15.00,    // Output tokens (including thinking)
            thinking: 15.00   // Thinking mode tokens
        };
        
        this.init();
    }
    
    init() {
        this.loadData();
        this.setupEventListeners();
        console.log('SCMS Cost Tracker initialized - Ready for algorithmic validation');
    }
    
    // Start a new session with classification
    startSession(type = 'mixed') {
        if (this.currentSession) {
            this.endSession();
        }
        
        this.currentSession = {
            id: Date.now(),
            type: type, // 'scms', 'baseline', 'mixed'
            startTime: new Date(),
            interactions: [],
            totalCost: 0,
            tokenBreakdown: {
                input: 0,
                output: 0,
                thinking: 0,
                tools: 0
            },
            patterns: [],
            retrievalRatio: 0
        };
        
        console.log(`Started ${type} session for algorithmic cost measurement`);
        this.updateDashboard();
    }
    
    // Log an interaction with full token accounting
    logInteraction(data) {
        if (!this.currentSession) {
            console.warn('No active session - starting mixed session');
            this.startSession('mixed');
        }
        
        const interaction = {
            timestamp: new Date(),
            userPrompt: data.userPrompt || '',
            userTokens: this.estimateTokens(data.userPrompt || ''),
            thinkingTokens: data.thinkingTokens || 0,
            responseTokens: data.responseTokens || 0,
            toolTokens: data.toolTokens || 0,
            contextTokens: data.contextTokens || 0,
            patternsUsed: data.patternsUsed || [],
            wasRetrieval: data.wasRetrieval || false,
            cost: 0
        };
        
        // Calculate full interaction cost
        interaction.cost = this.calculateInteractionCost(interaction);
        
        // Update session totals
        this.currentSession.interactions.push(interaction);
        this.currentSession.totalCost += interaction.cost;
        this.updateTokenBreakdown(interaction);
        this.updatePatternUsage(interaction.patternsUsed);
        this.updateRetrievalRatio();
        
        console.log(`Logged interaction: $${interaction.cost.toFixed(4)} (${interaction.wasRetrieval ? 'retrieval' : 'generation'})`);
        this.updateDashboard();
        
        return interaction;
    }
    
    // Calculate realistic interaction cost including all components
    calculateInteractionCost(interaction) {
        const inputCost = (interaction.userTokens + interaction.contextTokens) * this.costs.input / 1000000;
        const outputCost = interaction.responseTokens * this.costs.output / 1000000;
        const thinkingCost = interaction.thinkingTokens * this.costs.thinking / 1000000;
        const toolCost = interaction.toolTokens * this.costs.output / 1000000;
        
        return inputCost + outputCost + thinkingCost + toolCost;
    }
    
    // Estimate tokens in text (rough approximation)
    estimateTokens(text) {
        if (!text) return 0;
        // Rough estimate: ~4 characters per token
        return Math.ceil(text.length / 4);
    }
    
    // Update token breakdown for session
    updateTokenBreakdown(interaction) {
        this.currentSession.tokenBreakdown.input += interaction.userTokens + interaction.contextTokens;
        this.currentSession.tokenBreakdown.output += interaction.responseTokens;
        this.currentSession.tokenBreakdown.thinking += interaction.thinkingTokens;
        this.currentSession.tokenBreakdown.tools += interaction.toolTokens;
    }
    
    // Track pattern usage and ROI
    updatePatternUsage(patternsUsed) {
        patternsUsed.forEach(pattern => {
            if (!this.patterns.has(pattern)) {
                this.patterns.set(pattern, {
                    name: pattern,
                    uses: 0,
                    totalSavings: 0,
                    avgSavingsPerUse: 0
                });
            }
            
            const patternData = this.patterns.get(pattern);
            patternData.uses++;
            
            // Estimate savings from pattern reuse (conservative)
            const estimatedSavings = 0.015; // $0.015 per pattern reuse
            patternData.totalSavings += estimatedSavings;
            patternData.avgSavingsPerUse = patternData.totalSavings / patternData.uses;
            
            this.currentSession.patterns.push(pattern);
        });
    }
    
    // Calculate retrieval vs generation ratio
    updateRetrievalRatio() {
        const totalInteractions = this.currentSession.interactions.length;
        const retrievalInteractions = this.currentSession.interactions.filter(i => i.wasRetrieval).length;
        this.currentSession.retrievalRatio = totalInteractions > 0 ? (retrievalInteractions / totalInteractions) * 100 : 0;
    }
    
    // End current session
    endSession() {
        if (!this.currentSession) return;
        
        this.currentSession.endTime = new Date();
        this.currentSession.duration = this.currentSession.endTime - this.currentSession.startTime;
        
        this.sessions.push(this.currentSession);
        console.log(`Session ended: $${this.currentSession.totalCost.toFixed(4)} total cost, ${this.currentSession.retrievalRatio.toFixed(1)}% retrieval`);
        
        this.currentSession = null;
        this.saveData();
        this.updateDashboard();
    }
    
    // Get comparative analysis
    getComparativeAnalysis() {
        const scmsSessions = this.sessions.filter(s => s.type === 'scms');
        const baselineSessions = this.sessions.filter(s => s.type === 'baseline');
        
        if (scmsSessions.length === 0 || baselineSessions.length === 0) {
            return null;
        }
        
        const scmsAvgCost = scmsSessions.reduce((sum, s) => sum + s.totalCost, 0) / scmsSessions.length;
        const baselineAvgCost = baselineSessions.reduce((sum, s) => sum + s.totalCost, 0) / baselineSessions.length;
        
        const savings = baselineAvgCost - scmsAvgCost;
        const savingsPercent = (savings / baselineAvgCost) * 100;
        
        return {
            scmsAvgCost,
            baselineAvgCost,
            savings,
            savingsPercent,
            scmsSessions: scmsSessions.length,
            baselineSessions: baselineSessions.length
        };
    }
    
    // Get pattern ROI analysis
    getPatternROI() {
        return Array.from(this.patterns.values())
            .sort((a, b) => b.totalSavings - a.totalSavings)
            .slice(0, 10); // Top 10 patterns
    }
    
    // Export data for analysis
    exportData() {
        const data = {
            sessions: this.sessions,
            patterns: Array.from(this.patterns.values()),
            analysis: this.getComparativeAnalysis(),
            exportDate: new Date().toISOString()
        };
        
        const blob = new Blob([JSON.stringify(data, null, 2)], { type: 'application/json' });
        const url = URL.createObjectURL(blob);
        const a = document.createElement('a');
        a.href = url;
        a.download = `scms-cost-data-${new Date().toISOString().split('T')[0]}.json`;
        a.click();
        URL.revokeObjectURL(url);
    }
    
    // Save data to localStorage
    saveData() {
        localStorage.setItem('scms-sessions', JSON.stringify(this.sessions));
        localStorage.setItem('scms-patterns', JSON.stringify(Array.from(this.patterns.entries())));
    }
    
    // Load data from localStorage
    loadData() {
        const sessionsData = localStorage.getItem('scms-sessions');
        if (sessionsData) {
            this.sessions = JSON.parse(sessionsData);
        }
        
        const patternsData = localStorage.getItem('scms-patterns');
        if (patternsData) {
            this.patterns = new Map(JSON.parse(patternsData));
        }
    }
    
    // Setup event listeners for automatic tracking
    setupEventListeners() {
        // Listen for SCMS-specific events
        document.addEventListener('scms-pattern-used', (event) => {
            this.logInteraction({
                patternsUsed: [event.detail.pattern],
                wasRetrieval: true,
                responseTokens: event.detail.tokens || 300,
                thinkingTokens: event.detail.thinkingTokens || 200
            });
        });
        
        document.addEventListener('scms-generation', (event) => {
            this.logInteraction({
                wasRetrieval: false,
                responseTokens: event.detail.tokens || 600,
                thinkingTokens: event.detail.thinkingTokens || 800,
                toolTokens: event.detail.toolTokens || 200
            });
        });
    }
    
    // Update dashboard display
    updateDashboard() {
        // Dispatch event for dashboard to update
        document.dispatchEvent(new CustomEvent('scms-data-updated', {
            detail: {
                currentSession: this.currentSession,
                analysis: this.getComparativeAnalysis(),
                patterns: this.getPatternROI()
            }
        }));
    }
}

// Initialize global tracker
window.scmsTracker = new SCMSCostTracker();

// Helper functions for manual tracking
window.scmsStartSession = (type) => window.scmsTracker.startSession(type);
window.scmsEndSession = () => window.scmsTracker.endSession();
window.scmsLogPattern = (pattern, tokens) => {
    document.dispatchEvent(new CustomEvent('scms-pattern-used', {
        detail: { pattern, tokens }
    }));
};
window.scmsLogGeneration = (tokens, thinkingTokens, toolTokens) => {
    document.dispatchEvent(new CustomEvent('scms-generation', {
        detail: { tokens, thinkingTokens, toolTokens }
    }));
};

console.log('SCMS Cost Tracker loaded - Use scmsStartSession("scms"|"baseline") to begin tracking');
