# SCMS Starter Kit - Windows Setup Script
# Run this after cloning/downloading the starter kit

Write-Host "SCMS Starter Kit Setup" -ForegroundColor Cyan
Write-Host ""

# Step 1: Project Context & Threshold Configuration
Write-Host "=== SCMS Project Configuration ===" -ForegroundColor Cyan
Write-Host ""
Write-Host "Let's configure your promotion threshold based on your project context." -ForegroundColor Yellow
Write-Host ""

# Project Phase
Write-Host "📐 Project Phase:" -ForegroundColor Cyan
Write-Host ""
Write-Host "[1] Greenfield (Weeks 1-4)" -ForegroundColor Green
Write-Host "    - Patterns still emerging, architecture evolving"
Write-Host "    - Threshold: n≥5 (higher validation bar)"
Write-Host ""
Write-Host "[2] Establishing (Months 2-3)" -ForegroundColor Yellow
Write-Host "    - Patterns stabilizing, core architecture forming"
Write-Host "    - Threshold: n≥3 (moderate validation)"
Write-Host ""
Write-Host "[3] Mature" -ForegroundColor Cyan
Write-Host "    - 4 or more months old"
Write-Host "    - Patterns proven, architecture stable"
Write-Host "    - Threshold: n >= 2 (standard validation)"
Write-Host ""

$phaseChoice = Read-Host "Select project phase [1/2/3]"
$projectPhase = switch ($phaseChoice) {
    "1" { "Greenfield"; 5 }
    "2" { "Establishing"; 3 }
    default { "Mature"; 2 }
}
$baseThreshold = $projectPhase[1]
$phaseName = $projectPhase[0]

Write-Host ""
Write-Host "Selected: $phaseName (threshold: n≥$baseThreshold)" -ForegroundColor Green
Write-Host ""

# Team Size
Write-Host "👥 Team Size:" -ForegroundColor Cyan
Write-Host ""
Write-Host "[1] Solo Developer" -ForegroundColor Green
Write-Host "    - n_unique≥1 (your validation only)"
Write-Host ""
Write-Host "[2] Small Team" -ForegroundColor Yellow
Write-Host "    - 2 to 5 people"
Write-Host "    - n_unique >= 2 (two people must validate)"
Write-Host ""
Write-Host "[3] Large Team" -ForegroundColor Cyan
Write-Host "    - 5 or more people"
Write-Host "    - n_unique >= 3 (three people must validate)"
Write-Host ""

$teamChoice = Read-Host "Select team size [1/2/3] (default: 1)"
$teamConfig = switch ($teamChoice) {
    "2" { "Small Team"; 2 }
    "3" { "Large Team"; 3 }
    default { "Solo"; 1 }
}
$teamSize = $teamConfig[0]
$nUnique = $teamConfig[1]

Write-Host ""
Write-Host "Selected: $teamSize (n_unique≥$nUnique)" -ForegroundColor Green
Write-Host ""

# Domain Characteristics
Write-Host "🔧 Domain Characteristics:" -ForegroundColor Cyan
Write-Host ""
Write-Host "[1] High-churn" -ForegroundColor Green
Write-Host "    - Web, mobile applications"
Write-Host "    - Fast evolution, threshold minus 1"
Write-Host ""
Write-Host "[2] Moderate" -ForegroundColor Yellow
Write-Host "    - General software"
Write-Host "    - Standard evolution, no adjustment"
Write-Host ""
Write-Host "[3] Stable" -ForegroundColor Cyan
Write-Host "    - Embedded, scientific computing"
Write-Host "    - Slow evolution, threshold plus 1"
Write-Host ""

$domainChoice = Read-Host "Select domain [1/2/3] (default: 2)"
$domainConfig = switch ($domainChoice) {
    "1" { "High-churn"; -1 }
    "3" { "Stable"; 1 }
    default { "Moderate"; 0 }
}
$domainType = $domainConfig[0]
$domainAdjust = $domainConfig[1]

# Calculate final threshold
$finalThreshold = [Math]::Max(2, $baseThreshold + $domainAdjust)

Write-Host ""
Write-Host "Selected: $domainType (adjustment: $domainAdjust)" -ForegroundColor Green
Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "YOUR SCMS CONFIGURATION:" -ForegroundColor Yellow
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Project Phase: $phaseName" -ForegroundColor White
Write-Host "Team Size: $teamSize (n_unique≥$nUnique)" -ForegroundColor White
Write-Host "Domain: $domainType" -ForegroundColor White
Write-Host ""
Write-Host "PROMOTION THRESHOLD: n≥$finalThreshold" -ForegroundColor Green
Write-Host ""
Write-Host "This means patterns need $finalThreshold uses before promoting to L1" -ForegroundColor Gray
if ($teamSize -ne 'Solo') {
    Write-Host "AND at least $nUnique unique team members must validate" -ForegroundColor Gray
}
Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Store configuration for later use
$THRESHOLD_CONFIG = @{
    Phase = $phaseName
    BaseThreshold = $baseThreshold
    Team = $teamSize
    NUnique = $nUnique
    Domain = $domainType
    Adjustment = $domainAdjust
    FinalThreshold = $finalThreshold
}

