# SCMS Starter Kit - Windows Setup Script

Write-Host 'SCMS Starter Kit Setup' -ForegroundColor Cyan
Write-Host ''

# Determine project root - where files should be created
# User should run this script from their project root, or we'll use parent of scms dir
$projectRoot = if (Test-Path (Join-Path $PSScriptRoot '..\..\..')) {
    # Running from docs/scms/scripts - go up to project root
    Resolve-Path (Join-Path $PSScriptRoot '..\..\..')
} else {
    # Running from elsewhere - use current directory
    Get-Location
}

Write-Host "Project root: $projectRoot" -ForegroundColor Gray
Write-Host ''

# Project Context
Write-Host '=== SCMS Project Configuration ===' -ForegroundColor Cyan
Write-Host ''
Write-Host 'Configure your promotion threshold based on project context' -ForegroundColor Yellow
Write-Host ''

# Project Phase
Write-Host 'Project Phase:' -ForegroundColor Cyan
Write-Host '[1] Greenfield (Weeks 1-4) - Threshold: n>=5'
Write-Host '[2] Establishing (Months 2-3) - Threshold: n>=3'
Write-Host '[3] Mature (4+ months) - Threshold: n>=2'
Write-Host ''
$phaseChoice = Read-Host 'Select project phase [1/2/3]'
$projectPhase = switch ($phaseChoice) {
    '1' { 'Greenfield'; 5 }
    '2' { 'Establishing'; 3 }
    default { 'Mature'; 2 }
}
$baseThreshold = $projectPhase[1]
$phaseName = $projectPhase[0]
Write-Host ''
Write-Host "Selected: $phaseName (threshold: n>=$baseThreshold)" -ForegroundColor Green
Write-Host ''

# Team Size
Write-Host 'Team Size:' -ForegroundColor Cyan
Write-Host '[1] Solo Developer - n_unique>=1'
Write-Host '[2] Small Team (2-5) - n_unique>=2'
Write-Host '[3] Large Team (5+) - n_unique>=3'
Write-Host ''
$teamChoice = Read-Host 'Select team size [1/2/3] (default: 1)'
$teamConfig = switch ($teamChoice) {
    '2' { 'Small Team'; 2 }
    '3' { 'Large Team'; 3 }
    default { 'Solo'; 1 }
}
$teamSize = $teamConfig[0]
$nUnique = $teamConfig[1]
Write-Host ''
Write-Host "Selected: $teamSize (n_unique>=$nUnique)" -ForegroundColor Green
Write-Host ''

# Domain
Write-Host 'Domain Characteristics:' -ForegroundColor Cyan
Write-Host '[1] High-churn (web, mobile) - threshold minus 1'
Write-Host '[2] Moderate (general) - no adjustment'
Write-Host '[3] Stable (embedded, scientific) - threshold plus 1'
Write-Host ''
$domainChoice = Read-Host 'Select domain [1/2/3] (default: 2)'
$domainConfig = switch ($domainChoice) {
    '1' { 'High-churn'; -1 }
    '3' { 'Stable'; 1 }
    default { 'Moderate'; 0 }
}
$domainType = $domainConfig[0]
$domainAdjust = $domainConfig[1]

# Calculate threshold
$finalThreshold = [Math]::Max(2, $baseThreshold + $domainAdjust)

Write-Host ''
Write-Host "Selected: $domainType (adjustment: $domainAdjust)" -ForegroundColor Green
Write-Host ''
Write-Host '========================================' -ForegroundColor Cyan
Write-Host 'YOUR SCMS CONFIGURATION:' -ForegroundColor Yellow
Write-Host '========================================' -ForegroundColor Cyan
Write-Host "Project Phase: $phaseName" -ForegroundColor White
Write-Host "Team Size: $teamSize (n_unique>=$nUnique)" -ForegroundColor White
Write-Host "Domain: $domainType" -ForegroundColor White
Write-Host ''
Write-Host "PROMOTION THRESHOLD: n>=$finalThreshold" -ForegroundColor Green
Write-Host ''
Write-Host "This means patterns need $finalThreshold uses before promoting to L1" -ForegroundColor Gray
if ($teamSize -ne 'Solo') {
    Write-Host "AND at least $nUnique unique team members must validate" -ForegroundColor Gray
}
Write-Host ''
Write-Host '========================================' -ForegroundColor Cyan
Write-Host ''

