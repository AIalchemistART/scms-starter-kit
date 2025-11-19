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

# Initialize INDEX.md
Write-Host ''
Write-Host 'Initializing INDEX.md...' -ForegroundColor Yellow
$indexPath = Join-Path $projectRoot 'docs\scms\INDEX.md'
if (-not (Test-Path $indexPath)) {
    $indexContent = @"
# SCMS Knowledge Graph Index

**Purpose**: Central hub for cross-referencing SCMS layers.
**Maintenance**: Updated automatically during session closure.

## L0: Active Memories (Auto/Manual)
- See MEMORY_STATUS_DASHBOARD.md for active validation list

## L1: Workspace Rules
- See WORKSPACE_RULES.md for validated mandatory patterns

## L2: SOPs (Standard Operating Procedures)
- (Populate when SOPs are created in docs/scms/sops/)

## L3: Case Studies
- (Populate when Case Studies are created in docs/scms/case-studies/)

## L4: Global Rules
- See rules/GLOBAL_CODING_RULES.md for universal constraints

"@
    Set-Content -Path $indexPath -Value $indexContent -Encoding UTF8
    Write-Host 'docs/scms/INDEX.md created' -ForegroundColor Green
} else {
    Write-Host '  docs/scms/INDEX.md already exists' -ForegroundColor Gray
}

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
    'docs\scms\sops',
    'docs\scms\case-studies',
    'docs\scms\sessions',
    'rules'
)