Start-Sleep -Seconds 2

# Step 2: Detect IDE
Write-Host ""
Write-Host "Detecting IDE..." -ForegroundColor Yellow

$IDE = "generic"
$L0_STRATEGY = "auto"  # default: auto-memory for Windsurf, manual for others

if (Get-Command windsurf -ErrorAction SilentlyContinue) {
    $IDE = "windsurf"
    Write-Host "Windsurf detected" -ForegroundColor Green
    
    # Ask Windsurf users which L0 strategy to use
    Write-Host ""
    Write-Host "=== L0 Layer Configuration ==="-ForegroundColor Cyan
    Write-Host ""
    Write-Host "Windsurf supports TWO L0 strategies:" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "[1] AUTO-MEMORY (Recommended - True SCMS)" -ForegroundColor Green
    Write-Host "    - AI creates memories automatically during development"
    Write-Host "    - Temporal decay (unused patterns fade)"
    Write-Host "    - Zero manual overhead"
    Write-Host "    - Best for: Solo developers, rapid iteration"
    Write-Host ""
    Write-Host "[2] MANUAL MARKDOWN (Cross-platform compatible)" -ForegroundColor Yellow
    Write-Host "    - Create markdown files in docs/memories/"
    Write-Host "    - Manual tracking and promotion"
    Write-Host "    - Stable, no decay"
    Write-Host "    - Best for: Teams, shared documentation, compliance needs"
    Write-Host ""
    
    $choice = Read-Host "Choose strategy [1/2] (default: 1)"
    
    if ($choice -eq "2") {
        $L0_STRATEGY = "manual"
        Write-Host "Manual markdown L0 selected" -ForegroundColor Yellow
    } else {
        $L0_STRATEGY = "auto"
        Write-Host "Auto-memory L0 selected (recommended)" -ForegroundColor Green
    }
    
} elseif (Get-Command cursor -ErrorAction SilentlyContinue) {
    $IDE = "cursor"
    $L0_STRATEGY = "manual"  # Cursor requires manual
    Write-Host "Cursor detected" -ForegroundColor Green
} else {
    $IDE = "generic"
    $L0_STRATEGY = "manual"  # Generic requires manual
    Write-Host "Generic AI assistant" -ForegroundColor Gray
}

# Step 2: Create project directories
Write-Host ""
Write-Host "Creating directory structure..." -ForegroundColor Yellow

# Base directories (always created)
$dirs = @(
    "../sops",
    "../case-studies",
    "../sessions"
)

# Only create memories/ folder if using manual strategy
if ($L0_STRATEGY -eq "manual") {
    $dirs += "../memories"
}

foreach ($dir in $dirs) {
    $fullPath = Join-Path $PSScriptRoot $dir
    if (-not (Test-Path $fullPath)) {
        New-Item -ItemType Directory -Path $fullPath -Force | Out-Null
        Write-Host "Created: $dir" -ForegroundColor Green
    } else {
        Write-Host "  Exists: $dir" -ForegroundColor Gray
    }
}

# Step 3: Copy templates
Write-Host ""
Write-Host "Copying documentation templates..." -ForegroundColor Yellow

$templateSource = Join-Path $PSScriptRoot "..\docs\templates\WORKSPACE_RULES_TEMPLATE.md"
$templateDest = Join-Path $PSScriptRoot "..\..\WORKSPACE_RULES.md"

if (-not (Test-Path $templateDest)) {
    Copy-Item -Path $templateSource -Destination $templateDest
    Write-Host "WORKSPACE_RULES.md created" -ForegroundColor Green
} else {
    Write-Host "  WORKSPACE_RULES.md already exists (not overwriting)" -ForegroundColor Gray
}

# Step 4: Initialize memory dashboard
Write-Host ""
Write-Host "Initializing memory dashboard..." -ForegroundColor Yellow

