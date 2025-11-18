# 🐛 Bug Fix: Setup Script Launching npm.ps1 in Notepad

**Date:** November 18, 2025  
**Issue:** Setup script opened npm.ps1 file in Notepad instead of running dashboard app  
**Status:** ✅ Fixed

---

## 🐛 The Bug

### **What Happened:**
User ran setup script, selected "Yes" to launch dashboard:
1. ✅ Dependencies installed successfully
2. ❌ npm.ps1 file opened in Notepad
3. ❌ Dashboard app didn't launch

### **Screenshot:**
![npm.ps1 opened in Notepad](../bug-npm-notepad.png)

---

## 🔍 Root Cause Analysis

### **Problematic Code:**

```powershell
# This was the bug:
Start-Process -FilePath "npm" -ArgumentList "run", "dashboard:app" -WorkingDirectory $projectRoot
```

### **Why It Failed:**

1. **PowerShell behavior:** `Start-Process -FilePath "npm"` treats "npm" as a **file path**
2. **Resolution:** PowerShell finds `npm.ps1` in `node_modules/.bin/npm.ps1`
3. **File association:** Windows opens `.ps1` files with default text editor (Notepad)
4. **Result:** Script file opens instead of executing

### **The Confusion:**

- ✅ **Works in terminal:** Typing `npm run dashboard:app` executes correctly
- ❌ **Fails with Start-Process:** `Start-Process` doesn't use PATH resolution for npm commands
- ✅ **Works in bash:** Unix shells handle `npm` as executable correctly

**PowerShell Start-Process expects:**
- Full executable paths (e.g., `C:\Program Files\nodejs\npm.cmd`)
- OR a program that's registered as a Windows executable
- NOT aliased commands or PATH-resolved scripts

---

## ✅ The Fix

### **New Code:**

```powershell
# Fixed version:
Start-Process -FilePath "powershell" -ArgumentList "-NoExit", "-Command", "cd '$projectRoot'; npm run dashboard:app"
```

### **How It Works:**

1. **Launch PowerShell:** `Start-Process -FilePath "powershell"`
2. **Keep window open:** `-NoExit` flag (user can see output/errors)
3. **Execute command:** `-Command "cd '$projectRoot'; npm run dashboard:app"`
4. **Result:** New PowerShell window runs npm command correctly

### **Benefits:**

- ✅ **Works reliably:** PowerShell handles npm command resolution
- ✅ **Visible output:** User sees dashboard startup logs
- ✅ **Error visibility:** Any errors show in dedicated window
- ✅ **Stays open:** Window remains for debugging (can close manually)
- ✅ **Clean separation:** Setup script completes, dashboard runs independently

---

## 🧪 Alternative Approaches Considered

### **Option 1: Find npm.cmd directly**
```powershell
$npmPath = Get-Command npm -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Source
Start-Process -FilePath $npmPath -ArgumentList "run", "dashboard:app"
```
**Rejected:** Still opens in Notepad if npm resolves to .ps1 script

### **Option 2: Use cmd.exe**
```powershell
Start-Process -FilePath "cmd" -ArgumentList "/c", "cd $projectRoot && npm run dashboard:app"
```
**Rejected:** Window closes immediately, no error visibility

### **Option 3: Invoke-Expression**
```powershell
Invoke-Expression "npm run dashboard:app"
```
**Rejected:** Blocks setup script until dashboard closes

### **Option 4: Start-Job**
```powershell
Start-Job -ScriptBlock { Set-Location $using:projectRoot; npm run dashboard:app }
```
**Rejected:** No console output, hard to debug

### **✅ Chosen: PowerShell window with -NoExit**
- Best user experience
- Visible output
- Non-blocking
- Easy to debug

---

## 🔧 Technical Deep Dive

### **PowerShell Command Resolution:**

**When you type `npm` in terminal:**
1. PowerShell checks aliases
2. PowerShell checks functions
3. PowerShell checks cmdlets
4. PowerShell checks PATH for executables
5. **Result:** Finds `npm.cmd` or `npm.ps1` and **executes** it

**When you use `Start-Process -FilePath "npm"`:**
1. PowerShell treats "npm" as literal file path
2. Searches for file named "npm" (or npm.exe, npm.ps1, etc.)
3. Finds `npm.ps1`
4. **Uses file association to open it** (not execute)
5. **Result:** Opens in text editor

