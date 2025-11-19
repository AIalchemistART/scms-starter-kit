# Dogfooding Example - SCMS Starter Kit Development

**Purpose**: This folder contains real SCMS operational files generated while developing the SCMS Starter Kit itself.

**Status**: These are **example files** showing what a mature SCMS project looks like.

---

## 📁 What's Here

- `INDEX.md` - Knowledge graph from building the starter kit
- `FAILURES.md` - Real failures logged during development
- `WORKSPACE_RULES.md` - Validated patterns for kit development
- `SESSION_LOG_L5.md` - Latest session audit
- `MEMORY_STATUS_DASHBOARD.md` - Memory tracking dashboard
- `SCMS_STARTUP_PROMPT.md` - Startup prompt used for kit development

---

## 🎯 How to Use

**Don't copy these files directly!** They're specific to the starter kit development.

Instead:
1. Use templates from `docs/templates/`
2. Initialize fresh files using the setup script: `scripts/setup.ps1`
3. OR review these files to see how SCMS looks in action

---

## 🚀 For New Projects

**Start fresh:**
```powershell
cd your-project
.\scripts\setup.ps1  # Creates your own SCMS files
```

Your project will generate its own INDEX.md, FAILURES.md, etc. in `docs/scms/`

---

**Note**: These example files may be outdated compared to current templates. Always use `docs/templates/` as the source of truth.
