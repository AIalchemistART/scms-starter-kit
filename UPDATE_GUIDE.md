# 🔄 SCMS Starter Kit - Update Guide

**Version:** 3.2  
**Last Updated:** November 17, 2025  
**Your data is safe!** All session data is protected by `.gitignore`.

---

## Quick Update

### If You Cloned the Repo (Recommended)

```bash
cd scms-starter-kit-github
git pull origin master
npm install  # Update any new dependencies
npm run dashboard:app  # Test that everything works
```

**That's it!** Your session data is automatically protected and won't be overwritten.

---

### If You Downloaded as ZIP (Manual Update)

```bash
# 1. Backup your data (just in case)
cp economics-dashboard-data.json economics-dashboard-data.backup.json

# 2. Download new version from GitHub
# Extract to new folder

# 3. Copy your data back
cp economics-dashboard-data.backup.json new-folder/economics-dashboard-data.json

# 4. Test
cd new-folder
npm install
npm run dashboard:app
```

---

## What Gets Updated vs What's Protected

### ✅ What Gets Updated (Tracked in Git)

These files will be updated when you pull changes:

- **Dashboard Features:** `docs/tools/scms-dashboard.html`
- **Documentation:** `README.md`, all guides in `docs/`
- **L1 Validated Patterns:** `WORKSPACE_RULES.md`
- **Core Scripts:** `scms-cost-tracker.js`, dashboard utilities
- **Configuration:** `package.json`, `.gitignore` improvements
- **Templates:** `economics-dashboard-data.json.example`

### 🔒 What's Protected (Git-Ignored)

These files will **NEVER** be tracked or overwritten:

- **Your Session Data:** `economics-dashboard-data.json`
- **Your Checkpoints:** `checkpoints/` directory
- **Your Sessions:** `scms-sessions/` directory
- **Your Customizations:** `WORKSPACE_RULES.custom.md`
- **Your Backups:** `*.backup.json` files
- **Dependencies:** `node_modules/` (reinstall with `npm install`)
- **Local Config:** `.env.local`

---

## Troubleshooting

### "I see merge conflicts"

This should NEVER happen with user data files (they're git-ignored). If you see conflicts:

```bash
# Check what files have conflicts
git status

# If conflicts are in tracked files (documentation, etc.):
# Option 1: Keep remote version
git checkout --theirs <file>

# Option 2: Keep your version
git checkout --ours <file>

# Option 3: Manually resolve and commit
```

### "My session data disappeared"

Check if you accidentally deleted it:

```bash
# Look for backups
ls -la *.backup.json

# Check if file exists
ls -la economics-dashboard-data.json

# If lost, restore from example template
cp economics-dashboard-data.json.example economics-dashboard-data.json
```

**Your data should be backed up regularly!** Consider adding to your session closure routine.

### "Git pull says 'Already up to date' but I see new features on GitHub"

```bash
# Fetch latest changes
git fetch origin

# Check what's different
git log HEAD..origin/master --oneline

# Force update if needed (ONLY if you haven't made local changes)
git reset --hard origin/master
npm install
```

### "I have local changes I want to keep"

```bash
# Stash your changes
git stash

# Pull updates
git pull origin master

# Restore your changes
git stash pop

# If conflicts, resolve them manually
```

### "npm install fails"

```bash
# Clear npm cache
npm cache clean --force

# Delete node_modules and reinstall
rm -rf node_modules package-lock.json
npm install

# If still fails, check Node.js version
node --version  # Should be 14.x or higher
```

---

## Best Practices

### 1. **Before Updating**

```bash
# Create a backup
cp economics-dashboard-data.json economics-dashboard-data.backup.$(date +%Y%m%d).json

# Check current version
git log -1 --oneline

# Check for uncommitted changes
git status
```

### 2. **After Updating**

```bash
# Verify dashboard loads
npm run dashboard:app

# Check for breaking changes
git log origin/master --oneline -10

# Test core functionality
- [ ] Dashboard loads without errors
- [ ] Session data displays correctly
- [ ] Export functionality works
- [ ] Cost tracking functions
- [ ] No console errors/warnings (should be fresh)
- [ ] Test export functionality
- [ ] Review UPDATE notes in commit messages
```

---

## 🚀 What's New? (Version History)

### **v3.2 (November 17, 2025)**
- ✅ Data staleness detection with visual warnings
- ✅ Session counter metric card
- ✅ Enhanced console diagnostics
- ✅ Export disconnect fix (auto-updates source file)
- ✅ L1 pattern: Multi-Edit Batch Operations
- ✅ Update-safe workflow (this guide!)

### **v3.1 (November 17, 2025)**
- ✅ Dashboard workflow improvements
- ✅ Validation Commit Layer terminology
- ✅ Enhanced economic metrics
- ✅ Startup vs Session Start clarity

### **v3.0 (Earlier)**
- ✅ Session closure prompts v3.0
- ✅ Enhanced economics dashboard
- ✅ Dual-Inevitability Theorem visualization

---

## 💡 Pro Tips

### **Automatic Updates (Advanced)**

Set up a cron job or scheduled task:

```bash
# Create update script: update-scms.sh
#!/bin/bash
cd /path/to/scms-starter-kit
git pull origin master
npm install
echo "SCMS Starter Kit updated: $(date)" >> update.log
```

### **Version Pinning**

If you want to stay on a specific version:

```bash
# Create a branch for your work
git checkout -b my-work

# Pull specific version when ready
git fetch origin
git merge v3.2  # or specific commit
```

### **Hybrid Approach**

Use git for tracking but customize locally:

```bash
# Clone repo
git clone https://github.com/AIalchemistART/scms-starter-kit.git

# Create local branch
git checkout -b local-custom

# Make customizations
# Your data is still protected by .gitignore

# Update from master when ready
git fetch origin
git merge origin/master
```

---

## ❓ FAQ

**Q: Will updating delete my session data?**  
A: No! All user data is protected by `.gitignore` and won't be tracked or overwritten.

**Q: Can I customize WORKSPACE_RULES.md without conflicts?**  
A: Use `WORKSPACE_RULES.custom.md` for your custom patterns (it's git-ignored).

**Q: How often should I update?**  
A: Check for updates monthly, or when you see new features announced. Updates are backward-compatible.

**Q: What if I accidentally deleted my data file?**  
A: Check your backups. If no backup exists, you'll need to rebuild from exports or start fresh with the `.example` template.

**Q: Can I contribute improvements back?**  
A: Yes! Fork the repo, make changes, and submit a pull request. Your data stays private (git-ignored).

---

## 🛡️ Data Safety Guarantee

**Protected by `.gitignore`:**
```gitignore
economics-dashboard-data.json
checkpoints/
WORKSPACE_RULES.custom.md
```

**Tracked in Git (safe to update):**
```
docs/
scms/
README.md
WORKSPACE_RULES.md
package.json
```

**Your data will NEVER be:**
- Committed to git (it's ignored)
- Overwritten by updates (it's protected)
- Shared publicly (it's local only)

---

## 📞 Need Help?

- **Issue Tracker:** GitHub Issues
- **Documentation:** README.md
- **Dashboard Guide:** docs/guides/SCMS_ECONOMIC_DASHBOARD.md
- **Session Closure:** docs/guides/SCMS_SESSION_CLOSURE.md

---

**Your data is safe. Update with confidence!** 🚀✅
