# SCMS Setup Guide

Complete installation and configuration guide for Sparse Contextual Memory Scaffolding.

---

## Before You Begin: Is SCMS Right for Your Project?

**SCMS delivers differentiated benefits based on project characteristics**. Review this checklist:

### ✅ Ideal Projects (Proceed with Setup)

Your project has **2+ of these characteristics**:
- [ ] Duration >1 month with iterative pattern discovery
- [ ] Returning to project after gaps (days/weeks between sessions)
- [ ] Complex domain with evolving edge cases
- [ ] Multiple implementation cycles building on prior work
- [ ] Team collaboration requiring context sharing
- [ ] Picking up old codebase with stale context

**Expected Benefit**: 60-96% time reduction in pattern re-discovery

### ✓ Good Fit Projects (Setup Recommended)

Your project has **1-2 of these characteristics**:
- [ ] Established codebase with moderate pattern reuse
- [ ] Regular development with session gaps
- [ ] Knowledge-intensive work (research, complex software)
- [ ] Documentation tends to lag behind implementation

**Expected Benefit**: 30-60% time reduction

### △ Marginal Projects (Consider Alternatives First)

Your project is primarily:
- [ ] Greenfield (starting from scratch with fresh context)
- [ ] Short-term (<1 month duration)
- [ ] Well-documented with comprehensive existing docs
- [ ] Static workflow with minimal pattern evolution

**Expected Benefit**: 15-30% time reduction (still helpful, but lower ROI)

### ❌ Skip Setup For

- One-off throwaway scripts
- Purely preference-based tracking (use standard AI memory instead)
- Compliance/regulatory documentation (use dedicated systems)

**Practical Guidance**: If your project lasts >1 month with iterative pattern discovery, SCMS transitions from "nice to have" to "structural necessity" (see research for proof).

---

## Prerequisites

Before starting, ensure you have:

- ✅ AI assistant with context/memory support (Windsurf, Cursor, Claude, etc.)
- ✅ Text editor or IDE
- ✅ Git (recommended)
- ✅ Command line access

**Time Required**: 15-30 minutes

---

## Installation Methods

> **🤔 Which method should I use?**
> - **Testing SCMS?** → Use Method 3 (Standalone)
> - **Adding to existing project?** → Use Method 1 (Integration)
> - **Starting a new project?** → Use Method 3 (Standalone)

### Method 1: Integrate into Existing Project (Recommended)

**This method copies only the SCMS templates into your project, not the entire repo.**

> **⚠️ IMPORTANT**: Open terminal in YOUR project root first, then run these commands.

#### Unix/Mac/Linux

```bash
# Clone SCMS to temp location
cd ~/Downloads
git clone https://github.com/AIalchemistART/scms-starter-kit.git

# Return to your project and run setup (works from current directory!)
cd -
~/Downloads/scms-starter-kit/scripts/setup.sh

# Clean up temp files
rm -rf ~/Downloads/scms-starter-kit
```

#### Windows (PowerShell)

```powershell
# Clone SCMS to temp location
Set-Location $env:USERPROFILE\Downloads
git clone https://github.com/AIalchemistART/scms-starter-kit.git

# Return to your project and run setup (works from current directory!)
Pop-Location
& "$env:USERPROFILE\Downloads\scms-starter-kit\scripts\setup.ps1"

# Clean up temp files
Remove-Item -Recurse -Force "$env:USERPROFILE\Downloads\scms-starter-kit"
```

**What this does:**
- Detects your current directory as the project root
- Creates `docs/scms/`, `docs/templates/`, `rules/` there
- Copies only templates (not the entire repo!)
- Initializes INDEX.md, WORKSPACE_RULES.md, etc.

---

### Method 2: Download and Extract (No Git Required)

> **⚠️ IMPORTANT**: Open terminal in YOUR project root first, then run these commands.

#### Windows (PowerShell)

```powershell
# Download to temp location
Set-Location $env:USERPROFILE\Downloads
Invoke-WebRequest -Uri "https://github.com/AIalchemistART/scms-starter-kit/archive/refs/heads/master.zip" -OutFile "scms.zip"
Expand-Archive -Path "scms.zip" -DestinationPath "./"

# Return to your project and run setup (works from current directory!)
Pop-Location
& "$env:USERPROFILE\Downloads\scms-starter-kit-master\scripts\setup.ps1"

# Clean up
Remove-Item -Recurse -Force "$env:USERPROFILE\Downloads\scms-starter-kit-master"
Remove-Item "$env:USERPROFILE\Downloads\scms.zip"
```

