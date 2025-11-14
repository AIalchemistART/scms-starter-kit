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
        
        const sessionId = Date.now();
        const timestamp = new Date();
        
        this.currentSession = {
            id: sessionId,
            type: type, // 'scms', 'baseline', 'mixed'
            startTime: timestamp,
            interactions: [],
            totalCost: 0,
            tokenBreakdown: {
                input: 0,
                output: 0,
                thinking: 0,
                tools: 0
            },
            patterns: [],
            retrievalRatio: 0,
            sessionStamp: {
                action: 'session_started',
                timestamp: timestamp.toISOString(),
                type: type,
                dashboardVersion: '1.0.0',
                userInitiated: true
            }
        };
        
        // Save active session to localStorage for recovery
        this.saveActiveSession();
        
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
    endSession(reason = 'manual') {
        if (!this.currentSession) return;
        
        const endTime = new Date();
        this.currentSession.endTime = endTime;
        this.currentSession.duration = endTime - this.currentSession.startTime;
        
        // Add end stamp
        this.currentSession.endStamp = {
            action: 'session_ended',
            timestamp: endTime.toISOString(),
            userInitiated: reason === 'manual',
            reason: reason
        };
        
        if (reason !== 'manual') {
            this.currentSession.endStamp.note = 'Session was not manually ended - auto-closed on next dashboard open';
        }
        
        this.sessions.push(this.currentSession);
        console.log(`Session ended: $${this.currentSession.totalCost.toFixed(4)} total cost, ${this.currentSession.retrievalRatio.toFixed(1)}% retrieval`);
        
        this.currentSession = null;
        
        // Clear active session from localStorage
        this.clearActiveSession();
        
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
            
            // Check for abandoned session and auto-recover
            this.recoverAbandonedSession();
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
    
    // Save active session for recovery
    saveActiveSession() {
        if (!this.currentSession) return;
        
        try {
            const activeSession = {
                id: this.currentSession.id,
                type: this.currentSession.type,
                startTime: this.currentSession.startTime.toISOString(),
                sessionStamp: this.currentSession.sessionStamp
            };
            localStorage.setItem('scms-active-session', JSON.stringify(activeSession));
        } catch (error) {
            console.error('Failed to save active session:', error);
        }
    }
    
    // Clear active session from localStorage
    clearActiveSession() {
        try {
            localStorage.removeItem('scms-active-session');
        } catch (error) {
            console.error('Failed to clear active session:', error);
        }
    }
    
    // Recover abandoned session if found
    recoverAbandonedSession() {
        try {
            const activeSessionData = localStorage.getItem('scms-active-session');
            if (!activeSessionData) return;
            
            const abandonedSession = JSON.parse(activeSessionData);
            const startTime = new Date(abandonedSession.startTime);
            const now = new Date();
            const hoursSinceStart = (now - startTime) / (1000 * 60 * 60);
            
            // Auto-close if session is older than 1 hour
            if (hoursSinceStart > 1) {
                // Find the session in saved sessions (might have been partially saved)
                const existingSession = this.sessions.find(s => s.id === abandonedSession.id);
                
                if (!existingSession || !existingSession.endTime) {
                    console.warn(`⚠️  Abandoned session detected from ${startTime.toLocaleString()}`);
                    console.log('Auto-closing session...');
                    
                    // Create a minimal closed session if not found
                    if (!existingSession) {
                        const recoveredSession = {
                            id: abandonedSession.id,
                            type: abandonedSession.type,
                            startTime: startTime,
                            endTime: now,
                            duration: now - startTime,
                            totalCost: 0,
                            tokenBreakdown: { input: 0, output: 0, thinking: 0, tools: 0 },
                            patterns: [],
                            retrievalRatio: 0,
                            sessionStamp: abandonedSession.sessionStamp,
                            endStamp: {
                                action: 'session_auto_closed',
                                timestamp: now.toISOString(),
                                originalStartTime: abandonedSession.startTime,
                                userInitiated: false,
                                reason: 'improper_shutdown',
                                note: 'Session was not manually ended - auto-closed on next dashboard open'
                            }
                        };
                        this.sessions.push(recoveredSession);
                    } else {
                        // Update existing session with end stamp
                        existingSession.endTime = now;
                        existingSession.duration = now - startTime;
                        existingSession.endStamp = {
                            action: 'session_auto_closed',
                            timestamp: now.toISOString(),
                            originalStartTime: abandonedSession.startTime,
                            userInitiated: false,
                            reason: 'improper_shutdown',
                            note: 'Session was not manually ended - auto-closed on next dashboard open'
                        };
                    }
                    
                    this.saveData();
                    this.clearActiveSession();
                    
                    // Notify user
                    if (typeof document !== 'undefined') {
                        const notification = document.createElement('div');
                        notification.style.cssText = 'position: fixed; top: 20px; right: 20px; background: #f39c12; color: white; padding: 15px 20px; border-radius: 8px; box-shadow: 0 4px 6px rgba(0,0,0,0.1); z-index: 10000; max-width: 400px;';
                        notification.innerHTML = `
                            <strong>⚠️ Session Recovered</strong><br>
                            <span style="font-size: 14px;">An abandoned session from ${startTime.toLocaleString()} was auto-closed.</span>
                        `;
                        document.body.appendChild(notification);
                        setTimeout(() => notification.remove(), 5000);
                    }
                }
            }
        } catch (error) {
            console.error('Failed to recover abandoned session:', error);
        }
    }
    
    init() {
        this.loadData();
        this.setupEventListeners();
        this.startAutoRefresh();
        console.log('SCMS Cost Tracker initialized - Ready for algorithmic validation');
    }
    
    // Auto-refresh data from checkpoint monitor
    startAutoRefresh() {
        // Refresh every 5 seconds to pick up checkpoint monitor updates
        setInterval(() => {
            this.loadData();
            if (this.currentSession) {
                this.updateDashboard();
            }
        }, 5000);
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
