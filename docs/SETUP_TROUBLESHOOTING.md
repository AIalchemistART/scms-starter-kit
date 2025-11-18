# 🔧 SCMS Setup Troubleshooting

Common setup issues and solutions

---

## ❌ Error: `ENOENT: no such file or directory, open 'package.json'`

### **Symptom:**
```
npm error code ENOENT
npm error syscall open
npm error path C:\Your\Project\package.json
npm error errno -4058
npm error enoent Could not read package.json
```

### **What This Means:**
You're trying to run `npm` commands in a folder that doesn't have SCMS files yet!

### **Common Causes:**

1. **You're in the wrong directory**
   - SCMS is in `docs/scms` but you're in project root
   - Solution: `cd docs/scms` then run commands

2. **SCMS not installed yet**
   - You created a new project folder but haven't cloned SCMS
   - Solution: Follow installation steps first

3. **Wrong setup approach**
   - Used subdirectory instructions but want standalone
   - Solution: Choose correct approach for your needs

---

## ✅ **Solutions by Setup Approach**

### **If Using Subdirectory Approach:**

```powershell
# Navigate to SCMS folder
cd docs/scms

# Install dependencies (first time only)
npm install

# Run dashboard
npm run dashboard:app
```

**Key Point:** All `npm` commands run from `docs/scms` folder!

---

### **If Using Standalone Approach:**

```powershell
# Clone SCMS as your project
git clone https://github.com/AIalchemistART/scms-starter-kit.git your-project-name

# Navigate in
cd your-project-name

# Install and run
npm install
npm run dashboard:app
```

**Key Point:** All commands run from project root!

---

## 🎯 **Quick Fix for Your Situation**

### **Scenario 1: Testing SCMS (no existing project)**

```powershell
# Clone as standalone
cd C:\Games\Projects
git clone https://github.com/AIalchemistART/scms-starter-kit.git tester
cd tester
npm install
npm run dashboard:app
```

### **Scenario 2: Adding to existing project**

```powershell
# Navigate to your project
cd C:\Games\Projects\your-project

# Clone SCMS into subdirectory
git clone https://github.com/AIalchemistART/scms-starter-kit.git docs/scms

# Navigate to SCMS folder
cd docs/scms

# Install and run
npm install
npm run dashboard:app
```

### **Scenario 3: Already have SCMS folder**

```powershell
# Just navigate to it!
cd C:\Games\Projects\scms-starter-kit-github

# Run dashboard
npm run dashboard:app
```

---

## 📋 **Setup Approach Comparison**

| Aspect | Subdirectory | Standalone |
|--------|--------------|------------|
| **Location** | `docs/scms/` | Project root |
| **Commands from** | `docs/scms` | Project root |
| **Best for** | Existing projects | Testing / New projects |
| **Your files** | Separate folder | Mixed with SCMS |
| **Git** | SCMS in submodule | SCMS is the repo |

---

## 🐛 **Other Common Errors**

### **Error: `electron: command not found`**

**Cause:** Dev dependencies not installed

**Fix:**
```bash
npm install --include=dev
```

---

### **Error: `clipboardy not installed`**

**Cause:** Regular dependencies not installed

**Fix:**
```bash
npm install
```

---

### **Dashboard opens but shows no data**

**Cause:** Data file doesn't exist yet

**Fix:** 
1. Start a session in dashboard
2. Work in your IDE
3. Export data - checkpoint created
4. Dashboard updates automatically!

---

### **"Cannot find module" errors**

**Cause:** Dependencies not installed or corrupted

**Fix:**
```bash
# Delete and reinstall
rm -rf node_modules
rm package-lock.json
npm install
```

---

## 💡 **Pro Tips**

### **Check Where You Are:**
```powershell
# Windows
pwd

# Shows: C:\Games\Projects\tester
# Is this where your package.json is?
```

### **Verify SCMS Files:**
```powershell
# Check for required files
ls package.json
ls electron/
ls docs/tools/scms-dashboard.html

# If these exist, you're in the right place!
```

### **Fresh Start:**
```bash
# Delete everything and re-clone
rm -rf your-project-name
git clone https://github.com/AIalchemistART/scms-starter-kit.git your-project-name
cd your-project-name
npm install
npm run dashboard:app
```

---

## 🎯 **Decision Tree**

**Start here:** Do you have an existing project?

**YES → Use Subdirectory Approach**
1. Navigate to your project root
2. `git clone https://github.com/AIalchemistART/scms-starter-kit.git docs/scms`
3. `cd docs/scms`
4. `npm install`
5. `npm run dashboard:app`

**NO → Use Standalone Approach**
1. Navigate to projects folder
2. `git clone https://github.com/AIalchemistART/scms-starter-kit.git your-project-name`
3. `cd your-project-name`
4. `npm install`
5. `npm run dashboard:app`

---

## 📚 **Related Documentation**

- **Main README:** Complete setup guide
- **Dashboard App:** `DASHBOARD_APP_README.md`
- **Checkpoint Tracking:** `docs/AUTOMATIC_CHECKPOINT_TRACKING.md`

---

## ✅ **Still Stuck?**

**Checklist:**
- [ ] Am I in the correct directory?
- [ ] Does `package.json` exist here?
- [ ] Did I run `npm install`?
- [ ] Is `node_modules` folder present?
- [ ] Did I follow the right approach (subdirectory vs standalone)?

**Quick Verification:**
```bash
# These should all succeed
ls package.json
ls node_modules
ls electron/dashboard-main.js
npm run dashboard:app
```

If all else fails, try the standalone approach - it's the simplest for testing!

---

**Most Common Fix:** You're probably just in the wrong directory. Navigate to where `package.json` exists and try again! 🚀