# Store config
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

# Detect IDE
Write-Host ''
Write-Host 'Detecting IDE...' -ForegroundColor Yellow
$IDE = 'generic'
$L0_STRATEGY = 'auto'

if (Get-Command windsurf -ErrorAction SilentlyContinue) {
    $IDE = 'windsurf'
    Write-Host 'Windsurf detected' -ForegroundColor Green
    Write-Host ''
    Write-Host 'Choose L0 strategy:' -ForegroundColor Cyan
    Write-Host '[1] AUTO-MEMORY (Recommended)'
    Write-Host '[2] MANUAL MARKDOWN'
    Write-Host ''
    $choice = Read-Host 'Choose strategy [1/2] (default: 1)'
    if ($choice -eq '2') {
        $L0_STRATEGY = 'manual'
        Write-Host 'Manual markdown selected' -ForegroundColor Yellow
    } else {
        $L0_STRATEGY = 'auto'
        Write-Host 'Auto-memory selected' -ForegroundColor Green
    }
} elseif (Get-Command cursor -ErrorAction SilentlyContinue) {
    $IDE = 'cursor'
    $L0_STRATEGY = 'manual'
    Write-Host 'Cursor detected' -ForegroundColor Green
} else {
    $IDE = 'generic'
    $L0_STRATEGY = 'manual'
    Write-Host 'Generic AI assistant' -ForegroundColor Gray
}

# Create directories
Write-Host ''
Write-Host 'Creating directory structure...' -ForegroundColor Yellow

$dirs = @(
    'docs\sops',
    'docs\case-studies',
    'docs\sessions',
    'rules'
)

if ($L0_STRATEGY -eq 'manual') {
    $dirs += 'docs\memories'
}

foreach ($dir in $dirs) {
    $fullPath = Join-Path $projectRoot $dir
    if (-not (Test-Path $fullPath)) {
        New-Item -ItemType Directory -Path $fullPath -Force | Out-Null
        Write-Host "Created: $dir" -ForegroundColor Green
    } else {
        Write-Host "  Exists: $dir" -ForegroundColor Gray
    }
}

# Copy and customize templates
Write-Host ''
Write-Host 'Copying documentation templates...' -ForegroundColor Yellow

# WORKSPACE_RULES.md with customized threshold
$templateSource = Join-Path $PSScriptRoot '..\docs\templates\WORKSPACE_RULES_TEMPLATE.md'
$templateDest = Join-Path $projectRoot 'WORKSPACE_RULES.md'

if (-not (Test-Path $templateDest)) {
    # Read template and replace placeholder threshold with actual calculated value
    $templateContent = Get-Content -Path $templateSource -Raw
    $customizedTemplate = $templateContent -replace '≥2', ">=$($THRESHOLD_CONFIG.FinalThreshold)"
    Set-Content -Path $templateDest -Value $customizedTemplate -Encoding UTF8
    Write-Host "WORKSPACE_RULES.md created (threshold: n>=$($THRESHOLD_CONFIG.FinalThreshold))" -ForegroundColor Green
} else {
    Write-Host '  WORKSPACE_RULES.md already exists' -ForegroundColor Gray
}

# GLOBAL_CODING_RULES.md (L4) with date substitution
$globalRulesSource = Join-Path $PSScriptRoot '..\docs\templates\GLOBAL_CODING_RULES_TEMPLATE.md'
$globalRulesDest = Join-Path $projectRoot 'rules\GLOBAL_CODING_RULES.md'

if (-not (Test-Path $globalRulesDest)) {
    $globalRulesContent = Get-Content -Path $globalRulesSource -Raw
    $dateStr = Get-Date -Format 'yyyy-MM-dd'
    $customizedGlobalRules = $globalRulesContent -replace '\[Date\]', $dateStr
    Set-Content -Path $globalRulesDest -Value $customizedGlobalRules -Encoding UTF8
    Write-Host 'rules/GLOBAL_CODING_RULES.md created (L4 universal constraints)' -ForegroundColor Green
} else {
    Write-Host '  rules/GLOBAL_CODING_RULES.md already exists' -ForegroundColor Gray
}

