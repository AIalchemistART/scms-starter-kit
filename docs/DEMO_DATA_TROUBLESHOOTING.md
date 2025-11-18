# 🔍 Demo Data Still Appearing - Troubleshooting Guide

**Issue:** Demo data (Error Handling Pattern, API Integration Pattern, 80.2% savings) keeps appearing even after clicking "Clear Data"

---

## ✅ **Fix Applied (Pull Latest Changes)**

```bash
cd C:\Games\Projects\scms-starter-kit-github
git pull origin master
```

**Updated:** `clearAllData()` now clears BOTH localStorage AND economics-dashboard-data.json file

---

## 🔍 **Step-by-Step Diagnosis**

### **Step 1: Check Your Project's Data File**

```powershell
# In YOUR project folder (not starter kit)
cd C:\Games\Projects\your-project

# Check if file exists
Get-Item economics-dashboard-data.json

# View contents
Get-Content economics-dashboard-data.json | ConvertFrom-Json
```

**Look for:**
- `sessions` array with data
- `patterns` with "Error Handling Pattern" or "API Integration Pattern"
- `savingsPercent` around 67-80%

**If file has demo data:** Delete it and restart dashboard
```powershell
Remove-Item economics-dashboard-data.json
# Restart dashboard app
```

---

### **Step 2: Check Browser localStorage**

1. **Open dashboard**
2. **Press F12** (developer tools)
3. **Go to:** Application → Local Storage → file://
4. **Look for keys:**
   - `scms-cost-tracker-data`
   - `scms-active-session`

**If you see demo data in these keys:**
```javascript
// In browser console (F12):
localStorage.clear();
location.reload();
```

---

### **Step 3: Update Starter Kit**

```powershell
# In your project's scms folder
cd docs/scms
git pull origin master
npm install
```

**Then restart dashboard:**
```powershell
npm run dashboard:app
```

---

### **Step 4: Use Updated Clear Data Button**

1. **Click "Clear Data"** button in dashboard
2. **Confirm** the dialog
3. **Dashboard reloads** with ALL data cleared (both localStorage AND file)

**Expected result:** All zeros, no patterns

---

## 🐛 **Common Causes**

### **Cause 1: Old economics-dashboard-data.json File**

**Problem:** File created before you pulled latest changes  
**Location:** Project root (not in docs/scms/)  
**Fix:** Delete file, restart dashboard

```powershell
Remove-Item economics-dashboard-data.json -ErrorAction SilentlyContinue
```

---

### **Cause 2: localStorage Persisting**

**Problem:** Browser caching localStorage between reloads  
**Fix:** Hard refresh or clear storage

```javascript
// Browser console (F12):
localStorage.clear();
sessionStorage.clear();
location.reload(true);  // Hard reload
```

---

### **Cause 3: Demo Button Was Clicked Previously**

**Problem:** Demo data saved before we removed auto-button  
**Fix:** Pull latest changes, use new Clear Data function

```bash
cd docs/scms
git pull origin master
```

Then click "Clear Data" in dashboard

---

### **Cause 4: Old Version of Dashboard**

**Problem:** Using cached version of scms-dashboard.html  
**Fix:** Hard refresh the dashboard page

**In browser:** `Ctrl + Shift + R` (Windows) or `Cmd + Shift + R` (Mac)

---

### **Cause 5: Checkpoint Files with Demo Data**

**Problem:** Old checkpoint files contain demo patterns  
**Location:** `docs/scms/checkpoints/` folder  
**Fix:** Clear checkpoint folder

```powershell
# In your project
cd docs/scms
Remove-Item checkpoints/*.txt -ErrorAction SilentlyContinue
```

---

## ✅ **Complete Reset Procedure**

If demo data still appears after trying above steps:

### **Step 1: Stop Dashboard**
Close the Electron app window

### **Step 2: Clear All Data Locations**

```powershell
# In YOUR project folder
cd C:\Games\Projects\your-project

# Clear root-level data file
Remove-Item economics-dashboard-data.json -ErrorAction SilentlyContinue

# Clear checkpoints
Remove-Item docs/scms/checkpoints/*.txt -ErrorAction SilentlyContinue

# Clear any old SCMS files at root (if using old setup)
Remove-Item *DASHBOARD*.md -ErrorAction SilentlyContinue
Remove-Item INDEX.md -ErrorAction SilentlyContinue
```

