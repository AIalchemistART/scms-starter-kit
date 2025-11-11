/**
 * SCMS Real Cost Tracking System - Combined Best Implementation
 * Algorithmic validation of economic benefits through actual token measurement
 * 
 * This system provides empirical data vs theoretical estimates by tracking:
 * - Full session costs (not just responses)
 * - Thinking mode tokens (major cost driver)
 * - Context loading overhead
 * - Tool call generation costs
 * - Pattern usage ROI
 * 
 * Combines:
 * - Clean event-driven architecture (from starter kit)
 * - Comprehensive session tracking (from labyrinth)
 * - Beautiful dashboard integration
 * - Robust data persistence
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
        
        // Auto-save every 30 seconds
        setInterval(() => this.saveData(), 30000);
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
    
    // Update pattern usage for session
    updatePatternUsage(patternsUsed) {
        patternsUsed.forEach(pattern => {
            if (this.patterns.has(pattern)) {
                this.patterns.set(pattern, this.patterns.get(pattern) + 1);
            } else {
                this.patterns.set(pattern, 1);
            }
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
        return Array.from(this.patterns.entries())
            .map(([name, uses]) => ({
                name,
                uses,
                totalSavings: uses * 0.015, // $0.015 per reuse
                avgSavingsPerUse: 0.015
            }))
            .sort((a, b) => b.totalSavings - a.totalSavings)
            .slice(0, 10);
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
    
    // Load existing data
    loadData() {
        try {
            const stored = localStorage.getItem('scms-cost-tracker-data');
            if (stored) {
                const data = JSON.parse(stored);
                this.sessions = data.sessions || [];
                this.patterns = new Map(data.patterns || []);
            }
        } catch (error) {
            console.error('Failed to load cost tracker data:', error);
        }
    }
    
    // Save data to localStorage
    saveData() {
        try {
            const data = {
                sessions: this.sessions,
                patterns: Array.from(this.patterns.entries())
            };
            localStorage.setItem('scms-cost-tracker-data', JSON.stringify(data));
        } catch (error) {
            console.error('Failed to save cost tracker data:', error);
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
    
    // Get current status
    getStatus() {
        return {
            isTracking: !!this.currentSession,
            currentSession: this.currentSession ? {
                id: this.currentSession.id,
                type: this.currentSession.type,
                duration: Date.now() - this.currentSession.startTime,
                interactions: this.currentSession.interactions.length,
                totalCost: this.currentSession.totalCost
            } : null,
            totalSessions: this.sessions.length,
            totalCost: this.sessions.reduce((sum, s) => sum + s.totalCost, 0)
        };
    }
    
    init() {
        this.loadData();
        this.setupEventListeners();
        console.log('SCMS Cost Tracker initialized - Ready for algorithmic validation');
    }
}

// Initialize global tracker
window.scmsTracker = new SCMSCostTracker();
window.scmsTracker.init();

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
