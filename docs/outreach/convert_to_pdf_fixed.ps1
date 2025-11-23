# SCMS Report PDF Converter - Fixed Version
# Handles fresh Pandoc installations

$ReportFile = "SCMS_TWO_PAGE_REPORT_OPENTEAMS_PDF_READY.md"
$OutputPDF = "SCMS_Validation_Report_Travis_Oliphant.pdf"

Write-Host "Converting SCMS Report to PDF..." -ForegroundColor Cyan
Write-Host "Input: $ReportFile" -ForegroundColor Gray
Write-Host "Output: $OutputPDF" -ForegroundColor Gray
Write-Host ""

# Refresh environment variables to pick up fresh Pandoc installation
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

# Check if Pandoc is installed
try {
    $pandocVersion = pandoc --version 2>&1 | Select-Object -First 1
    Write-Host "✓ Pandoc found: $pandocVersion" -ForegroundColor Green
} catch {
    Write-Host "✗ Pandoc not found in PATH!" -ForegroundColor Red
    Write-Host ""
    Write-Host "Pandoc was just installed but terminal needs refresh." -ForegroundColor Yellow
    Write-Host ""
    Write-Host "SOLUTION 1 (EASIEST):" -ForegroundColor Cyan
    Write-Host "  Close this PowerShell window and open a new one, then run:" -ForegroundColor White
    Write-Host "  cd C:\Games\Projects\scms-starter-kit-github\docs\outreach" -ForegroundColor Gray
    Write-Host "  .\convert_to_pdf_fixed.ps1" -ForegroundColor Gray
    Write-Host ""
    Write-Host "SOLUTION 2 (ALTERNATIVE):" -ForegroundColor Cyan
    Write-Host "  Use VS Code 'Markdown PDF' extension (no terminal needed)" -ForegroundColor White
    Write-Host "  1. Install extension: Ctrl+Shift+X, search 'Markdown PDF'" -ForegroundColor Gray
    Write-Host "  2. Open SCMS_TWO_PAGE_REPORT_OPENTEAMS_PDF_READY.md" -ForegroundColor Gray
    Write-Host "  3. Right-click -> 'Markdown PDF: Export (pdf)'" -ForegroundColor Gray
    Write-Host ""
    Write-Host "SOLUTION 3 (QUICK):" -ForegroundColor Cyan
    Write-Host "  Use online converter: https://dillinger.io" -ForegroundColor White
    Write-Host "  Upload markdown file, export as PDF" -ForegroundColor Gray
    exit 1
}

# Convert to PDF
try {
    pandoc $ReportFile `
        -o $OutputPDF `
        --pdf-engine=xelatex `
        --variable=colorlinks:true `
        --variable=linkcolor:blue `
        --variable=urlcolor:blue `
        --highlight-style=tango `
        --toc=false `
        -V geometry:margin=1in `
        -V fontsize=11pt `
        -V linestretch=1.15
    
    Write-Host ""
    Write-Host "✓ PDF created successfully!" -ForegroundColor Green
    Write-Host "Location: $OutputPDF" -ForegroundColor White
    Write-Host ""
    Write-Host "Opening PDF..." -ForegroundColor Cyan
    Start-Process $OutputPDF
    
} catch {
    Write-Host ""
    Write-Host "✗ Conversion failed!" -ForegroundColor Red
    Write-Host "Error: $_" -ForegroundColor Red
    Write-Host ""
    Write-Host "This might be a LaTeX issue. Try alternative methods:" -ForegroundColor Yellow
    Write-Host "  1. Use VS Code markdown-pdf extension" -ForegroundColor White
    Write-Host "  2. Use online converter: dillinger.io" -ForegroundColor White
    Write-Host "  3. Use Typora (if installed)" -ForegroundColor White
}
