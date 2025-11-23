# Simple PDF Converter for SCMS Report
# Run this after restarting PowerShell (so PATH includes Pandoc)

$ReportFile = "SCMS_TWO_PAGE_REPORT_OPENTEAMS_PDF_READY.md"
$OutputPDF = "SCMS_Validation_Report_Travis_Oliphant.pdf"

Write-Host "Converting SCMS Report to PDF..." -ForegroundColor Cyan
Write-Host ""

# Refresh PATH
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

# Try conversion
try {
    pandoc $ReportFile -o $OutputPDF --pdf-engine=xelatex --variable=colorlinks:true --variable=linkcolor:blue --variable=urlcolor:blue -V geometry:margin=1in -V fontsize=11pt -V linestretch=1.15
    
    Write-Host "SUCCESS! PDF created: $OutputPDF" -ForegroundColor Green
    Write-Host ""
    Start-Process $OutputPDF
    
} catch {
    Write-Host "FAILED: $_" -ForegroundColor Red
    Write-Host ""
    Write-Host "Alternative: Use VS Code Markdown PDF extension" -ForegroundColor Yellow
    Write-Host "1. Press Ctrl+Shift+X" -ForegroundColor White
    Write-Host "2. Search: Markdown PDF" -ForegroundColor White
    Write-Host "3. Install by yzane" -ForegroundColor White
    Write-Host "4. Right-click file -> Export PDF" -ForegroundColor White
}
