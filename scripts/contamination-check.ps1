# SCMS Starter Kit - Contamination Check Script
# Purpose: Detect project-specific content that shouldn't be in the starter kit
# Usage: Run before commits or during session closure
#
# Exit Codes:
#   0 = Clean (no contamination found)
#   1 = Contamination detected (review required)

param(
    [string]$SearchPath = "docs/scms",
    [string[]]$ProjectNames = @(),
    [string[]]$PersonaNames = @(),
    [string[]]$UserNames = @(),
    [switch]$Verbose
)

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  SCMS Contamination Guard" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Default patterns that should never appear in a clean starter kit
$defaultPatterns = @(
    # Add your project-specific terms here when forking
    # Example: "MyProject", "MyPersona", "MyUsername"
)

# Combine all patterns
$allPatterns = $defaultPatterns + $ProjectNames + $PersonaNames + $UserNames

# Always check for common contamination indicators
$commonPatterns = @(
    "TODO:.*specific",
    "FIXME:.*project"
)

if ($allPatterns.Count -eq 0 -and $ProjectNames.Count -eq 0) {
    Write-Host "[!] No project-specific patterns provided." -ForegroundColor Yellow
    Write-Host "   Usage: .\contamination-check.ps1 -ProjectNames 'MyProject','MyApp'" -ForegroundColor Yellow
    Write-Host "   Checking common patterns only..." -ForegroundColor Yellow
    Write-Host ""
    $allPatterns = $commonPatterns
}

$contaminated = $false
$findings = @()

Write-Host "[DIR] Scanning: $SearchPath" -ForegroundColor White
Write-Host "[SEARCH] Patterns: $($allPatterns -join ', ')" -ForegroundColor White
Write-Host ""

foreach ($pattern in $allPatterns) {
    if ([string]::IsNullOrWhiteSpace($pattern)) { continue }
    
    $results = Get-ChildItem -Path $SearchPath -Recurse -File -Include "*.md" | 
        Select-String -Pattern $pattern -CaseSensitive:$false
    
    if ($results) {
        $contaminated = $true
        Write-Host "[X] Found '$pattern':" -ForegroundColor Red
        foreach ($result in $results) {
            $relativePath = $result.Path -replace [regex]::Escape((Get-Location).Path + "\"), ""
            Write-Host "   → $relativePath`:$($result.LineNumber)" -ForegroundColor Yellow
            if ($Verbose) {
                Write-Host "     $($result.Line.Trim())" -ForegroundColor DarkGray
            }
            $findings += [PSCustomObject]@{
                Pattern = $pattern
                File = $relativePath
                Line = $result.LineNumber
                Content = $result.Line.Trim()
            }
        }
        Write-Host ""
    }
}

Write-Host "========================================" -ForegroundColor Cyan

if ($contaminated) {
    Write-Host "[!!] CONTAMINATION DETECTED" -ForegroundColor Red
    Write-Host ""
    Write-Host "Resolution Options:" -ForegroundColor White
    Write-Host "  1. Generalize: Replace specific names with [Placeholder]" -ForegroundColor Gray
    Write-Host "  2. Relocate: Move to examples/dogfood/ for project-specific content" -ForegroundColor Gray
    Write-Host "  3. Document: If meta-reference (documenting the failure), add comment" -ForegroundColor Gray
    Write-Host ""
    Write-Host "Total findings: $($findings.Count)" -ForegroundColor Yellow
    exit 1
} else {
    Write-Host "[OK] CLEAN - No contamination detected" -ForegroundColor Green
    exit 0
}
