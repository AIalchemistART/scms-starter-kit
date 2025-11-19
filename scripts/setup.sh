#!/bin/bash
# SCMS Starter Kit - Unix/Mac Setup Script
# Run this after cloning/downloading the starter kit

echo "SCMS Starter Kit Setup"
echo ""

# Step 1: Detect IDE
echo "Detecting IDE..."

IDE="generic"
L0_STRATEGY="auto"  # default: auto-memory for Windsurf, manual for others

if command -v windsurf &> /dev/null; then
    IDE="windsurf"
    echo "Windsurf detected"
    
    # Ask Windsurf users which L0 strategy to use
    echo ""
    echo "=== L0 Layer Configuration ==="
    echo ""
    echo "Windsurf supports TWO L0 strategies:"
    echo ""
    echo "[1] AUTO-MEMORY (Recommended - True SCMS)"
    echo "    - AI creates memories automatically during development"
    echo "    - Temporal decay (unused patterns fade)"
    echo "    - Zero manual overhead"
    echo "    - Best for: Solo developers, rapid iteration"
    echo ""
    echo "[2] MANUAL MARKDOWN (Cross-platform compatible)"
    echo "    - Create markdown files in docs/memories/"
    echo "    - Manual tracking and promotion"
    echo "    - Stable, no decay"
    echo "    - Best for: Teams, shared documentation, compliance needs"
    echo ""
    
    read -p "Choose strategy [1/2] (default: 1): " choice
    
    if [ "$choice" = "2" ]; then
        L0_STRATEGY="manual"
        echo "Manual markdown L0 selected"
    else
        L0_STRATEGY="auto"
        echo "Auto-memory L0 selected (recommended)"
    fi
    
elif command -v cursor &> /dev/null; then
    IDE="cursor"
    L0_STRATEGY="manual"  # Cursor requires manual
    echo "Cursor detected"
else
    IDE="generic"
    L0_STRATEGY="manual"  # Generic requires manual
    echo "Generic AI assistant"
fi

# Step 2: Create project directories
echo ""
echo "Creating directory structure..."

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

# Base directories (always created)
mkdir -p "$PROJECT_ROOT/docs/scms/sops"
mkdir -p "$PROJECT_ROOT/docs/scms/case-studies"
mkdir -p "$PROJECT_ROOT/docs/scms/sessions"
mkdir -p "$PROJECT_ROOT/rules"

# Only create memories/ folder if using manual strategy
if [ "$L0_STRATEGY" = "manual" ]; then
    mkdir -p "$PROJECT_ROOT/docs/scms/memories"
fi

echo "Directories created"

# Step 3: Copy templates
echo ""
echo "Copying documentation templates..."

TEMPLATE_SOURCE="$SCRIPT_DIR/../docs/templates/WORKSPACE_RULES_TEMPLATE.md"
TEMPLATE_DEST="$PROJECT_ROOT/docs/scms/WORKSPACE_RULES.md"

if [ ! -f "$TEMPLATE_DEST" ]; then
    cp "$TEMPLATE_SOURCE" "$TEMPLATE_DEST"
    echo "✓ WORKSPACE_RULES.md created"
else
    echo "  WORKSPACE_RULES.md already exists (not overwriting)"
fi

# Step 4: Initialize memory dashboard
echo ""
echo "Initializing memory dashboard..."

DASHBOARD_PATH="$PROJECT_ROOT/docs/scms/MEMORY_STATUS_DASHBOARD.md"
if [ ! -f "$DASHBOARD_PATH" ]; then
    STRATEGY_LINE=""
    if [ "$L0_STRATEGY" = "auto" ]; then
        STRATEGY_LINE="**Strategy**: Auto-Memory (Windsurf Cascade)"
    else
        STRATEGY_LINE="**Strategy**: Manual Markdown Files"
    fi
    
    cat > "$DASHBOARD_PATH" << EOF
# Memory Status Dashboard

**Last Updated**: $(date +%Y-%m-%d)
**SCMS Status**: Initialized

---

## Active Memories (L0)

$STRATEGY_LINE

No memories yet - will populate as you develop!

---

## Validated Patterns (L1)

Check WORKSPACE_RULES.md for promoted patterns.

