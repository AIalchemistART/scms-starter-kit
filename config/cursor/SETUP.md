# Cursor + SCMS Setup Guide

**Cursor IDE** with `.cursorrules` file provides good SCMS integration through custom instructions.

---

## Why Cursor Works Well with SCMS

- ✅ **`.cursorrules` support** - Project-specific AI instructions
- ✅ **File references** - Can reference docs with @ mentions
- ✅ **Context awareness** - Includes relevant files automatically
- ✅ **Fast iteration** - Quick implement-test cycles
- ✅ **File-based memories** - Explicit, version-controlled

**Result**: Solid SCMS experience with manual memory management.

---

## Prerequisites

- ✅ Cursor IDE installed (latest version)
- ✅ SCMS Starter Kit in your project
- ✅ Basic familiarity with Cursor

---

## Setup Steps

### Step 1: Copy `.cursorrules` File

The setup script should have copied `.cursorrules` to your project root.

**Verify**:
```bash
ls -la .cursorrules  # Unix/Mac
dir .cursorrules     # Windows
```

**Manual copy if needed**:
```bash
cp config/cursor/.cursorrules .cursorrules
```

**Location**: `.cursorrules` must be in project root (not in scms/ folder)

---

### Step 2: Verify `.cursorrules` Content

Open `.cursorrules` and verify it contains SCMS instructions:

```markdown
# SCMS Documentation System

This project uses Sparse Contextual Memory Scaffolding (SCMS).

## Documentation Layers
- L0: Active memories (docs/memories/)
- L1: Quick reference (docs/WORKSPACE_RULES.md)
- L2: Detailed SOPs (docs/sops/)
- L3: Case studies (docs/case-studies/)

## Workflow
[... instructions ...]
```

---

### Step 3: Create Memory File Structure

Cursor uses file-based memories in `docs/memories/`.

**Create directories** (setup script should have done this):
```bash
mkdir -p docs/memories
mkdir -p docs/sops
mkdir -p docs/case-studies
mkdir -p docs/sessions
```

---

### Step 4: Create Global Rules Memory

**Create file**: `docs/memories/global-rules.md`

**Content**: Copy from `rules/GLOBAL_CODING_RULES.md`

**Why**: Global rules available to Cursor via @ mention or automatic inclusion.

---

### Step 5: Customize WORKSPACE_RULES.md

**Edit**: `docs/WORKSPACE_RULES.md`

**Customize**:
- Project name and type
- Tech stack
- Coding conventions
- Architecture patterns

**This is your L1 layer** - validated patterns go here.

---

## Daily Workflow

### Conservative Documentation (Default)

```
1. You: "Implement feature X"
2. Cursor: [implements]
3. You: [test in real environment]
4. You: "Document this pattern in docs/memories/[pattern-name].md"
5. Cursor: [creates memory file with content]
```

---

### With Manual Memory Management

**After implementation**:

1. **Create memory file**:
   ```bash
   touch docs/memories/[pattern-name].md
   ```

2. **Fill template**:
   - Copy from `docs/templates/MEMORY_TEMPLATE.md`
   - Fill in pattern details
   - Set status: ⏳ CANDIDATE

3. **Reference in next session**:
   ```
   You: "Use pattern from @docs/memories/[pattern-name].md"
   ```

---

### With Recursive Documentation (Optional)

**Update `.cursorrules`**:
```markdown
# Recursive Documentation (ENABLED)

After every implementation:
1. Create/update file in docs/memories/[pattern-name].md
2. Set status: CANDIDATE
3. Increment use_count
4. If use_count >= 2: Add to WORKSPACE_RULES.md
5. If use_count >= 5: Suggest creating SOP

Report what was documented.
```

**Then Cursor will auto-document** (after 2-3 months when ready).

---

## File-Based Memory Management

### Memory File Structure

**Location**: `docs/memories/[pattern-name].md`

**Naming Convention**:
- Use kebab-case: `dual-key-qte-pattern.md`
- Descriptive: `api-error-retry-logic.md`
- Not: `pattern1.md` or `thing.md`

**Template**:
```markdown
# Memory: [Pattern Name]

**Status**: ⏳ CANDIDATE | ✅ VALIDATED | 🚀 PROMOTED
**Use Count**: 1
**First Used**: 2025-10-24
**Last Used**: 2025-10-24

## Pattern

[Description]

## Code Example

```language
// code
```

## Validation

- [ ] Tested and working
- [ ] No edge cases found
```

---

### Referencing Memories

**In Cursor**:
```
You: "Use the pattern from @docs/memories/dual-key-qte-pattern.md"
```