#### Unix/Mac/Linux

```bash
# Download to temp location
cd ~/Downloads
curl -L https://github.com/AIalchemistART/scms-starter-kit/archive/refs/heads/master.zip -o scms.zip
unzip scms.zip

# Return to your project and run setup (works from current directory!)
cd -
~/Downloads/scms-starter-kit-master/scripts/setup.sh

# Clean up
rm -rf ~/Downloads/scms-starter-kit-master
rm ~/Downloads/scms.zip
```

---

### Method 3: Start New Project with SCMS (Simplest!)

> **✅ Fastest way to test SCMS** - 2 steps and you're running!

#### Unix/Mac/Linux

**Step 1:** Clone and enter directory
```bash
git clone https://github.com/AIalchemistART/scms-starter-kit.git my-project && cd my-project
```

**Step 2:** Configure (2-3 min, detects IDE, sets thresholds)
```bash
./scripts/setup.sh
```

> ✅ **Setup automatically installs dependencies and launches the dashboard!**

**🔄 Relaunch Dashboard Later (if you close it):**
```bash
npm run dashboard:app
```

> **💡 What setup does:** Detects your OS/IDE (Windsurf/Cursor), asks about project phase (greenfield/mature), configures promotion thresholds. Takes 2-3 minutes, only needed once.

#### Windows (PowerShell)

**Step 1:** Clone and enter directory
```powershell
git clone https://github.com/AIalchemistART/scms-starter-kit.git my-project; cd my-project
```

**Step 2:** Configure (2-3 min, detects IDE, sets thresholds)
```powershell
.\scripts\setup.ps1
```

> ✅ **Setup automatically installs dependencies and launches the dashboard!**

**🔄 Relaunch Dashboard Later (if you close it):**
```powershell
npm run dashboard:app
```

---

## Setup Process

### Step 1: Run Setup Script

The setup script will:
- Create necessary directories
- Copy templates to working locations
- Initialize memory dashboard
- Configure for your IDE (if detected)

**Unix/Mac**:
```bash
./scripts/setup.sh
```

**Windows**:
```powershell
.\scripts\setup.ps1
```

**Expected Process**:

The setup script will:

1. **🎯 Guide you through interactive threshold configuration**
   - Project Phase (Greenfield/Establishing/Mature)
   - Team Size (Solo/Small/Large)
   - Domain Characteristics (High-churn/Moderate/Stable)
   - Automatically calculates your promotion threshold (n≥2, 3, or 5)

2. **🔍 Detect your IDE** (Windsurf, Cursor, or Generic)

3. **📁 Create directory structure** (sops/, case-studies/, sessions/)

4. **📄 Copy templates** (WORKSPACE_RULES.md, memory templates)

5. **📊 Initialize dashboard** (with your configured threshold)

6. **✅ Complete!**

**Your threshold configuration will be saved to MEMORY_STATUS_DASHBOARD.md** for reference during development.

---

### Step 2: Configure Project-Specific Rules

Edit `docs/WORKSPACE_RULES.md`:

```bash
# Open in your editor
code docs/WORKSPACE_RULES.md  # VS Code
vim docs/WORKSPACE_RULES.md   # Vim
notepad docs/WORKSPACE_RULES.md  # Windows
```

**Customize These Sections**:

1. **Project Name & Type**
   ```markdown
   # Workspace Rules: [Your Project Name]
   **Project**: My Awesome Project
   **Type**: Web Application / API / Game / etc.
   ```

2. **Tech Stack**
   ```markdown
   ## 🎯 Core Architecture
   - Language: TypeScript/Python/etc.
   - Framework: React/Django/etc.
   - Database: PostgreSQL/MongoDB/etc.
   ```

3. **Coding Conventions**
   - Naming conventions
   - File structure
   - Import organization
   - Testing requirements

**Keep Universal Rules** (already included):
- DRY principles
- Test before change
- Avoid unnecessary refactors

---

### Step 3: IDE-Specific Configuration

Choose your AI assistant and follow the corresponding guide:

#### Option A: Windsurf (Recommended)

**Why Windsurf**: Native memory system, seamless SCMS integration