---

## Next Steps

1. Customize WORKSPACE_RULES.md for your project
2. Configure your IDE (see config/$IDE/SETUP.md)
3. Start developing - SCMS builds automatically!

EOF
    echo "Dashboard initialized"
else
    echo "  Dashboard already exists"
fi

# Step 5: IDE-specific setup
echo ""
echo "Running $IDE setup..."

case $IDE in
    cursor)
        CURSORRULES="$SCRIPT_DIR/../config/cursor/.cursorrules"
        DEST="$PROJECT_ROOT/.cursorrules"
        
        if [ ! -f "$DEST" ]; then
            cp "$CURSORRULES" "$DEST"
            echo ".cursorrules configured"
        else
            echo "  .cursorrules already exists"
        fi
        ;;
    windsurf)
        if [ "$L0_STRATEGY" = "auto" ]; then
            echo "Auto-memory L0 strategy selected"
            echo ""
            echo "IMPORTANT: Enable Cascade memories in Windsurf:"
            echo "  1. Open Windsurf Settings"
            echo "  2. Enable 'Cascade: Memories'"
            echo "  3. Set memory scope to 'workspace'"
            echo ""
            echo "During development:"
            echo "  - AI will create memories automatically (L0)"
            echo "  - Track retrievals in MEMORY_STATUS_DASHBOARD.md"
            echo "  - Promote to WORKSPACE_RULES.md when retrieved 2+ times"
            echo ""
            echo "See config/windsurf/SETUP.md for detailed instructions"
            
            # Create guide file
            GUIDE_PATH="$PROJECT_ROOT/docs/scms/L0_AUTO_MEMORY_GUIDE.md"
            cat > "$GUIDE_PATH" << 'EOF'
# L0 Auto-Memory Strategy (Windsurf)

**Status**: ACTIVE
**Strategy**: Native Cascade Memories (True SCMS)

## How It Works

1. **AI Creates Memories Automatically**
   - During development, Cascade AI will create memories when it discovers patterns
   - No manual documentation needed
   - Memories appear in Windsurf's memory panel

2. **Track Retrievals**
   - When AI retrieves a memory to solve a problem, that counts as validation
   - Update MEMORY_STATUS_DASHBOARD.md to track retrieval counts

3. **Promote at Threshold**
   - When a memory is retrieved 2+ times, promote to WORKSPACE_RULES.md
   - This makes it permanent (L1 validated pattern)

4. **Temporal Decay**
   - Unused memories (30+ days, <2 retrievals) will naturally decay
   - This keeps your knowledge base clean

## DO NOT:

- Create files in docs/memories/ folder (doesn't exist for auto-memory strategy)
- Manually document patterns
- Override AI memory creation

## Daily Workflow

1. Develop normally
2. When AI suggests a memory, approve it
3. Note when AI retrieves memories
4. Update dashboard with retrieval counts
5. Promote validated memories to WORKSPACE_RULES.md

**This is TRUE SCMS as researched - automatic, temporal, use-validated.**

See: config/windsurf/SETUP.md
EOF
            echo "Created: L0_AUTO_MEMORY_GUIDE.md"
            echo ""
            echo "========================================"
            echo "CRITICAL: Startup Prompt for Each Session"
            echo "========================================"
            echo ""
            echo "Copy-paste this to Cascade AI at the start of EVERY development session:"
            echo ""
            echo "-------- START COPY HERE --------"
            echo ""
            echo "SCMS AUTO-MEMORY MODE ACTIVE:"
            echo ""
            echo "1. CREATE MEMORIES DURING DEVELOPMENT (not after!)"
            echo "   - When you discover reusable pattern -> IMMEDIATELY create Cascade memory"
            echo "   - Do NOT wait until code complete"
            echo ""
            echo "2. DO NOT CREATE MARKDOWN FILES:"
            echo "   - NO docs/memories/*.md"
            echo "   - NO SCMS_REPORT.md or similar"
            echo "   - ONLY update MEMORY_STATUS_DASHBOARD.md for retrieval counts"
            echo ""
            echo "3. WHEN PATTERN RECURS:"
            echo "   - Retrieve memory automatically"
            echo "   - Tell me 'Retrieved [pattern] memory'"
            echo "   - I'll update dashboard"
            echo ""
            echo "4. AT 2+ RETRIEVALS:"
            echo "   - Promote to WORKSPACE_RULES.md"
            echo ""
            echo "This is TRUE SCMS - zero markdown files, memories in Cascade only!"
            echo ""
            echo "-------- END COPY --------"
            echo ""
            echo "Full prompt saved to: SCMS_STARTUP_PROMPT.md"
            
            # Copy startup prompt to docs/scms
            STARTUP_PROMPT_SOURCE="$SCRIPT_DIR/../SCMS_STARTUP_PROMPT.md"
            STARTUP_PROMPT_DEST="$PROJECT_ROOT/docs/scms/SCMS_STARTUP_PROMPT.md"
            if [ -f "$STARTUP_PROMPT_SOURCE" ]; then
                cp "$STARTUP_PROMPT_SOURCE" "$STARTUP_PROMPT_DEST"
            fi
        else
            echo "Manual markdown L0 strategy selected"
            echo "  See config/windsurf/SETUP.md for instructions"
            echo "  Note: You chose manual despite Windsurf's auto-memory support"
        fi
        ;;
    *)
        echo "See config/generic/SETUP.md for manual setup"
        ;;
