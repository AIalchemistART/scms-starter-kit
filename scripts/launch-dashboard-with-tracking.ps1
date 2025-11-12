# SCMS Dashboard Launcher with Automated Tracking
# Starts checkpoint monitor and opens dashboard

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "SCMS DASHBOARD WITH AUTO-TRACKING" -ForegroundColor Yellow
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Check if node_modules exists
if (-not (Test-Path "node_modules")) {
    Write-Host "Installing dependencies..." -ForegroundColor Yellow
    npm install
    Write-Host ""
}

# Start checkpoint monitor in background
Write-Host "Starting checkpoint monitor..." -ForegroundColor Cyan
$monitorJob = Start-Job -ScriptBlock {
    Set-Location $using:PWD
    npm run checkpoint:monitor
}

Write-Host "Monitor started (Job ID: $($monitorJob.Id))" -ForegroundColor Green
Write-Host ""

# Open dashboard
$dashboardPath = Join-Path $PSScriptRoot "..\docs\tools\scms-dashboard.html"
if (Test-Path $dashboardPath) {
    Write-Host "Opening dashboard..." -ForegroundColor Cyan
    Start-Process $dashboardPath
    Write-Host "Dashboard opened!" -ForegroundColor Green
    Write-Host ""
} else {
    Write-Host "Error: Dashboard not found at $dashboardPath" -ForegroundColor Red
    Stop-Job $monitorJob
    Remove-Job $monitorJob
    exit 1
}

# Instructions
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "READY TO TRACK!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "How to use:" -ForegroundColor White
Write-Host "  1. Click 'Start SCMS Session' in dashboard" -ForegroundColor Gray
Write-Host "  2. Work in Cascade normally" -ForegroundColor Gray
Write-Host "  3. When you want to capture checkpoint:" -ForegroundColor Gray
Write-Host "     - In Cascade: Ctrl+A (select all)" -ForegroundColor Gray
Write-Host "     - In Cascade: Ctrl+C (copy)" -ForegroundColor Gray
Write-Host "  4. Monitor auto-processes (watch dashboard update!)" -ForegroundColor Gray
Write-Host "  5. Click 'End Session' when done" -ForegroundColor Gray
Write-Host "  6. Click 'Export Data' to save analysis" -ForegroundColor Gray
Write-Host ""
Write-Host "Monitor Job ID: $($monitorJob.Id)" -ForegroundColor Yellow
Write-Host ""
Write-Host "To stop monitor: Stop-Job $($monitorJob.Id); Remove-Job $($monitorJob.Id)" -ForegroundColor Gray
Write-Host "Or just close this window" -ForegroundColor Gray
Write-Host ""
Write-Host "Press Enter to stop monitor and exit..."
Read-Host

# Cleanup
Write-Host ""
Write-Host "Stopping monitor..." -ForegroundColor Yellow
Stop-Job $monitorJob
Remove-Job $monitorJob
Write-Host "Done!" -ForegroundColor Green
Write-Host ""
