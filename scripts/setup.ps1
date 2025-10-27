# SCMS Starter Kit - Windows Setup Script

Write-Host 'SCMS Starter Kit Setup' -ForegroundColor Cyan
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
    '..\sops',
    '..\case-studies',
    '..\sessions'
)

if ($L0_STRATEGY -eq 'manual') {
    $dirs += '..\memories'
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

# Copy templates
Write-Host ''
Write-Host 'Copying documentation templates...' -ForegroundColor Yellow

$templateSource = Join-Path $PSScriptRoot '..\docs\templates\WORKSPACE_RULES_TEMPLATE.md'
$templateDest = Join-Path $PSScriptRoot '..\..\WORKSPACE_RULES.md'

if (-not (Test-Path $templateDest)) {
    Copy-Item -Path $templateSource -Destination $templateDest
    Write-Host 'WORKSPACE_RULES.md created' -ForegroundColor Green
} else {
    Write-Host '  WORKSPACE_RULES.md already exists' -ForegroundColor Gray
}

# Initialize dashboard
Write-Host ''
Write-Host 'Initializing memory dashboard...' -ForegroundColor Yellow

$dashboardPath = Join-Path $PSScriptRoot '..\..\MEMORY_STATUS_DASHBOARD.md'
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

# IDE setup
Write-Host ''
Write-Host "Running $IDE setup..." -ForegroundColor Yellow

switch ($IDE) {
    'cursor' {
        $cursorrules = Join-Path $PSScriptRoot '..\config\cursor\.cursorrules'
        $projectRoot = Join-Path $PSScriptRoot '..\..\..\'
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

# Startup prompt reminder for auto-memory users
if ($IDE -eq 'windsurf' -and $L0_STRATEGY -eq 'auto') {
    Write-Host ''
    Write-Host '========================================' -ForegroundColor Cyan
    Write-Host 'IMPORTANT: STARTUP PROMPT REQUIRED' -ForegroundColor Yellow
    Write-Host '========================================' -ForegroundColor Cyan
    Write-Host ''
    Write-Host 'To complete SCMS setup:' -ForegroundColor White
    Write-Host '1. Open SCMS_STARTUP_PROMPT.md in this directory' -ForegroundColor White
    Write-Host '2. Copy the entire content' -ForegroundColor White
    Write-Host '3. Paste it to Cascade AI at the START of each dev session' -ForegroundColor White
    Write-Host ''
    Write-Host 'This tells Cascade how to use SCMS auto-memory correctly' -ForegroundColor Gray
    Write-Host ''
}