if ($L0_STRATEGY -eq 'manual') {
    $dirs += 'docs\scms\memories'
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
$templateDest = Join-Path $projectRoot 'docs\scms\WORKSPACE_RULES.md'

if (-not (Test-Path $templateDest)) {
    # Read template and replace placeholder threshold with actual calculated value
    $templateContent = Get-Content -Path $templateSource -Raw
    $customizedTemplate = $templateContent -replace '≥2', ">=$($THRESHOLD_CONFIG.FinalThreshold)"
    Set-Content -Path $templateDest -Value $customizedTemplate -Encoding UTF8
    Write-Host "docs/scms/WORKSPACE_RULES.md created (threshold: n>=$($THRESHOLD_CONFIG.FinalThreshold))" -ForegroundColor Green
} else {
    Write-Host '  docs/scms/WORKSPACE_RULES.md already exists' -ForegroundColor Gray
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

$dashboardPath = Join-Path $projectRoot 'docs\scms\MEMORY_STATUS_DASHBOARD.md'
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

*Patterns need $($THRESHOLD_CONFIG.FinalThreshold) uses before promoting to L1 (docs/scms/WORKSPACE_RULES.md)*

---

## Active Memories (L0)

$strategyStr

No memories yet - will populate as you develop

---

## Validated Patterns (L1)

Check docs/scms/WORKSPACE_RULES.md for promoted patterns.

---

## Next Steps

1. Customize docs/scms/WORKSPACE_RULES.md for your project
2. Configure your IDE (see config/$IDE/SETUP.md)
3. Copy docs/scms/SCMS_STARTUP_PROMPT.md content to AI at each session
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

$startupPromptPath = Join-Path $projectRoot 'docs\scms\SCMS_STARTUP_PROMPT.md'

if ($IDE -eq 'windsurf' -and $L0_STRATEGY -eq 'auto') {
    # Windsurf Auto-Memory Startup Prompt
    $startupPrompt = @"
SCMS STARTUP (First Session Configuration)

Working on: [project name and brief description]

## SCMS Configuration - Sparse Contextual Memory Scaffolding

**IMPORTANT LOCATION RULE:**
- All Operational Logs live in: docs/scms/ (e.g., FAILURES.md)
- All Templates live in: docs/templates/
- Do NOT create SCMS files in root.

**Architecture:** Multi-time-scale cognitive framework
- L0: Auto-memories (Probabilistic retrieval) - **Active Strategy**
- L1: Validated patterns (Mandatory loading via WORKSPACE_RULES.md)
- L2: Failure Analysis (5 Whys enforced via Template)
- L3: Pattern Promotion (Evidence-based validation)
- L5: Session Audit (Closure verification)
- Dashboard: Economic & Context tracking

**Retrieval Workflow:** Windsurf hardcoded (L0 → L4 → L1) → SCMS directed (L2/L3 → L5 if needed) → Generate (if no retrieval) → L4 compliance check

**Promotion Thresholds:**
- Greenfield (Weeks 1-4): n>5 uses $(if ($THRESHOLD_CONFIG.Phase -eq 'Greenfield') { '(Current Target)' } else { '' })
- Establishing (Months 2-3): n>3 uses $(if ($THRESHOLD_CONFIG.Phase -eq 'Establishing') { '(Current Target)' } else { '' })
- Mature (4+ months): n>=2 uses $(if ($THRESHOLD_CONFIG.Phase -eq 'Mature') { '(Current Target)' } else { '' })

## Instructions for AI

### 1. ZERO-STATE INITIALIZATION (Greenfield/Integration)
**IF docs/scms/ DOES NOT EXIST:**

**A. Create Directory Structure:**
1. docs/scms/ (Operational Logs)
2. docs/templates/ (Standardization)
3. docs/guides/ (Manuals)

**B. Initialize Templates (The "Gold Standard"):**
1. Create docs/templates/FAILURE_LOG_TEMPLATE.md
2. Create docs/templates/PATTERN_PROMOTION_TEMPLATE.md
3. Create docs/templates/SESSION_CLOSURE_REPORT_TEMPLATE.md

**C. Initialize Operational Files:**
1. docs/scms/INDEX.md (Central Hub skeleton)
2. docs/scms/MEMORY_STATUS_DASHBOARD.md (Greenfield config)
3. docs/scms/FAILURES.md (Empty log)
4. docs/scms/WORKSPACE_RULES.md (Empty L1)
5. economics-dashboard-data.json OR scms-metrics.json (Initialize with session: [] array)

### 2. SESSION START CHECKLIST (Before Coding)
1. **Environment Check**:
   - Verify package.json scripts.
   - **Template Verification**: Do docs/templates/ exist?
   
2. **Review L4 Global Rules**:
   - Check rules/GLOBAL_CODING_RULES.md.
   
3. **Review Memory Dashboard**:
   - Check docs/scms/MEMORY_STATUS_DASHBOARD.md for Active Patterns.

### 3. DURING DEVELOPMENT (The Workflow)
1. **CREATE MEMORIES (L0)**: 
   - Pattern discovered -> Create Cascade memory.
   
2. **FAILURE DOCUMENTATION (L2 - Priority)**:
   - **Trigger**: Any mock failure, tool error, or regression.
   - **Action**: Update docs/scms/FAILURES.md.
   - **Constraint**: MUST uses docs/templates/FAILURE_LOG_TEMPLATE.md (5 Whys required).
   
3. **PATTERN PROMOTION (L3)**:
   - **Trigger**: L0 Pattern used n>=$($THRESHOLD_CONFIG.FinalThreshold) times.
   - **Action**: Fill docs/templates/PATTERN_PROMOTION_TEMPLATE.md to request L1 status.

### 4. SESSION CLOSURE (L5 - Critical)
At end of EVERY session, run closure protocol:
1. **Audit**: Generate docs/scms/SESSION_LOG_L5.md using docs/templates/SESSION_CLOSURE_REPORT_TEMPLATE.md.
2. **Export**: Run Dashboard Export to capture checkpoints/checkpoint-[ID].txt.
3. **Update**: INDEX.md and Dashboards.

Ready to configure SCMS. Let's start by initializing the directory structure and templates.
"@
} elseif ($IDE -eq 'windsurf' -and $L0_STRATEGY -eq 'manual') {
    # Windsurf Manual Markdown Startup Prompt
    $startupPrompt = @"
SCMS STARTUP (First Session Configuration)

Working on: [project name and brief description]

## SCMS Configuration - Sparse Contextual Memory Scaffolding

**IMPORTANT LOCATION RULE:**
- All Operational Logs live in: docs/scms/ (e.g., FAILURES.md)
- All Templates live in: docs/templates/
- Do NOT create SCMS files in root.

**Architecture:** Multi-time-scale cognitive framework
- L0: Manual Markdown Files (docs/scms/memories/) - **Active Strategy**
- L1: Validated patterns (Mandatory loading via WORKSPACE_RULES.md)
- L2: Failure Analysis (5 Whys enforced via Template)
- L3: Pattern Promotion (Evidence-based validation)
- L5: Session Audit (Closure verification)
- Dashboard: Economic & Context tracking

**Retrieval Workflow:** Windsurf hardcoded (L0 → L4 → L1) → SCMS directed (L2/L3 → L5 if needed) → Generate (if no retrieval) → L4 compliance check

**Promotion Thresholds:**
- Greenfield (Weeks 1-4): n>5 uses $(if ($THRESHOLD_CONFIG.Phase -eq 'Greenfield') { '(Current Target)' } else { '' })
- Establishing (Months 2-3): n>3 uses $(if ($THRESHOLD_CONFIG.Phase -eq 'Establishing') { '(Current Target)' } else { '' })
- Mature (4+ months): n>=2 uses $(if ($THRESHOLD_CONFIG.Phase -eq 'Mature') { '(Current Target)' } else { '' })

## Instructions for AI

### 1. ZERO-STATE INITIALIZATION (Greenfield/Integration)
**IF docs/scms/ DOES NOT EXIST:**

**A. Create Directory Structure:**
1. docs/scms/ (Operational Logs)
2. docs/scms/memories/ (L0 Manual Memories)
3. docs/templates/ (Standardization)
4. docs/guides/ (Manuals)

**B. Initialize Templates (The "Gold Standard"):**
1. Create docs/templates/FAILURE_LOG_TEMPLATE.md
2. Create docs/templates/PATTERN_PROMOTION_TEMPLATE.md
3. Create docs/templates/SESSION_CLOSURE_REPORT_TEMPLATE.md
4. Create docs/templates/MEMORY_TEMPLATE.md (For L0 manual memories)

**C. Initialize Operational Files:**
1. docs/scms/INDEX.md (Central Hub skeleton)
2. docs/scms/MEMORY_STATUS_DASHBOARD.md (Greenfield config)
3. docs/scms/FAILURES.md (Empty log)
4. docs/scms/WORKSPACE_RULES.md (Empty L1)
5. economics-dashboard-data.json OR scms-metrics.json (Initialize with session: [] array)

### 2. SESSION START CHECKLIST (Before Coding)
1. **Environment Check**:
   - Verify package.json scripts.
   - **Template Verification**: Do docs/templates/ exist?
   
2. **Review L4 Global Rules**:
   - Check rules/GLOBAL_CODING_RULES.md.
   
3. **Review Memory Dashboard**:
   - Check docs/scms/MEMORY_STATUS_DASHBOARD.md for Active Patterns.

### 3. DURING DEVELOPMENT (The Workflow)
1. **CREATE MEMORIES (L0)**: 
   - Pattern discovered -> Create new file in docs/scms/memories/ using MEMORY_TEMPLATE.md.
   - Log it in MEMORY_STATUS_DASHBOARD.md.
   
2. **FAILURE DOCUMENTATION (L2 - Priority)**:
   - **Trigger**: Any mock failure, tool error, or regression.
   - **Action**: Update docs/scms/FAILURES.md using L2 Template.
   - **Constraint**: MUST uses docs/templates/FAILURE_LOG_TEMPLATE.md (5 Whys required).
   
3. **PATTERN PROMOTION (L3)**:
   - **Trigger**: L0 Pattern used n>=$($THRESHOLD_CONFIG.FinalThreshold) times.
   - **Action**: Fill docs/templates/PATTERN_PROMOTION_TEMPLATE.md to request L1 status.

### 4. SESSION CLOSURE (L5 - Critical)
At end of EVERY session, run closure protocol:
1. **Audit**: Generate docs/scms/SESSION_LOG_L5.md using docs/templates/SESSION_CLOSURE_REPORT_TEMPLATE.md.
2. **Export**: Run Dashboard Export to capture checkpoints/checkpoint-[ID].txt.
3. **Update**: INDEX.md and Dashboards.

Ready to configure SCMS. Let's start by initializing the directory structure and templates.
"@
} elseif ($IDE -eq 'cursor' -or $IDE -eq 'generic') {
    # Manual Markdown Startup Prompt (Cursor/Generic)
    $startupPrompt = @"
SCMS STARTUP (First Session Configuration)

Working on: [project name and brief description]

## SCMS Configuration - Sparse Contextual Memory Scaffolding

**IMPORTANT LOCATION RULE:**
- All Operational Logs live in: docs/scms/ (e.g., FAILURES.md)
- All Templates live in: docs/templates/
- Do NOT create SCMS files in root.

**Architecture:** Multi-time-scale cognitive framework
- L0: Manual Markdown Files (docs/scms/memories/) - **Active Strategy**
- L1: Validated patterns (Mandatory loading via WORKSPACE_RULES.md)
- L2: Failure Analysis (5 Whys enforced via Template)
- L3: Pattern Promotion (Evidence-based validation)
- L5: Session Audit (Closure verification)
- Dashboard: Economic & Context tracking

**Retrieval Workflow:** Windsurf hardcoded (L0 → L4 → L1) → SCMS directed (L2/L3 → L5 if needed) → Generate (if no retrieval) → L4 compliance check

**Promotion Thresholds:**
- Greenfield (Weeks 1-4): n>5 uses $(if ($THRESHOLD_CONFIG.Phase -eq 'Greenfield') { '(Current Target)' } else { '' })
- Establishing (Months 2-3): n>3 uses $(if ($THRESHOLD_CONFIG.Phase -eq 'Establishing') { '(Current Target)' } else { '' })
- Mature (4+ months): n>=2 uses $(if ($THRESHOLD_CONFIG.Phase -eq 'Mature') { '(Current Target)' } else { '' })

## Instructions for AI

### 1. ZERO-STATE INITIALIZATION (Greenfield/Integration)
**IF docs/scms/ DOES NOT EXIST:**

**A. Create Directory Structure:**
1. docs/scms/ (Operational Logs)
2. docs/scms/memories/ (L0 Manual Memories)
3. docs/templates/ (Standardization)
4. docs/guides/ (Manuals)

**B. Initialize Templates (The "Gold Standard"):**
1. Create docs/templates/FAILURE_LOG_TEMPLATE.md
2. Create docs/templates/PATTERN_PROMOTION_TEMPLATE.md
3. Create docs/templates/SESSION_CLOSURE_REPORT_TEMPLATE.md
4. Create docs/templates/MEMORY_TEMPLATE.md (For L0 manual memories)

**C. Initialize Operational Files:**
1. docs/scms/INDEX.md (Central Hub skeleton)
2. docs/scms/MEMORY_STATUS_DASHBOARD.md (Greenfield config)
3. docs/scms/FAILURES.md (Empty log)
4. docs/scms/WORKSPACE_RULES.md (Empty L1)
5. economics-dashboard-data.json OR scms-metrics.json (Initialize with session: [] array)

### 2. SESSION START CHECKLIST (Before Coding)
1. **Environment Check**:
   - Verify package.json scripts.
   - **Template Verification**: Do docs/templates/ exist?
   
2. **Review L4 Global Rules**:
   - Check rules/GLOBAL_CODING_RULES.md.
   
3. **Review Memory Dashboard**:
   - Check docs/scms/MEMORY_STATUS_DASHBOARD.md for Active Patterns.

### 3. DURING DEVELOPMENT (The Workflow)
1. **CREATE MEMORIES (L0)**: 
   - Pattern discovered -> Create new file in docs/scms/memories/ using MEMORY_TEMPLATE.md.
   - Log it in MEMORY_STATUS_DASHBOARD.md.
   
2. **FAILURE DOCUMENTATION (L2 - Priority)**:
   - **Trigger**: Any mock failure, tool error, or regression.
   - **Action**: Update docs/scms/FAILURES.md using L2 Template.
   - **Constraint**: MUST uses docs/templates/FAILURE_LOG_TEMPLATE.md (5 Whys required).
   
3. **PATTERN PROMOTION (L3)**:
   - **Trigger**: L0 Pattern used n>=$($THRESHOLD_CONFIG.FinalThreshold) times.
   - **Action**: Fill docs/templates/PATTERN_PROMOTION_TEMPLATE.md to request L1 status.

### 4. SESSION CLOSURE (L5 - Critical)
At end of EVERY session, run closure protocol:
1. **Audit**: Generate docs/scms/SESSION_LOG_L5.md using docs/templates/SESSION_CLOSURE_REPORT_TEMPLATE.md.
2. **Export**: Run Dashboard Export to capture checkpoints/checkpoint-[ID].txt.
3. **Update**: INDEX.md and Dashboards.

Ready to configure SCMS. Let's start by initializing the directory structure and templates.
"@
}
Set-Content -Path $startupPromptPath -Value $startupPrompt -Encoding UTF8
Write-Host 'Startup prompt generated' -ForegroundColor Green
Write-Host ''

Write-Host '========================================' -ForegroundColor Cyan
Write-Host 'SCMS Setup Complete!' -ForegroundColor Green
Write-Host ''
Write-Host 'Next steps:' -ForegroundColor Yellow
Write-Host "1. Edit docs/scms/WORKSPACE_RULES.md with project-specific rules"
Write-Host "2. Configure memories in your IDE (see config/$IDE/SETUP.md)"
Write-Host "3. Copy docs/scms/SCMS_STARTUP_PROMPT.md to your AI at each session"
Write-Host "4. Start developing - SCMS builds automatically!"
Write-Host ''

# Optional: Launch Dashboard
$launchChoice = Read-Host 'Do you want to install dependencies and launch the dashboard now? [y/N]'
if ($launchChoice -match '^[yY]') {
    Write-Host 'Installing dependencies...' -ForegroundColor Yellow
    
    # Check where package.json is (assume sibling of scripts dir)
    $pkgPath = Join-Path $PSScriptRoot '..\package.json'
    $pkgRoot = Join-Path $PSScriptRoot '..'
    
    if (Test-Path $pkgPath) {
        Push-Location $pkgRoot
        try {
            npm install
            if ($LASTEXITCODE -eq 0) {
                Write-Host 'Starting dashboard...' -ForegroundColor Green
                npm run dashboard:app
            } else {
                Write-Host 'npm install failed. Please run "npm install" manually.' -ForegroundColor Red
            }
        } catch {
            Write-Host "Error: $_" -ForegroundColor Red
        } finally {
            Pop-Location
        }
    } else {
        Write-Host "Could not find package.json at $pkgPath" -ForegroundColor Red
        Write-Host "Please navigate to the SCMS directory and run 'npm install' then 'npm run dashboard:app'" -ForegroundColor Gray
    }
}