$dashboardPath = Join-Path $PSScriptRoot "..\..\MEMORY_STATUS_DASHBOARD.md"
if (-not (Test-Path $dashboardPath)) {
    $dateStr = Get-Date -Format "yyyy-MM-dd"
    $strategyStr = if ($L0_STRATEGY -eq "auto") { "**Strategy**: Auto-Memory (Windsurf Cascade)" } else { "**Strategy**: Manual Markdown Files" }
    
    $dashboardContent = @"
# Memory Status Dashboard

**Last Updated**: $dateStr
**SCMS Status**: Initialized
**SCMS Version**: v1.4

---

## Project Configuration

**Project Phase**: $($THRESHOLD_CONFIG.Phase)
**Team Size**: $($THRESHOLD_CONFIG.Team) (n_unique >= $($THRESHOLD_CONFIG.NUnique))
**Domain**: $($THRESHOLD_CONFIG.Domain)
**Promotion Threshold**: n >= $($THRESHOLD_CONFIG.FinalThreshold)

*Patterns need $($THRESHOLD_CONFIG.FinalThreshold) uses before promoting to L1 (WORKSPACE_RULES.md)*

---

## Active Memories (L0)

$strategyStr

No memories yet - will populate as you develop!

---

## Validated Patterns (L1)

Check WORKSPACE_RULES.md for promoted patterns.

---

## Next Steps

1. Customize WORKSPACE_RULES.md for your project
2. Configure your IDE (see config/$IDE/SETUP.md)
3. Copy SCMS_STARTUP_PROMPT.md content to AI at each session
4. Start developing - SCMS builds automatically!

"@
    
    Set-Content -Path $dashboardPath -Value $dashboardContent -Encoding UTF8
    Write-Host "Dashboard initialized" -ForegroundColor Green
} else {
    Write-Host "  Dashboard already exists" -ForegroundColor Gray
}

# Step 5: IDE-specific setup
Write-Host ""
Write-Host "Running $IDE setup..." -ForegroundColor Yellow

