#!/bin/bash
# SCMS Economic Tracking Dashboard Launcher
# Launches the real-time cost tracking dashboard in your default browser

echo "🚀 Launching SCMS Real Cost Tracking Dashboard..."
echo ""

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DASHBOARD_PATH="$SCRIPT_DIR/docs/tools/scms-dashboard.html"

if [ -f "$DASHBOARD_PATH" ]; then
    echo "✅ Dashboard found at: $DASHBOARD_PATH"
    echo ""
    echo "📊 Opening dashboard in your default browser..."
    echo ""
    echo "🎯 Quick Start:"
    echo "   1. Click 'Start SCMS Session' when using SCMS patterns"
    echo "   2. Click 'Start Baseline Session' for comparison data"
    echo "   3. Develop normally and watch real-time cost tracking"
    echo "   4. Click 'End Session' when done"
    echo ""
    echo "💡 Algorithmic Validation:"
    echo "   Track actual token consumption vs theoretical estimates"
    echo "   Export data after 30 days for statistical analysis"
    echo ""
    
    # Open in default browser (cross-platform)
    if [[ "$OSTYPE" == "darwin"* ]]; then
        # macOS
        open "$DASHBOARD_PATH"
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        # Linux
        xdg-open "$DASHBOARD_PATH" 2>/dev/null || sensible-browser "$DASHBOARD_PATH" 2>/dev/null
    elif [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "cygwin" ]]; then
        # Windows Git Bash
        start "$DASHBOARD_PATH"
    else
        echo "⚠️  Could not detect OS. Please open manually: $DASHBOARD_PATH"
    fi
    
    echo "✨ Dashboard launched! Track your SCMS efficiency in real-time."
else
    echo "❌ Dashboard not found at: $DASHBOARD_PATH"
    echo "   Please ensure you're running this from the SCMS root directory."
fi

echo ""