### **Step 3: Update Starter Kit**

```powershell
cd docs/scms
git pull origin master
npm install
```

### **Step 4: Launch Dashboard Fresh**

```powershell
npm run dashboard:app
```

### **Step 5: In Dashboard - Clear Storage**

1. Press **F12** (developer tools)
2. Go to **Application** → **Storage**
3. Click **"Clear site data"**
4. Close developer tools
5. **Reload page** (F5)

### **Step 6: Start Fresh Session**

1. Click **"Start SCMS Session"**
2. **Verify:** All values should be zero
3. **Verify:** No patterns listed

---

## 📊 **Expected Fresh State**

```
Session Status: SCMS Session Active

Conservative Savings: --
Retrieval Efficiency: 0.0%
Pattern ROI: 0
Session Cost: $0.0000
Sessions Tracked: 0 SCMS - 0 Baseline

Cost Comparison: (empty/no bars)

Top Performing Patterns: (none)
```

**No patterns should be listed!**  
**No percentages except 0%!**

---

## 🎯 **If Demo Data STILL Appears**

### **Diagnostic: Check What's Triggering It**

1. **Open developer tools** (F12)
2. **Go to Console tab**
3. **Click "Clear Data"** in dashboard
4. **Confirm**
5. **Watch console** for messages

**Look for:**
- `[dashboard] Data file cleared: economics-dashboard-data.json` ← Should see this
- Any errors loading data
- Any messages about demo or patterns

### **Manual localStorage Inspection**

```javascript
// In browser console (F12):

// Check what's in localStorage:
console.log('Tracker data:', localStorage.getItem('scms-cost-tracker-data'));
console.log('Active session:', localStorage.getItem('scms-active-session'));

// Parse and inspect:
const data = JSON.parse(localStorage.getItem('scms-cost-tracker-data') || '{}');
console.log('Sessions:', data.sessions);
console.log('Patterns:', data.patterns);

// If demo data found, clear it:
localStorage.clear();
location.reload();
```

### **Check File System**

```powershell
# In your project
Get-Content economics-dashboard-data.json | ConvertFrom-Json | ConvertTo-Json -Depth 10

# Should show:
# {
#   "scmsSessions": 0,
#   "baselineSessions": 0,
#   "sessions": [],
#   "exportDate": null,
#   "analysis": {
#     "scmsAvgCost": 0,
#     "baselineAvgCost": 0,
#     "savingsPercent": 0
#   }
# }
```

---

## 🚨 **Last Resort: Nuclear Option**

If NOTHING works:

```powershell
# In your project
cd C:\Games\Projects\your-project

# Remove ALL SCMS files
Remove-Item -Recurse -Force docs/scms

# Reinstall from scratch
git clone https://github.com/AIalchemistART/scms-starter-kit.git docs/scms
cd docs/scms
npm install
.\scripts\setup.ps1

# Fresh start guaranteed!
```

---

## 📝 **Report Issue**

If demo data persists after ALL these steps, please provide:

1. **Screenshot** of dashboard showing demo data
2. **Console output** (F12 → Console tab)
3. **localStorage contents:**
   ```javascript
   console.log(localStorage.getItem('scms-cost-tracker-data'));
   ```
4. **File contents:**
   ```powershell
   Get-Content economics-dashboard-data.json
   ```
5. **Checkpoint files:**
   ```powershell
   Get-ChildItem docs/scms/checkpoints/*.txt
   ```

This will help diagnose any edge cases!

---

## ✅ **Summary of Fixes**

| Fix | What It Does | When to Use |
|-----|--------------|-------------|
| **Pull latest changes** | Gets updated clearAllData() | Always do this first |
| **Click "Clear Data"** | Clears localStorage + file | After pulling changes |
| **Delete data file** | Removes economics-dashboard-data.json | If file has demo data |
| **Clear localStorage** | Browser storage reset | If browser cached data |
| **Hard refresh** | Reloads dashboard HTML | If using old version |
| **Delete checkpoints** | Removes checkpoint files | If checkpoints have demo data |
| **Nuclear option** | Complete reinstall | If nothing else works |

---

**The updated `clearAllData()` function should fix this issue by clearing BOTH localStorage AND the data file!** ✅

**Pull latest changes and try clicking "Clear Data" again!** 🚀