**Cursor will**:
- Load the file into context
- Apply the pattern
- Reference it in implementation

---

### Updating Memories

**Manual Update**:
1. Open `docs/memories/[pattern].md`
2. Edit content
3. Increment `use_count`
4. Update `last_used` date
5. Change `status` if validated

**With Cursor Help**:
```
You: "Update memory @docs/memories/[pattern].md - used again successfully"
Cursor: [updates file, increments use_count]
```

---

## Promotion Workflow

### L0 → L1 (Memory → WORKSPACE_RULES)

**When**: Pattern used 2nd time

**Manual**:
1. Open `docs/WORKSPACE_RULES.md`
2. Add pattern under relevant section
3. Copy code from memory file
4. Update memory status: 🚀 PROMOTED

**With Cursor**:
```
You: "Promote @docs/memories/[pattern].md to WORKSPACE_RULES"
Cursor: [extracts to WORKSPACE_RULES.md, updates memory]
```

---

### L1 → L2 (WORKSPACE_RULES → SOP)

**When**: Pattern used 5th time, needs detailed procedure

**Manual**:
1. Copy `docs/templates/SOP_TEMPLATE.md`
2. Rename: `docs/sops/[PATTERN]_SOP.md`
3. Fill in all sections
4. Link from WORKSPACE_RULES.md

**With Cursor**:
```
You: "Create SOP for [pattern] using @docs/templates/SOP_TEMPLATE.md"
Cursor: [creates and fills SOP]
```

---

## Using @ Mentions

### Reference Documentation

**WORKSPACE_RULES**:
```
You: "Follow the pattern from @docs/WORKSPACE_RULES.md section [X]"
```

**Specific Memory**:
```
You: "@docs/memories/api-retry-pattern.md - apply this to user endpoint"
```

**SOP**:
```
You: "Follow @docs/sops/AUTHENTICATION_SOP.md to add auth"
```

**Template**:
```
You: "Create memory using @docs/templates/MEMORY_TEMPLATE.md"
```

---

## Memory Organization

### Recommended Structure

```
docs/
├── WORKSPACE_RULES.md (L1 - validated patterns)
├── memories/ (L0 - active validation candidates)
│   ├── global-rules.md
│   ├── api-patterns.md
│   ├── testing-patterns.md
│   ├── [feature]-pattern.md
│   └── ...
├── sops/ (L2 - detailed procedures)
│   ├── AUTHENTICATION_SOP.md
│   ├── DATABASE_SETUP_SOP.md
│   └── ...
├── case-studies/ (L3 - complete examples)
│   └── [FEATURE]_CASE_STUDY.md
└── sessions/ (L4 - historical)
    └── SESSION_2025-10-24.md
```

---

## Troubleshooting

### Issue: Cursor Not Referencing Memories

**Cause**: Files not in context or @ mention not used

**Solutions**:
1. **Use @ mention**: Explicitly reference file
2. **Include in conversation**: Paste content if needed
3. **Check .cursorrules**: Verify SCMS instructions present

---

### Issue: Memories Getting Stale

**Cause**: Files not updated after use

**Solutions**:
1. **Update manually**: Edit file, increment use_count
2. **Ask Cursor**: "Update memory [X] with latest use"
3. **Monthly review**: Check all memories, archive unused

---

### Issue: Too Many Memory Files

**Cause**: Creating memory for every small thing

**Solutions**:
1. **Be selective**: Only for reusable patterns
2. **Archive old ones**: Move to `docs/memories/archived/`
3. **Promote to L1**: Move validated patterns to WORKSPACE_RULES

---

## Automation Helper Script

**Optional**: Create script to help manage memories