**Setup**:
1. Open `config/windsurf/SETUP.md`
2. Follow instructions to:
   - Enable Cascade memories
   - Configure memory scope
   - Create initial global memories
   - Enable recursive documentation (optional)

**Time**: 10-15 minutes

**Result**: Full automatic memory retrieval and updates

---

#### Option B: Cursor

**Why Cursor**: Good `.cursorrules` support, manual memory management

**Setup**:
1. Open `config/cursor/SETUP.md`
2. Follow instructions to:
   - Copy `.cursorrules` to project root
   - Configure SCMS instructions
   - Set up file-based memory system
   - Enable @ mentions for doc reference

**Time**: 10-15 minutes

**Result**: Semi-automatic with file-based memories

---

#### Option C: Generic AI Assistant

**For**: ChatGPT, Claude (standalone), GitHub Copilot, etc.

**Setup**:
1. Open `config/generic/SETUP.md`
2. Follow instructions to:
   - Create memory files in `docs/memories/`
   - Manually reference docs in prompts
   - Use templates for consistency

**Time**: 5-10 minutes

**Result**: Manual memory management, still valuable

---

### Step 4: Initialize First Memories

**Windsurf Users**:
```
1. Open Cascade panel
2. Create Memory: "Global Coding Rules"
3. Paste content from rules/GLOBAL_CODING_RULES.md
4. Tag: "global", "scms", "rules"
5. Repeat for project-specific rules
```

**Cursor Users**:
```bash
# Copy global rules to memories
cp rules/GLOBAL_CODING_RULES.md docs/memories/global-rules.md

# Reference in .cursorrules (already done by setup script)
```

**Generic AI Users**:
```
Include this in your prompts:
"Reference docs/WORKSPACE_RULES.md for coding standards
Reference docs/memories/ for active patterns"
```

---

### Step 5: Test SCMS

**Simple Test** (5 minutes):

1. **Make a small code change**
   ```javascript
   // Example: Add a utility function
   function formatDate(date) {
     return date.toISOString().split('T')[0];
   }
   ```

2. **Ask AI to document it**
   ```
   "Document this date formatting pattern as an L0 memory since 
   we'll likely reuse this approach."
   ```

3. **Verify**:
   - Check `docs/memories/` for new memory file (or IDE memory panel)
   - Check `docs/MEMORY_STATUS_DASHBOARD.md` updates (if auto-generated)

4. **Reuse the pattern**
   ```
   "Use the date formatting pattern we documented to format 
   timestamps in the user profile."
   ```

5. **Verify auto-retrieval**:
   - AI should reference the L0 memory
   - On 2nd use, AI should suggest promoting to L1

**If this works**: ✅ SCMS is operational!

---

## Directory Structure After Setup

```
your-project/
├── src/                           # Your source code
├── docs/
│   ├── scms/                      # SCMS system (this starter kit)
│   │   ├── README.md
│   │   ├── SETUP.md (you are here)
│   │   ├── config/
│   │   ├── workflows/
│   │   └── ...
│   │
│   ├── WORKSPACE_RULES.md         # L1: Your quick reference
│   ├── memories/                  # L0: Active validation candidates
│   │   ├── global-rules.md
│   │   └── [auto-created memories]
│   │
│   ├── sops/                      # L2: Detailed procedures (created as needed)
│   ├── case-studies/              # L3: Complete examples (created as needed)
│   └── MEMORY_STATUS_DASHBOARD.md # Validation tracking
│
└── [your other project files]
```

---

## Configuration Options

### Memory Creation Threshold

**Default**: Create L0 memory for every novel pattern

**Adjust** (in IDE configuration or prompt):
```
"Only create memories for patterns likely to be reused (not one-off fixes)"
```

### Promotion Criteria

**Default**:
- L0 → L1: Use count ≥ 2
- L1 → L2: Use count ≥ 5

**Adjust** (edit `docs/MEMORY_STATUS_DASHBOARD.md` thresholds):
```markdown
### Promotion Triggers
- L0 → L1: Use count ≥ 3 (more conservative)
- L1 → L2: Use count ≥ 7
```

### Recursive Documentation

**Default**: Conservative (validate before documenting)

**Enable Recursive** (after 2-3 months):
1. Read `workflows/RECURSIVE_DOCUMENTATION.md`
2. Update IDE configuration to auto-document
3. Evaluate after 15+ implementations

---