# Initialize dashboard
Write-Host ''
Write-Host 'Initializing memory dashboard...' -ForegroundColor Yellow

$dashboardPath = Join-Path $projectRoot 'MEMORY_STATUS_DASHBOARD.md'
if (-not (Test-Path $dashboardPath)) {
    $dateStr = Get-Date -Format 'yyyy-MM-dd'
    $strategyStr = if ($L0_STRATEGY -eq 'auto') { '**Strategy**: Auto-Memory (Windsurf Cascade)' } else { '**Strategy**: Manual Markdown Files' }
    
    $dashboardContent = @"
# Memory Status Dashboard

**Last Updated**: $dateStr
**SCMS Status**: Initialized
**SCMS Version**: v1.4

---

## Project Configuration

**Project Phase**: $($THRESHOLD_CONFIG.Phase)
**Team Size**: $($THRESHOLD_CONFIG.Team) (n_unique>=$($THRESHOLD_CONFIG.NUnique))
**Domain**: $($THRESHOLD_CONFIG.Domain)
**Promotion Threshold**: n>=$($THRESHOLD_CONFIG.FinalThreshold)

*Patterns need $($THRESHOLD_CONFIG.FinalThreshold) uses before promoting to L1 (WORKSPACE_RULES.md)*

---

## Active Memories (L0)

$strategyStr

No memories yet - will populate as you develop

---

## Validated Patterns (L1)

Check WORKSPACE_RULES.md for promoted patterns.

---

## Next Steps

1. Customize WORKSPACE_RULES.md for your project
2. Configure your IDE (see config/$IDE/SETUP.md)
3. Copy SCMS_STARTUP_PROMPT.md content to AI at each session
4. Start developing

"@
    
    Set-Content -Path $dashboardPath -Value $dashboardContent -Encoding UTF8
    Write-Host 'Dashboard initialized' -ForegroundColor Green
} else {
    Write-Host '  Dashboard already exists' -ForegroundColor Gray
}

# Generate customized startup prompt
Write-Host ''
Write-Host 'Generating startup prompt...' -ForegroundColor Yellow

$startupPromptPath = Join-Path $projectRoot 'SCMS_STARTUP_PROMPT.md'