**`scripts/memory-helper.js`**:
```javascript
// Helper script to create/update memories
// Run: node scripts/memory-helper.js create "Pattern Name"

const fs = require('fs');
const path = require('path');

// Create memory from template
function createMemory(name) {
  const template = fs.readFileSync('docs/templates/MEMORY_TEMPLATE.md', 'utf8');
  const filename = name.toLowerCase().replace(/\s+/g, '-');
  const filepath = path.join('docs/memories', `${filename}.md`);
  
  const content = template
    .replace(/\[Pattern Name\]/g, name)
    .replace(/YYYY-MM-DD/g, new Date().toISOString().split('T')[0]);
  
  fs.writeFileSync(filepath, content);
  console.log(`✓ Created: ${filepath}`);
}

// Update memory use count
function updateMemory(filename) {
  const filepath = path.join('docs/memories', filename);
  let content = fs.readFileSync(filepath, 'utf8');
  
  // Increment use count
  content = content.replace(/\*\*Use Count\*\*: (\d+)/, (match, count) => {
    return `**Use Count**: ${parseInt(count) + 1}`;
  });
  
  // Update last used
  const today = new Date().toISOString().split('T')[0];
  content = content.replace(/\*\*Last Used\*\*: .*/, `**Last Used**: ${today}`);
  
  fs.writeFileSync(filepath, content);
  console.log(`✓ Updated: ${filepath}`);
}

// CLI
const command = process.argv[2];
const arg = process.argv[3];

if (command === 'create') {
  createMemory(arg);
} else if (command === 'update') {
  updateMemory(arg);
} else {
  console.log('Usage: node scripts/memory-helper.js create "Pattern Name"');
  console.log('       node scripts/memory-helper.js update pattern-name.md');
}
```

**Use**:
```bash
node scripts/memory-helper.js create "API Retry Pattern"
node scripts/memory-helper.js update api-retry-pattern.md
```

---

## Dashboard Generation (Optional)

**`scripts/generate-dashboard.js`**:
```javascript
// Generate MEMORY_STATUS_DASHBOARD.md from memory files
const fs = require('fs');
const path = require('path');

const memoriesDir = 'docs/memories';
const files = fs.readdirSync(memoriesDir).filter(f => f.endsWith('.md'));

let dashboard = '# Memory Status Dashboard\n\n';
dashboard += `**Last Updated**: ${new Date().toISOString().split('T')[0]}\n\n`;
dashboard += '## Active Memories\n\n';

let candidates = [];
let validated = [];
let promoted = [];

files.forEach(file => {
  const content = fs.readFileSync(path.join(memoriesDir, file), 'utf8');
  const statusMatch = content.match(/\*\*Status\*\*: (.+)/);
  const useCountMatch = content.match(/\*\*Use Count\*\*: (\d+)/);
  
  if (statusMatch && useCountMatch) {
    const entry = { file, status: statusMatch[1], useCount: parseInt(useCountMatch[1]) };
    
    if (entry.status.includes('CANDIDATE')) candidates.push(entry);
    else if (entry.status.includes('VALIDATED')) validated.push(entry);
    else if (entry.status.includes('PROMOTED')) promoted.push(entry);
  }
});

dashboard += `### Candidates: ${candidates.length}\n`;
candidates.forEach(e => {
  dashboard += `- ${e.file} (use_count: ${e.useCount})\n`;
});

dashboard += `\n### Validated: ${validated.length}\n`;
validated.forEach(e => {
  dashboard += `- ${e.file} (use_count: ${e.useCount})\n`;
});

dashboard += `\n### Promoted: ${promoted.length}\n`;
promoted.forEach(e => {
  dashboard += `- ${e.file} (use_count: ${e.useCount})\n`;
});

fs.writeFileSync('docs/MEMORY_STATUS_DASHBOARD.md', dashboard);
console.log('✓ Dashboard generated');
```

**Use**:
```bash
node scripts/generate-dashboard.js
```

---

## Best Practices

### DO ✅

- **Use @ mentions**: Explicitly reference docs
- **Update use_count**: After each use
- **Promote at 2 uses**: Trust the threshold
- **Create clear filenames**: kebab-case, descriptive
- **Keep memories focused**: One pattern per file

### DON'T ❌

- **Don't forget to update**: Memories get stale if not maintained
- **Don't create duplicates**: Check existing memories first
- **Don't skip validation**: Test before marking VALIDATED
- **Don't over-create**: Only for reusable patterns
- **Don't delete prematurely**: Archive instead

---

## Quick Reference

### Create Memory
```bash
# Manual
touch docs/memories/pattern-name.md
# Fill from template

# With helper script
node scripts/memory-helper.js create "Pattern Name"
```

### Reference Memory
```
@docs/memories/pattern-name.md
```

### Promote to L1
```
Copy to WORKSPACE_RULES.md, update memory status
```

### Create SOP
```
Copy docs/templates/SOP_TEMPLATE.md to docs/sops/PATTERN_SOP.md
```

---

## Support

**Documentation**:
- System overview: `docs/00_DOCUMENTATION_HIERARCHY.md`
- Workflows: `workflows/`
- Templates: `docs/templates/`

**Cursor Help**:
- Cursor Documentation
- Cursor Community

---

**Cursor + SCMS = Solid continual learning with explicit, version-controlled memory management!** 🚀

**Status**: ✅ Setup complete - Start developing with file-based memories!