## Verification Checklist

After setup, verify:

- [ ] `docs/WORKSPACE_RULES.md` exists and is customized
- [ ] `docs/memories/` directory exists
- [ ] `docs/MEMORY_STATUS_DASHBOARD.md` exists
- [ ] IDE-specific configuration complete (memories enabled, .cursorrules copied, etc.)
- [ ] Test memory creation works
- [ ] Test memory retrieval works
- [ ] Global coding rules accessible to AI

---

## Troubleshooting

### Problem: AI Doesn't Retrieve Memories

**Windsurf**:
- Check Settings → Cascade → Memories enabled ✓
- Verify memory scope (workspace vs global)
- Check memory tags match your request context

**Cursor**:
- Verify `.cursorrules` file in project root
- Check file paths in .cursorrules are correct
- Try explicit @ mentions: `@docs/WORKSPACE_RULES.md`

**Generic AI**:
- Explicitly mention docs in prompt
- Copy relevant sections into conversation

---

### Problem: Setup Script Fails

**Unix/Mac**:
```bash
# Make script executable
chmod +x scripts/setup.sh

# Run with bash explicitly
bash scripts/setup.sh
```

**Windows**:
```powershell
# Enable script execution (if needed)
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned

# Run setup
.\scripts\setup.ps1
```

---

### Problem: Memories Not Updating

**Check**:
1. Are you asking AI to document? (It won't happen automatically until you configure it)
2. Is recursive documentation enabled? (Default: manual)
3. Check `docs/memories/` for file creation

**Fix**:
- Manually create first few memories to establish pattern
- Explicitly ask AI to create/update memories initially

---

### Problem: Dashboard Not Updating

**Manual Update**:
```bash
# If auto-generation script exists
node scripts/generate-dashboard.js

# Or manually edit
code docs/MEMORY_STATUS_DASHBOARD.md
```

Dashboard can be manual initially—focus on memory creation/retrieval first.

---

## Next Steps After Setup

### 1. Start Small (Week 1)

- Use SCMS for 1-2 features
- Create 3-5 L0 memories manually
- Verify retrieval works
- Get comfortable with workflow

### 2. Build Habits (Weeks 2-4)

- Document every novel pattern
- Check dashboard weekly
- Promote validated patterns to L1
- Create first SOP when pattern hits 5 uses

### 3. Evaluate (Month 1)

- Review metrics (re-discovery time, retention)
- Adjust thresholds if needed
- Consider enabling recursive docs if ready

### 4. Optimize (Months 2-4)

- Enable recursive documentation
- Create case studies for complex features
- Fine-tune promotion criteria
- Measure ROI

---

## Advanced Configuration

### Custom Memory Templates

Create in `docs/templates/memory-template.md`:

```markdown
## Memory: [Pattern Name]

**Status**: ⏳ CANDIDATE
**Use Count**: 1
**First Used**: YYYY-MM-DD
**Tags**: [tag1, tag2]

**Pattern**: [Description]

**Code Example**:
```language
// code
```

**Validation**: [What to test]
```

### Auto-Generation Scripts

**Dashboard Generator** (optional):
```javascript
// scripts/generate-dashboard.js
// Scans memories/, counts use_count, generates dashboard
```

**Memory Helper** (optional):
```javascript
// scripts/memory-helper.js
// Creates memory from template, updates use_count
```

---

## Support

**Documentation**: See [docs/00_DOCUMENTATION_HIERARCHY.md](docs/00_DOCUMENTATION_HIERARCHY.md)

**Examples**: Review [docs/examples/](docs/examples/)

**Issues**: [GitHub Issues](https://github.com/AIalchemistART/scms-starter-kit/issues)

**Questions**: [GitHub Discussions](https://github.com/AIalchemistART/scms-starter-kit/discussions)

---

## Summary

**You've completed setup when**:
- ✅ Templates copied to project
- ✅ IDE configured for memory system
- ✅ WORKSPACE_RULES.md customized
- ✅ Test memory creation/retrieval works

**Now you can**:
- Develop normally with AI assistant
- SCMS captures patterns automatically (or on request)
- Knowledge base builds as you work
- Re-discovery time drops dramatically

**Welcome to continual learning!** 🚀

---

**Previous**: [README.md](README.md) | **Next**: [How SCMS Works](docs/00_DOCUMENTATION_HIERARCHY.md)
