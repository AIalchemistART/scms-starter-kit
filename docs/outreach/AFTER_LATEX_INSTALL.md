# After LaTeX Installation - Create PDF

## Once MiKTeX installation completes:

### Step 1: Close and Restart PowerShell
**Important:** Close your current PowerShell window completely and open a new one so it picks up the LaTeX installation.

### Step 2: Navigate to the folder
```powershell
cd C:\Games\Projects\scms-starter-kit-github\docs\outreach
```

### Step 3: Run the conversion
```powershell
.\make_pdf.ps1
```

This should now work! The PDF will be created and automatically open.

---

## If you get "missing packages" error:

MiKTeX will prompt you to install missing packages automatically. Click "Yes" or "Install" when prompted.

First run might take a minute as it downloads required LaTeX packages.

---

## Expected Result:

**File created:** `SCMS_Validation_Report_Travis_Oliphant.pdf`

✅ Professional 2-page PDF
✅ Clickable blue links
✅ Clean typography
✅ Ready to send to Travis Monday!

---

## Quick verification checklist:

- [ ] PDF is 2 pages
- [ ] Tables look correct
- [ ] Links are blue and clickable
- [ ] Contact info visible
- [ ] Professional appearance

---

## Alternative if still having issues:

**Online converter (no install needed):**
1. Go to https://dillinger.io
2. Import the markdown file
3. Export as PDF
4. Rename to `SCMS_Validation_Report_Travis_Oliphant.pdf`