### **Why This Is Confusing:**

```powershell
# These work:
npm install
npm run dashboard:app
& npm run test

# This doesn't:
Start-Process -FilePath "npm" -ArgumentList "run", "dashboard:app"

# You need:
Start-Process -FilePath "powershell" -ArgumentList "-Command", "npm run dashboard:app"
```

---

## 📊 Impact

### **Before Fix:**
- ❌ Dashboard doesn't launch
- ❌ Confusing for users (npm.ps1 in Notepad)
- ❌ Manual launch required
- ❌ Poor setup experience

### **After Fix:**
- ✅ Dashboard launches automatically
- ✅ Clean, professional experience
- ✅ Visible output for debugging
- ✅ Works on all Windows versions

---

## 🧪 Testing

### **Tested On:**
- ✅ Windows 11 (PowerShell 5.1)
- ✅ Windows 10 (PowerShell 5.1)
- ✅ PowerShell 7+ (cross-platform)

### **Test Steps:**
1. Fresh project folder
2. Clone SCMS starter kit
3. Run `.\scripts\setup.ps1`
4. Select L0 strategy
5. Select "Yes" to launch dashboard
6. **Verify:** New PowerShell window opens with dashboard running

### **Expected Behavior:**
```
Setup window shows:
"Dashboard app launched!"

New PowerShell window opens:
[dashboard] App starting...
[dashboard] Window created
(Electron app window appears)
```

---

## 🎓 Lessons Learned

### **PowerShell Gotchas:**

1. **Start-Process ≠ Running Commands**
   - Start-Process is for launching applications
   - Not for running shell commands
   - Use `powershell -Command` wrapper for commands

2. **File Path vs Command**
   - "npm" is a command (resolved via PATH)
   - Start-Process needs explicit executable path
   - Or needs to launch shell that resolves commands

3. **-NoExit is Important**
   - Without it, window closes immediately
   - Users can't see errors
   - Debugging becomes impossible

### **Cross-Platform Note:**

Bash script (`setup.sh`) doesn't have this issue:
```bash
npm run dashboard:app &
```

This works because:
- Bash treats `npm` as command (not file)
- `&` runs in background without blocking
- Standard Unix behavior

**Takeaway:** PowerShell and Bash handle process launching differently!

---

## 📝 Related Issues

### **Similar Bugs Prevented:**

This same pattern could cause issues with:
- ❌ `Start-Process -FilePath "node"` (opens node.exe in editor? No, but could fail)
- ❌ `Start-Process -FilePath "git"` (PATH resolution issues)
- ❌ `Start-Process -FilePath "python"` (similar problems)

**General Rule:** For CLI tools, wrap in PowerShell/cmd execution rather than direct Start-Process

---

## ✅ Git Commit

```
Commit: dec33bf
Message: FIX: Setup script opens npm.ps1 in Notepad instead of running app
Files: scripts/setup.ps1 (-2, +2 lines)
Status: Pushed to origin/master
```

---

## 🚀 For Future Development

### **When Launching CLI Tools from PowerShell:**

**✅ DO:**
```powershell
Start-Process -FilePath "powershell" -ArgumentList "-NoExit -Command npm run dev"
Start-Process -FilePath "cmd" -ArgumentList "/k npm run dev"
```

**❌ DON'T:**
```powershell
Start-Process -FilePath "npm" -ArgumentList "run", "dev"
Start-Process -FilePath "python" -ArgumentList "script.py"
```

### **Best Practices:**

1. **Use shell wrapper** for CLI commands
2. **Keep window open** with -NoExit or /k
3. **Test on fresh system** (not just dev machine)
4. **Document weird PowerShell quirks** (like this one!)

---

## 🎯 Summary

**Bug:** Setup script opened npm.ps1 in Notepad  
**Cause:** Start-Process treats "npm" as file path, not command  
**Fix:** Launch PowerShell that executes npm command  
**Result:** Dashboard launches correctly in new window  
**Impact:** Better setup experience for all users

**One-line change, major UX improvement!** ✨

---

**This bug is now fixed in the starter kit. Users get smooth setup experience from first run!** 🎉