if ($IDE -eq 'windsurf' -and $L0_STRATEGY -eq 'auto') {
    # Windsurf Auto-Memory Startup Prompt
    $startupPrompt = @"
# SCMS Startup Prompt - Windsurf Auto-Memory

**Copy this entire content and paste it to Cascade AI at the START of each development session**

---

## SCMS Configuration

- **IDE**: Windsurf
- **L0 Strategy**: Auto-Memory (Cascade Memories)
- **Project Phase**: $($THRESHOLD_CONFIG.Phase)
- **Promotion Threshold**: n>=$($THRESHOLD_CONFIG.FinalThreshold)
- **Team**: $($THRESHOLD_CONFIG.Team) (n_unique>=$($THRESHOLD_CONFIG.NUnique))

---

## Instructions for Cascade AI

You are working in a project using **SCMS v1.4 (Sparse Contextual Memory Scaffolding)** with **AUTO-MEMORY** strategy.

### How SCMS Works (5-Layer Architecture):

**L0 (Auto-Memory)**: Cascade memories - temporal validation (30 day decay)
**L1 (Workspace Rules)**: WORKSPACE_RULES.md - validated patterns (promoted at n>=$($THRESHOLD_CONFIG.FinalThreshold))
**L2 (SOPs)**: docs/sops/ - detailed procedures (created when pattern becomes standard)
**L3 (Case Studies)**: docs/case-studies/ - complete examples (created at feature milestones)
**L4 (Global Rules)**: Universal constraints that apply across all projects

**Key Distinction**: L0-L1 are ACTIVE (enforce patterns), L2-L4 are PASSIVE (reference only, on-demand)

### Dashboard Tracking:

**MEMORY_STATUS_DASHBOARD.md** is your tracking tool:
- Shows all active L0 memories with retrieval counts
- Shows promoted L1 patterns in WORKSPACE_RULES.md
- Lists available L2-L4 reference docs
- YOU update this as patterns progress through layers

### BEFORE You Start Coding:

1. **Check L1 Validated Patterns**
   - Location: WORKSPACE_RULES.md
   - Project-specific patterns promoted at n>=$($THRESHOLD_CONFIG.FinalThreshold)

2. **Check Dashboard**
   - Location: MEMORY_STATUS_DASHBOARD.md
   - Current tracking status

3. **Tell me what you reviewed**
   - Example: "Reviewed L1 patterns for API handling, dashboard shows 3 active patterns"

### Your Workflow:

1. **CREATE MEMORIES DURING DEVELOPMENT**
   - When you discover a reusable pattern, IMMEDIATELY create a Cascade memory
   - Do NOT wait until code is complete
   - Memory title should be descriptive (e.g., "API Error Handling Pattern")

2. **DO NOT CREATE MARKDOWN FILES**
   - NO docs/memories/*.md files
   - NO SCMS_REPORT.md or similar
   - You will track retrievals internally

3. **WHEN PATTERN RECURS**
   - Retrieve the memory automatically
   - Increment internal retrieval counter
   - Tell me "Retrieved [pattern] memory (n=X/$($THRESHOLD_CONFIG.FinalThreshold))"

4. **AT $($THRESHOLD_CONFIG.FinalThreshold) RETRIEVALS - AUTOMATIC PROMOTION TO L1**
   - YOU automatically promote pattern to WORKSPACE_RULES.md
   - Add to the appropriate section with promotion metadata
   - Tell me "PROMOTED: [pattern] to WORKSPACE_RULES.md (validated at n=$($THRESHOLD_CONFIG.FinalThreshold))"
   - Update MEMORY_STATUS_DASHBOARD.md to reflect the promotion

5. **WHEN PATTERN BECOMES STANDARD (>=5 uses) - AUTOMATIC PROMOTION TO L2**
   - YOU automatically create detailed SOP in docs/sops/
   - Include step-by-step implementation guide
   - Tell me "CREATED L2 SOP: [pattern] (procedural documentation)"
   - Update dashboard with L2 reference

6. **AT FEATURE MILESTONES - AUTOMATIC PROMOTION TO L3**
   - When a feature is complete, YOU automatically create case study in docs/case-studies/
   - Show pattern usage in complete working context
   - Tell me "CREATED L3 CASE STUDY: [feature] (architectural example)"
   - Update dashboard with L3 reference

7. **BEFORE MARKING TASK COMPLETE - FINAL QUALITY CHECK (L4)**
   - Check rules/GLOBAL_CODING_RULES.md (if it exists)
   - Validate code against universal constraints
   - If violations found: Tell me "WARNING L4 VIOLATION: [rule] - [issue]" and fix automatically
   - If compliant: Tell me "VERIFIED L4 COMPLIANCE: All global rules followed"
   - L4 is the FINAL gate, not an upfront constraint

### Remember:
- Memories are TEMPORAL (decay after 30 days without use)
- Promotion threshold: $($THRESHOLD_CONFIG.FinalThreshold) uses
- This is TRUE SCMS - zero markdown files, memories in Cascade only

---

**Session started**: $(Get-Date -Format 'yyyy-MM-dd HH:mm')
"@
} elseif ($IDE -eq 'windsurf' -and $L0_STRATEGY -eq 'manual') {
    # Windsurf Manual Markdown Startup Prompt
    $startupPrompt = @"
# SCMS Startup Prompt - Windsurf Manual Markdown

**Copy this entire content and paste it to Cascade AI at the START of each development session**

---

## SCMS Configuration

- **IDE**: Windsurf
- **L0 Strategy**: Manual Markdown Files
- **Project Phase**: $($THRESHOLD_CONFIG.Phase)
- **Promotion Threshold**: n>=$($THRESHOLD_CONFIG.FinalThreshold)
- **Team**: $($THRESHOLD_CONFIG.Team) (n_unique>=$($THRESHOLD_CONFIG.NUnique))

---

## Instructions for Cascade AI

You are working in a project using **SCMS v1.4 (Sparse Contextual Memory Scaffolding)** with **MANUAL MARKDOWN** strategy.

### How SCMS Works (5-Layer Architecture):

**L0 (Manual Markdown)**: docs/memories/ - pattern documentation
**L1 (Workspace Rules)**: WORKSPACE_RULES.md - validated patterns (promoted at n>=$($THRESHOLD_CONFIG.FinalThreshold))
**L2 (SOPs)**: docs/sops/ - detailed procedures (created when pattern becomes standard)
**L3 (Case Studies)**: docs/case-studies/ - complete examples (created at feature milestones)
**L4 (Global Rules)**: Universal constraints that apply across all projects

**Key Distinction**: L0-L1 are ACTIVE (enforce patterns), L2-L4 are PASSIVE (reference only, on-demand)

### Dashboard Tracking:

**MEMORY_STATUS_DASHBOARD.md** is your tracking tool:
- Shows all active L0 patterns with usage counts
- Shows promoted L1 patterns in WORKSPACE_RULES.md
- Lists available L2-L4 reference docs
- YOU update this as patterns progress through layers

### BEFORE You Start Coding:

1. **Check L1 Validated Patterns**
   - Location: WORKSPACE_RULES.md
   - Project-specific patterns promoted at n>=$($THRESHOLD_CONFIG.FinalThreshold)

2. **Check Dashboard**
   - Location: MEMORY_STATUS_DASHBOARD.md
   - Current tracking status

3. **Tell me what you reviewed**
   - Example: "Reviewed L1 patterns for API handling, dashboard shows 3 active patterns"

### Your Workflow:

1. **DOCUMENT PATTERNS IN MARKDOWN**
   - Create files in docs/memories/ as patterns emerge
   - Use descriptive names (e.g., api-error-handling.md)
   - Track usage count in MEMORY_STATUS_DASHBOARD.md

2. **TRACK PATTERN USAGE**
   - When reusing a pattern, tell me "Retrieved [pattern] memory (n=X/$($THRESHOLD_CONFIG.FinalThreshold))"
   - Update dashboard with new retrieval count

3. **AT $($THRESHOLD_CONFIG.FinalThreshold) USES - AUTOMATIC PROMOTION TO L1**
   - YOU automatically promote pattern to WORKSPACE_RULES.md
   - Add to the appropriate section with promotion metadata
   - Tell me "PROMOTED: [pattern] to WORKSPACE_RULES.md (validated at n=$($THRESHOLD_CONFIG.FinalThreshold))"
   - Update dashboard to reflect the promotion

4. **WHEN PATTERN BECOMES STANDARD (>=5 uses) - AUTOMATIC PROMOTION TO L2**
   - YOU automatically create detailed SOP in docs/sops/
   - Include step-by-step implementation guide
   - Tell me "CREATED L2 SOP: [pattern] (procedural documentation)"
   - Update dashboard with L2 reference

5. **AT FEATURE MILESTONES - AUTOMATIC PROMOTION TO L3**
   - When a feature is complete, YOU automatically create case study in docs/case-studies/
   - Show pattern usage in complete working context
   - Tell me "CREATED L3 CASE STUDY: [feature] (architectural example)"
   - Update dashboard with L3 reference

### Remember:
- Manual tracking required
- Promotion threshold: $($THRESHOLD_CONFIG.FinalThreshold) uses
- Keep MEMORY_STATUS_DASHBOARD.md up to date

---

**Session started**: $(Get-Date -Format 'yyyy-MM-dd HH:mm')
"@
} elseif ($IDE -eq 'cursor') {
    # Cursor Manual Markdown Startup Prompt
    $startupPrompt = @"
# SCMS Startup Prompt - Cursor

**Copy this entire content and paste it to Cursor AI at the START of each development session**

---

## SCMS Configuration

- **IDE**: Cursor
- **L0 Strategy**: Manual Markdown Files
- **Project Phase**: $($THRESHOLD_CONFIG.Phase)
- **Promotion Threshold**: n>=$($THRESHOLD_CONFIG.FinalThreshold)
- **Team**: $($THRESHOLD_CONFIG.Team) (n_unique>=$($THRESHOLD_CONFIG.NUnique))

---

## Instructions for Cursor AI

You are working in a project using **SCMS v1.4 (Sparse Contextual Memory Scaffolding)** with **MANUAL MARKDOWN** strategy.

### How SCMS Works (5-Layer Architecture):

**L0 (Manual Markdown)**: docs/memories/ - pattern documentation
**L1 (Workspace Rules)**: WORKSPACE_RULES.md - validated patterns (promoted at n>=$($THRESHOLD_CONFIG.FinalThreshold))
**L2 (SOPs)**: docs/sops/ - detailed procedures (created when pattern becomes standard)
**L3 (Case Studies)**: docs/case-studies/ - complete examples (created at feature milestones)
**L4 (Global Rules)**: Universal constraints that apply across all projects

**Key Distinction**: L0-L1 are ACTIVE (enforce patterns), L2-L4 are PASSIVE (reference only, on-demand)

### Dashboard Tracking:

**MEMORY_STATUS_DASHBOARD.md** is your tracking tool:
- Shows all active L0 patterns with usage counts
- Shows promoted L1 patterns in WORKSPACE_RULES.md
- Lists available L2-L4 reference docs
- YOU update this as patterns progress through layers

### BEFORE You Start Coding:

1. **Check L1 Validated Patterns**
   - Location: WORKSPACE_RULES.md
   - Project-specific patterns promoted at n>=$($THRESHOLD_CONFIG.FinalThreshold)

2. **Check Dashboard**
   - Location: MEMORY_STATUS_DASHBOARD.md
   - Current tracking status

3. **Tell me what you reviewed**
   - Example: "Reviewed L1 patterns for API handling, dashboard shows 3 active patterns"

### Your Workflow:

1. **DOCUMENT PATTERNS IN MARKDOWN**
   - Create files in docs/memories/ as patterns emerge
   - Use descriptive names (e.g., api-error-handling.md)
   - Track usage count in MEMORY_STATUS_DASHBOARD.md

2. **TRACK PATTERN USAGE**
   - When reusing a pattern, tell me "Retrieved [pattern] memory (n=X/$($THRESHOLD_CONFIG.FinalThreshold))"
   - Update dashboard with new retrieval count

3. **AT $($THRESHOLD_CONFIG.FinalThreshold) USES - AUTOMATIC PROMOTION TO L1**
   - YOU automatically promote pattern to WORKSPACE_RULES.md
   - Add to the appropriate section with promotion metadata
   - Tell me "PROMOTED: [pattern] to WORKSPACE_RULES.md (validated at n=$($THRESHOLD_CONFIG.FinalThreshold))"
   - Update dashboard to reflect the promotion

4. **WHEN PATTERN BECOMES STANDARD (>=5 uses) - AUTOMATIC PROMOTION TO L2**
   - YOU automatically create detailed SOP in docs/sops/
   - Include step-by-step implementation guide
   - Tell me "CREATED L2 SOP: [pattern] (procedural documentation)"
   - Update dashboard with L2 reference

5. **AT FEATURE MILESTONES - AUTOMATIC PROMOTION TO L3**
   - When a feature is complete, YOU automatically create case study in docs/case-studies/
   - Show pattern usage in complete working context
   - Tell me "CREATED L3 CASE STUDY: [feature] (architectural example)"
   - Update dashboard with L3 reference

### Remember:
- Manual tracking required
- Promotion threshold: $($THRESHOLD_CONFIG.FinalThreshold) uses
- Keep MEMORY_STATUS_DASHBOARD.md up to date

---

**Session started**: $(Get-Date -Format 'yyyy-MM-dd HH:mm')
"@
} else {
    # Generic AI Assistant Startup Prompt
    $startupPrompt = @"
# SCMS Startup Prompt - Generic AI Assistant

**Copy this entire content and paste it to your AI assistant at the START of each development session**

---

## SCMS Configuration

- **L0 Strategy**: Manual Markdown Files
- **Project Phase**: $($THRESHOLD_CONFIG.Phase)
- **Promotion Threshold**: n>=$($THRESHOLD_CONFIG.FinalThreshold)
- **Team**: $($THRESHOLD_CONFIG.Team) (n_unique>=$($THRESHOLD_CONFIG.NUnique))

---

## Instructions for AI Assistant

You are working in a project using **SCMS v1.4 (Sparse Contextual Memory Scaffolding)** with **MANUAL MARKDOWN** strategy.

### How SCMS Works (5-Layer Architecture):

**L0 (Manual Markdown)**: docs/memories/ - pattern documentation
**L1 (Workspace Rules)**: WORKSPACE_RULES.md - validated patterns (promoted at n>=$($THRESHOLD_CONFIG.FinalThreshold))
**L2 (SOPs)**: docs/sops/ - detailed procedures (created when pattern becomes standard)
**L3 (Case Studies)**: docs/case-studies/ - complete examples (created at feature milestones)
**L4 (Global Rules)**: Universal constraints that apply across all projects

**Key Distinction**: L0-L1 are ACTIVE (enforce patterns), L2-L4 are PASSIVE (reference only, on-demand)

### Dashboard Tracking:

**MEMORY_STATUS_DASHBOARD.md** is your tracking tool:
- Shows all active L0 patterns with usage counts
- Shows promoted L1 patterns in WORKSPACE_RULES.md
- Lists available L2-L4 reference docs
- YOU update this as patterns progress through layers

### BEFORE You Start Coding:

1. **Check L1 Validated Patterns**
   - Location: WORKSPACE_RULES.md
   - Project-specific patterns promoted at n>=$($THRESHOLD_CONFIG.FinalThreshold)

2. **Check Dashboard**
   - Location: MEMORY_STATUS_DASHBOARD.md
   - Current tracking status

3. **Tell me what you reviewed**
   - Example: "Reviewed L1 patterns for API handling, dashboard shows 3 active patterns"

### Your Workflow:

1. **DOCUMENT PATTERNS IN MARKDOWN**
   - Create files in docs/memories/ as patterns emerge
   - Use descriptive names (e.g., api-error-handling.md)
   - Track usage count in MEMORY_STATUS_DASHBOARD.md

2. **TRACK PATTERN USAGE**
   - When reusing a pattern, tell me "Retrieved [pattern] memory (n=X/$($THRESHOLD_CONFIG.FinalThreshold))"
   - Update dashboard with new retrieval count

3. **AT $($THRESHOLD_CONFIG.FinalThreshold) USES - AUTOMATIC PROMOTION TO L1**
   - YOU automatically promote pattern to WORKSPACE_RULES.md
   - Add to the appropriate section with promotion metadata
   - Tell me "PROMOTED: [pattern] to WORKSPACE_RULES.md (validated at n=$($THRESHOLD_CONFIG.FinalThreshold))"
   - Update dashboard to reflect the promotion

4. **WHEN PATTERN BECOMES STANDARD (>=5 uses) - AUTOMATIC PROMOTION TO L2**
   - YOU automatically create detailed SOP in docs/sops/
   - Include step-by-step implementation guide
   - Tell me "CREATED L2 SOP: [pattern] (procedural documentation)"
   - Update dashboard with L2 reference

5. **AT FEATURE MILESTONES - AUTOMATIC PROMOTION TO L3**
   - When a feature is complete, YOU automatically create case study in docs/case-studies/
   - Show pattern usage in complete working context
   - Tell me "CREATED L3 CASE STUDY: [feature] (architectural example)"
   - Update dashboard with L3 reference

### Remember:
- Manual tracking required
- Promotion threshold: $($THRESHOLD_CONFIG.FinalThreshold) uses
- Keep MEMORY_STATUS_DASHBOARD.md up to date

---

**Session started**: $(Get-Date -Format 'yyyy-MM-dd HH:mm')
"@
}

Set-Content -Path $startupPromptPath -Value $startupPrompt -Encoding UTF8
Write-Host 'Startup prompt generated' -ForegroundColor Green

# IDE setup
Write-Host ''
Write-Host "Running $IDE setup..." -ForegroundColor Yellow

switch ($IDE) {
    'cursor' {
        $cursorrules = Join-Path $PSScriptRoot '..\config\cursor\.cursorrules'
        $dest = Join-Path $projectRoot '.cursorrules'
        
        if (-not (Test-Path $dest)) {
            Copy-Item -Path $cursorrules -Destination $dest
            Write-Host '.cursorrules configured' -ForegroundColor Green
        } else {
            Write-Host '  .cursorrules already exists' -ForegroundColor Gray
        }
    }
    'windsurf' {
        if ($L0_STRATEGY -eq 'auto') {
            Write-Host 'Auto-memory L0 strategy selected' -ForegroundColor Green
            Write-Host 'See config/windsurf/SETUP.md for instructions' -ForegroundColor Gray
        } else {
            Write-Host 'Manual markdown L0 strategy selected' -ForegroundColor Yellow
            Write-Host '  See config/windsurf/SETUP.md for instructions' -ForegroundColor Gray
        }
    }
    default {
        Write-Host 'See config/generic/SETUP.md for manual setup' -ForegroundColor Gray
    }
}

# Final message
Write-Host ''
Write-Host 'Setup complete - see WORKSPACE_RULES.md to begin' -ForegroundColor Green
Write-Host ''

# Startup prompt reminder - ALL users need this
Write-Host ''
Write-Host '========================================' -ForegroundColor Cyan
Write-Host 'IMPORTANT: STARTUP PROMPT REQUIRED' -ForegroundColor Yellow
Write-Host '========================================' -ForegroundColor Cyan
Write-Host ''
Write-Host 'To complete SCMS setup:' -ForegroundColor White
Write-Host '1. Open SCMS_STARTUP_PROMPT.md in this directory' -ForegroundColor White
Write-Host '2. Copy the entire content' -ForegroundColor White
Write-Host '3. Paste it to your AI assistant at the START of each dev session' -ForegroundColor White
Write-Host ''

# Add specific notes based on setup
if ($IDE -eq 'windsurf' -and $L0_STRATEGY -eq 'auto') {
    Write-Host 'This tells Cascade how to use SCMS auto-memory correctly' -ForegroundColor Gray
} elseif ($IDE -eq 'windsurf' -and $L0_STRATEGY -eq 'manual') {
    Write-Host 'This tells Cascade how to use SCMS with manual markdown files' -ForegroundColor Gray
} elseif ($IDE -eq 'cursor') {
    Write-Host 'This tells Cursor how to use SCMS with manual markdown files' -ForegroundColor Gray
} else {
    Write-Host 'This tells your AI how to use SCMS correctly' -ForegroundColor Gray
}
Write-Host ''

# Offer to launch economic tracking dashboard
Write-Host ''
Write-Host '========================================' -ForegroundColor Cyan
Write-Host 'REAL COST TRACKING DASHBOARD' -ForegroundColor Yellow
Write-Host '========================================' -ForegroundColor Cyan
Write-Host ''
Write-Host 'Launch the algorithmic cost tracking dashboard?' -ForegroundColor White
Write-Host '   Track actual economic benefits vs theoretical estimates' -ForegroundColor Gray
Write-Host '   Export data for business case validation' -ForegroundColor Gray
Write-Host ''
$launchDashboard = Read-Host 'Launch dashboard now? [Y/n] (default: Y)'

if ($launchDashboard -ne 'n' -and $launchDashboard -ne 'N') {
    Write-Host ''
    Write-Host 'Launching SCMS Real Cost Tracking Dashboard...' -ForegroundColor Cyan
    
    $dashboardPath = Join-Path $PSScriptRoot '..\docs\tools\scms-dashboard.html'
    
    if (Test-Path $dashboardPath) {
        Start-Process $dashboardPath
        Write-Host 'Dashboard opened in your browser!' -ForegroundColor Green
        Write-Host ''
        Write-Host 'Quick Start:' -ForegroundColor Cyan
        Write-Host '   1. Click Start SCMS Session when using patterns' -ForegroundColor White
        Write-Host '   2. Click Start Baseline Session for comparison' -ForegroundColor White
        Write-Host '   3. Develop normally and watch real-time tracking' -ForegroundColor White
    } else {
        Write-Host 'Dashboard not found at expected location' -ForegroundColor Yellow
        Write-Host '   You can launch it manually: .\launch-dashboard.ps1' -ForegroundColor Gray
    }
} else {
    Write-Host ''
    Write-Host 'You can launch the dashboard anytime with: .\launch-dashboard.ps1' -ForegroundColor Gray
}

Write-Host ''
