# SCMS Report PDF Converter
# Converts the markdown report to professional PDF using Pandoc

$ReportFile = "SCMS_TWO_PAGE_REPORT_OPENTEAMS_PDF_READY.md"
$OutputPDF = "SCMS_Validation_Report_Travis_Oliphant.pdf"

Write-Host "Converting SCMS Report to PDF..." -ForegroundColor Cyan
Write-Host "Input: $ReportFile" -ForegroundColor Gray
Write-Host "Output: $OutputPDF" -ForegroundColor Gray
Write-Host ""

# Check if Pandoc is installed
try {
    $pandocVersion = pandoc --version 2>&1 | Select-Object -First 1
    Write-Host "✓ Pandoc found: $pandocVersion" -ForegroundColor Green
} catch {
    Write-Host "✗ Pandoc not found!" -ForegroundColor Red
    Write-Host ""
    Write-Host "Please install Pandoc:" -ForegroundColor Yellow
    Write-Host "  Option 1: winget install --id JohnMacFarlane.Pandoc" -ForegroundColor White
    Write-Host "  Option 2: choco install pandoc" -ForegroundColor White
    Write-Host "  Option 3: Download from https://pandoc.org/installing.html" -ForegroundColor White
    Write-Host ""
    Write-Host "After installation, run this script again." -ForegroundColor Yellow
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
    Write-Host "Alternative methods:" -ForegroundColor Yellow
    Write-Host "  1. Use VS Code markdown-pdf extension" -ForegroundColor White
    Write-Host "  2. Use online converter: dillinger.io or markdown2pdf.com" -ForegroundColor White
    Write-Host "  3. Open in Typora and export to PDF" -ForegroundColor White
}