switch ($IDE) {
    "cursor" {
        $cursorrules = Join-Path $PSScriptRoot "..\config\cursor\.cursorrules"
        $projectRoot = Join-Path $PSScriptRoot "..\..\.."
        $dest = Join-Path $projectRoot ".cursorrules"
        
        if (-not (Test-Path $dest)) {
            Copy-Item -Path $cursorrules -Destination $dest
            Write-Host ".cursorrules configured" -ForegroundColor Green
        } else {
            Write-Host "  .cursorrules already exists" -ForegroundColor Gray
        }
    }
    "windsurf" {
        if ($L0_STRATEGY -eq "auto") {
            Write-Host "Auto-memory L0 strategy selected" -ForegroundColor Green
            Write-Host ""
            Write-Host "IMPORTANT: Enable Cascade memories in Windsurf:" -ForegroundColor Yellow
            Write-Host "  1. Open Windsurf Settings"
            Write-Host "  2. Enable 'Cascade: Memories'"
            Write-Host "  3. Set memory scope to 'workspace'"
            Write-Host ""
            Write-Host "During development:" -ForegroundColor Cyan
            Write-Host "  - AI will create memories automatically (L0)"
            Write-Host "  - Track retrievals in MEMORY_STATUS_DASHBOARD.md"
            Write-Host "  - Promote to WORKSPACE_RULES.md when retrieved 2+ times"
            Write-Host ""
            Write-Host "See config/windsurf/SETUP.md for detailed instructions" -ForegroundColor Gray
            
            # Create guide file
            $guidePath = Join-Path $PSScriptRoot "..\..\L0_AUTO_MEMORY_GUIDE.md"
            $guideContent = @"
# L0 Auto-Memory Strategy (Windsurf)

**Status**: ACTIVE
**Strategy**: Native Cascade Memories (True SCMS)

## How It Works

1. AI Creates Memories Automatically
   - During development, Cascade AI will create memories when it discovers patterns
   - No manual documentation needed
   - Memories appear in Windsurf memory panel

2. Track Retrievals
   - When AI retrieves a memory to solve a problem, that counts as validation
   - Update MEMORY_STATUS_DASHBOARD.md to track retrieval counts

3. Promote at Threshold
   - When a memory reaches your threshold, promote to WORKSPACE_RULES.md
   - This makes it permanent (L1 validated pattern)
   - Check MEMORY_STATUS_DASHBOARD.md for your configured threshold

4. Temporal Decay
   - Unused memories (30 days or more without reaching threshold) will naturally decay
   - This keeps your knowledge base clean

## DO NOT

- Create files in docs/memories/ folder (does not exist for auto-memory strategy)
- Manually document patterns
- Override AI memory creation

## Daily Workflow

1. Develop normally
2. When AI suggests a memory, approve it
3. Note when AI retrieves memories
4. Update dashboard with retrieval counts
5. Promote validated memories to WORKSPACE_RULES.md when threshold reached

This is TRUE SCMS as researched - automatic, temporal, use-validated.

See: config/windsurf/SETUP.md
"@
            Set-Content -Path $guidePath -Value $guideContent -Encoding UTF8
            Write-Host "Created: L0_AUTO_MEMORY_GUIDE.md" -ForegroundColor Green
            Write-Host ""
            Write-Host "========================================" -ForegroundColor Cyan
            Write-Host "CRITICAL: Startup Prompt for Each Session" -ForegroundColor Yellow
            Write-Host "========================================" -ForegroundColor Cyan
            Write-Host ""
            Write-Host "Copy-paste this to Cascade AI at the start of EVERY development session:" -ForegroundColor White
            Write-Host ""
            Write-Host "-------- START COPY HERE --------" -ForegroundColor Gray
            Write-Host ""
            Write-Host "SCMS AUTO-MEMORY MODE ACTIVE:" -ForegroundColor Green
            Write-Host ""
            Write-Host "1. CREATE MEMORIES DURING DEVELOPMENT (not after!)" -ForegroundColor White
            Write-Host "   - When you discover reusable pattern -> IMMEDIATELY create Cascade memory"
            Write-Host "   - Do NOT wait until code complete"
            Write-Host ""
            Write-Host "2. DO NOT CREATE MARKDOWN FILES:" -ForegroundColor White
            Write-Host "   - NO docs/memories/*.md"
            Write-Host "   - NO SCMS_REPORT.md or similar"
            Write-Host "   - ONLY update MEMORY_STATUS_DASHBOARD.md for retrieval counts"
            Write-Host ""
            Write-Host "3. WHEN PATTERN RECURS:" -ForegroundColor White
            Write-Host "   - Retrieve memory automatically"
            Write-Host "   - Tell me 'Retrieved [pattern] memory'"
            Write-Host "   - I'll update dashboard"
            Write-Host ""
            Write-Host "4. AT 2+ RETRIEVALS:" -ForegroundColor White
            Write-Host "   - Promote to WORKSPACE_RULES.md"
            Write-Host ""
            Write-Host "This is TRUE SCMS - zero markdown files, memories in Cascade only!" -ForegroundColor Green
            Write-Host ""
            Write-Host "-------- END COPY --------" -ForegroundColor Gray
            Write-Host ""
            Write-Host "Full prompt saved to: SCMS_STARTUP_PROMPT.md" -ForegroundColor Gray
            
            # Copy startup prompt to project root
            $startupPromptSource = Join-Path $PSScriptRoot "..\SCMS_STARTUP_PROMPT.md"
            $startupPromptDest = Join-Path $PSScriptRoot "..\..\SCMS_STARTUP_PROMPT.md"
            if (Test-Path $startupPromptSource) {
                Copy-Item -Path $startupPromptSource -Destination $startupPromptDest -Force
            }
            
        } else {
            Write-Host "Manual markdown L0 strategy selected" -ForegroundColor Yellow
            Write-Host "  See config/windsurf/SETUP.md for instructions" -ForegroundColor Gray
            Write-Host "  Note: You chose manual despite Windsurf auto-memory support" -ForegroundColor Gray
        }
    }
    default {
        Write-Host "See config/generic/SETUP.md for manual setup" -ForegroundColor Gray
    }
}

# Step 6: Final instructions
Write-Host ""
Write-Host 'SCMS Setup Complete!' -ForegroundColor Green
Write-Host ""
Write-Host 'Next steps:' -ForegroundColor Cyan
Write-Host '1. Edit WORKSPACE_RULES.md with project-specific rules' -ForegroundColor White
Write-Host ('2. Configure memories in your IDE (see config/' + $IDE + '/SETUP.md)') -ForegroundColor White
Write-Host '3. Start developing - SCMS builds automatically!' -ForegroundColor White
Write-Host ""
Write-Host 'Documentation: docs/00_DOCUMENTATION_HIERARCHY.md' -ForegroundColor Gray
Write-Host 'Examples: docs/examples/' -ForegroundColor Gray
Write-Host ""

# Remind about startup prompt if auto-memory was selected
if ($IDE -eq 'windsurf' -and $L0_STRATEGY -eq 'auto') {
    Write-Host '========================================' -ForegroundColor Cyan
    Write-Host 'REMINDER: Copy Startup Prompt Above!' -ForegroundColor Yellow
    Write-Host '========================================' -ForegroundColor Cyan
    Write-Host ""
    Write-Host 'Scroll up to find the startup prompt, or open:' -ForegroundColor White
    Write-Host '  SCMS_STARTUP_PROMPT.md' -ForegroundColor Green
    Write-Host ""
    Write-Host 'Paste it to Cascade AI at the start of EVERY session!' -ForegroundColor Yellow
    Write-Host ""
}
