# SCMS Setup Guide

Complete installation and configuration guide for Sparse Contextual Memory Scaffolding.

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

### Method 1: Clone into Existing Project (Recommended)

> ⚠️ **First**: Open terminal and navigate to your project root directory before running these commands.

#### Unix/Mac/Linux

```bash
# Clone SCMS into docs folder
git clone https://github.com/AIalchemistART/scms-starter-kit.git docs/scms

# Run setup
cd docs/scms
./scripts/setup.sh
```

#### Windows (PowerShell)

```powershell
# Clone SCMS into docs folder
git clone https://github.com/AIalchemistART/scms-starter-kit.git docs/scms

# Run setup
cd docs/scms
.\scripts\setup.ps1
```

---

### Method 2: Download and Extract (No Git Required)

#### Windows (PowerShell)

```powershell
# Download
Invoke-WebRequest -Uri "https://github.com/AIalchemistART/scms-starter-kit/archive/refs/heads/master.zip" -OutFile "scms.zip"

# Extract and rename
Expand-Archive -Path "scms.zip" -DestinationPath "docs/"
Rename-Item -Path "docs/scms-starter-kit-master" -NewName "scms"
Remove-Item "scms.zip"

# Run setup
cd docs/scms
.\scripts\setup.ps1
```

#### Unix/Mac/Linux

```bash
# Download
curl -L https://github.com/AIalchemistART/scms-starter-kit/archive/refs/heads/master.zip -o scms.zip

# Extract and rename
unzip scms.zip -d docs/
mv docs/scms-starter-kit-master docs/scms
rm scms.zip

# Run setup
cd docs/scms
./scripts/setup.sh
```

---

### Method 3: Start New Project with SCMS

#### Unix/Mac/Linux

```bash
# Clone as base
git clone https://github.com/AIalchemistART/scms-starter-kit.git my-project

# Run setup
cd my-project
./scripts/setup.sh

# Initialize your code
# (SCMS lives in docs/, your code goes in src/ or root)
```

#### Windows (PowerShell)

```powershell
# Clone as base
git clone https://github.com/AIalchemistART/scms-starter-kit.git my-project

# Run setup
cd my-project
.\scripts\setup.ps1

# Initialize your code
# (SCMS lives in docs/, your code goes in src/ or root)
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

**Expected Output**:
```
🚀 SCMS Starter Kit Setup
Detecting IDE...
✓ Windsurf detected
Copying documentation templates...
✓ WORKSPACE_RULES.md created
Creating directory structure...
✓ Directories created
Running windsurf setup...
✓ Memory system configured
Initializing memory dashboard...
✓ Dashboard initialized

✅ SCMS Setup Complete!

Next steps:
1. Edit docs/WORKSPACE_RULES.md with project-specific rules
2. Configure memories in your IDE (see config/windsurf/SETUP.md)
3. Start developing - SCMS builds automatically!
```

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
