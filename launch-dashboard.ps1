#!/usr/bin/env pwsh
# SCMS Economic Tracking Dashboard Launcher
# Launches the real-time cost tracking dashboard in your default browser

Write-Host "🚀 Launching SCMS Real Cost Tracking Dashboard..." -ForegroundColor Cyan
Write-Host ""

$dashboardPath = Join-Path $PSScriptRoot "docs\tools\scms-dashboard.html"

if (Test-Path $dashboardPath) {
    Write-Host "✅ Dashboard found at: $dashboardPath" -ForegroundColor Green
    Write-Host ""
    Write-Host "📊 Opening dashboard in your default browser..." -ForegroundColor Yellow
    Write-Host ""
    Write-Host "🎯 Quick Start:" -ForegroundColor Cyan
    Write-Host "   1. Click 'Start SCMS Session' when using SCMS patterns" -ForegroundColor White
    Write-Host "   2. Click 'Start Baseline Session' for comparison data" -ForegroundColor White
    Write-Host "   3. Develop normally and watch real-time cost tracking" -ForegroundColor White
    Write-Host "   4. Click 'End Session' when done" -ForegroundColor White
    Write-Host ""
    Write-Host "💡 Algorithmic Validation:" -ForegroundColor Cyan
    Write-Host "   Track actual token consumption vs theoretical estimates" -ForegroundColor White
    Write-Host "   Export data after 30 days for statistical analysis" -ForegroundColor White
    Write-Host ""
    
    # Open in default browser
    Start-Process $dashboardPath
    
    Write-Host "✨ Dashboard launched! Track your SCMS efficiency in real-time." -ForegroundColor Green
} else {
    Write-Host "❌ Dashboard not found at: $dashboardPath" -ForegroundColor Red
    Write-Host "   Please ensure you're running this from the SCMS root directory." -ForegroundColor Yellow
}

Write-Host ""
Write-Host "Press any key to exit..." -ForegroundColor Gray
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