esac

# Step 6: Make this script executable (if it wasn't)
chmod +x "$SCRIPT_DIR/setup.sh"

# Step 7: Final instructions
echo ""
echo "SCMS Setup Complete!"
echo ""
echo "Next steps:"
echo "1. Edit WORKSPACE_RULES.md with project-specific rules"
echo "2. Configure memories in your IDE (see config/$IDE/SETUP.md)"
echo "3. Start developing - SCMS builds automatically!"
echo ""
echo "Documentation: docs/00_DOCUMENTATION_HIERARCHY.md"
echo "Examples: docs/examples/"
echo ""

# Remind about startup prompt if auto-memory was selected
if [ "$IDE" = "windsurf" ] && [ "$L0_STRATEGY" = "auto" ]; then
    echo "========================================"
    echo "REMINDER: Copy Startup Prompt Above!"
    echo "========================================"
    echo ""
    echo "Scroll up to find the startup prompt, or open:"
    echo "  SCMS_STARTUP_PROMPT.md"
    echo ""
    echo "Paste it to Cascade AI at the start of EVERY session!"
    echo ""
fi

# Offer to launch economic tracking dashboard
echo ""
echo "========================================"
echo "REAL COST TRACKING DASHBOARD"
echo "========================================"
echo ""
echo "📊 Launch the algorithmic cost tracking dashboard?"
echo "   Track actual economic benefits vs theoretical estimates"
echo "   Export data for business case validation"
echo ""
read -p "Launch dashboard now? [Y/n] (default: Y): " launch_dashboard

if [ "$launch_dashboard" != "n" ] && [ "$launch_dashboard" != "N" ]; then
    echo ""
    echo "⚙️  Setting up SCMS Dashboard App..."
    
    PROJECT_ROOT="$SCRIPT_DIR/.."
    PACKAGE_JSON="$PROJECT_ROOT/package.json"
    
    if [ -f "$PACKAGE_JSON" ]; then
        echo "   Installing dependencies..."
        
        # Navigate to project root and install dependencies
        cd "$PROJECT_ROOT"
        npm install > /dev/null 2>&1
        
        echo "   ✅ Dependencies installed!"
        echo ""
        echo "🚀 Launching SCMS Dashboard App (Electron)..."
        
        # Launch Electron app in background
        npm run dashboard:app &
        
        echo ""
        echo "✅ Dashboard app launched!"
        echo ""
        echo "💡 Quick Start:"
        echo "   1. Click 'Start SCMS Session' when using patterns"
        echo "   2. Click 'Start Baseline Session' for comparison"
        echo "   3. Click 'Export Data' when finished - checkpoint auto-generated!"
    else
        echo "⚠️  Setup files not found!"
        echo "   You can launch it manually: npm run dashboard:app"
    fi
else
    echo ""
    echo "You can launch the dashboard anytime with: npm run dashboard:app"
fi

echo ""
