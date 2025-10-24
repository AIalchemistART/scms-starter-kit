# Generic AI Assistant + SCMS Setup Guide

**For**: ChatGPT, Claude (standalone), GitHub Copilot, or any AI assistant without native memory support

---

## Overview

While SCMS works best with native memory systems (Windsurf) or `.cursorrules` support (Cursor), you can still use it with any AI assistant through manual memory management.

**Approach**: File-based memories + explicit prompts

---

## Setup Steps

### Step 1: Create Documentation Structure

**Run setup script** (creates folders):
```bash
# Unix/Mac
./scripts/setup.sh

# Windows
.\scripts\setup.ps1
```

**Or manually**:
```bash
mkdir -p docs/memories
mkdir -p docs/sops
mkdir -p docs/case-studies
mkdir -p docs/sessions
```

---

### Step 2: Copy Templates

```bash
# Copy WORKSPACE_RULES template
cp docs/templates/WORKSPACE_RULES_TEMPLATE.md docs/WORKSPACE_RULES.md

# Initialize dashboard
touch docs/MEMORY_STATUS_DASHBOARD.md
```

**Edit `docs/WORKSPACE_RULES.md`**:
- Fill in project details
- Add tech stack
- Customize conventions

---

### Step 3: Create System Prompt

**Create**: `.scms-prompt.md` (reference file)

**Content**:
```markdown
# SCMS System for [Your Project]

You are working with Sparse Contextual Memory Scaffolding (SCMS).

## Documentation Layers

- **L0**: docs/memories/ - Active validation candidates
- **L1**: docs/WORKSPACE_RULES.md - Validated patterns (≥2 uses)
- **L2**: docs/sops/ - Detailed procedures (≥5 uses)
- **L3**: docs/case-studies/ - Complete examples
- **L4**: docs/sessions/ - Historical records

## Workflow

After implementation:
1. Create memory file in docs/memories/[pattern-name].md
2. Mark as CANDIDATE until user validates
3. Track use_count
4. Promote to L1 at 2nd use
5. Suggest L2 SOP at 5th use

## Status Markers

- ⏳ CANDIDATE - Awaiting validation
- ✅ VALIDATED - Proven through testing
- 🚀 PROMOTED - Moved to WORKSPACE_RULES
- 📚 SOP READY - Used 5+ times

## Rules

See docs/WORKSPACE_RULES.md for project patterns.
See rules/GLOBAL_CODING_RULES.md for universal rules.
```

---

### Step 4: Create Memory Template Reference

**Create**: `docs/memories/_TEMPLATE.md`

**Content**: Copy from `docs/templates/MEMORY_TEMPLATE.md`

**Use**: Copy this when creating new memories

---

## Daily Workflow

### Starting a Session

**Paste this into your AI assistant**:

```
I'm working on [project name] which uses SCMS for knowledge management.

Please reference these files:
- docs/WORKSPACE_RULES.md (validated patterns)
- docs/memories/ (active memories)
- rules/GLOBAL_CODING_RULES.md (universal rules)

Current task: [your task]

Documentation system:
- L0 (memories/): Active patterns, status-tracked
- L1 (WORKSPACE_RULES.md): Validated patterns (≥2 uses)
- L2 (sops/): Detailed procedures (≥5 uses)

After implementation, create/update memory file in docs/memories/.
```

---

### After Implementation

**You create memory manually**:

1. **Create file**: `docs/memories/[pattern-name].md`

2. **Use template**: Copy from `docs/memories/_TEMPLATE.md`

3. **Fill in**:
   ```markdown
   # Memory: [Pattern Name]
   
   **Status**: ⏳ CANDIDATE
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
   ```

4. **Test** in your environment

5. **Mark validated** if successful:
   ```markdown
   **Status**: ✅ VALIDATED
   ```

---

### Reusing a Pattern

**In next session**:

```
Reference this pattern from docs/memories/[pattern-name].md:

[Paste memory content]

Apply this to [new scenario]
```

**AI will**:
- Read the pattern
- Apply to new context
- Suggest updating use_count

---

### Promoting to L1

**When pattern used 2nd time**:

1. **Open** `docs/WORKSPACE_RULES.md`

2. **Add under relevant section**:
   ```markdown
   ### [Pattern Name] (Validated Pattern - Use Count: 2)
   
   **When to Use**: [From memory]
   
   **Pattern**:
   ```language
   // Code from memory
   ```
   
   **Known Edge Cases**: [From memory]
   ```

3. **Update memory**:
   ```markdown
   **Status**: 🚀 PROMOTED to L1
   **Promoted To**: WORKSPACE_RULES.md → [Section]
   ```

---

## Memory Management

### File Organization

```
docs/memories/
├── _TEMPLATE.md (reference)
├── api-patterns.md
├── testing-patterns.md
├── [feature]-pattern.md
└── archived/
    └── old-pattern.md
```

**Naming**: Use kebab-case, descriptive names

---

### Tracking Use Count

**Manual tracking**:

1. Open memory file
2. Increment **Use Count**: 1 → 2
3. Update **Last Used**: New date
4. Add to **Usage History** section (optional)

**Or ask AI**:
```
Update docs/memories/[pattern].md:
- Increment use_count to 2
- Update last_used to today
- Mark as VALIDATED
```

---

### Monthly Review

**Check memories**:

```bash
# List all memories
ls docs/memories/

# Check status of each
grep "Status" docs/memories/*.md
```

**Archive unused** (30+ days, use_count < 2):

```bash
mv docs/memories/old-pattern.md docs/memories/archived/
```

---

## Using References

### In ChatGPT/Claude

**Paste relevant docs**:

```
Here's my WORKSPACE_RULES.md:

[Paste content]

Task: Implement [feature]
```

**Or reference by description**:

```
Apply the "API retry pattern" from my docs (exponential backoff, max 3 retries)
```

---

### Building Context

**Start each session with**:

1. **System context**:
   ```
   Project: [name]
   Stack: [technologies]
   SCMS docs in: docs/
   ```

2. **Relevant patterns**:
   ```
   Reference these patterns:
   - [Pattern 1] (docs/memories/[file].md)
   - [Pattern 2] (docs/WORKSPACE_RULES.md → [section])
   ```

3. **Task**:
   ```
   Implement: [your task]
   ```

---

## Promotion Workflow

### L0 → L1 (Manual)

**When**: Pattern used 2nd time

**Steps**:
1. Copy pattern from memory file
2. Add to WORKSPACE_RULES.md
3. Update memory status: PROMOTED
4. Note section in memory

---

### L1 → L2 (Manual)

**When**: Pattern used 5th time

**Steps**:
1. Copy `docs/templates/SOP_TEMPLATE.md`
2. Rename: `docs/sops/[PATTERN]_SOP.md`
3. Fill all sections
4. Link from WORKSPACE_RULES.md

**Or ask AI**:
```
Create SOP for [pattern] in docs/sops/[PATTERN]_SOP.md

Include:
- Overview
- Step-by-step implementation
- Common pitfalls
- Testing checklist

Use content from docs/memories/[pattern].md and WORKSPACE_RULES.md
```

---

## Dashboard Management

### Manual Dashboard

**Edit**: `docs/MEMORY_STATUS_DASHBOARD.md`

**Content**:
```markdown
# Memory Status Dashboard

**Last Updated**: 2025-10-24

## Active Memories (L0)

### Candidates (Awaiting Validation)
- api-retry-pattern.md (use_count: 1)
- date-formatting.md (use_count: 1)

### Validated (Proven)
- dual-key-qte.md (use_count: 2) → Ready for L1
- error-handling.md (use_count: 3)

### Promoted (In L1)
- state-management.md (use_count: 5) → Consider L2 SOP

## Summary
- Total memories: 6
- Candidates: 2
- Validated: 2
- Promoted: 2
- Ready for L1: 1
- Ready for L2: 1
```

**Update weekly** after coding sessions

---

## Automation Helpers

### Simple Scripts

**`scripts/list-memories.sh`**:
```bash
#!/bin/bash
echo "=== SCMS Memories ==="
echo ""
for file in docs/memories/*.md; do
    if [ "$file" != "docs/memories/_TEMPLATE.md" ]; then
        echo "File: $(basename $file)"
        grep "Status:" "$file"
        grep "Use Count:" "$file"
        echo ""
    fi
done
```

**`scripts/create-memory.sh`**:
```bash
#!/bin/bash
NAME=$1
FILENAME=$(echo "$NAME" | tr '[:upper:]' '[:lower:]' | tr ' ' '-')
DATE=$(date +%Y-%m-%d)

cp docs/memories/_TEMPLATE.md "docs/memories/${FILENAME}.md"
sed -i "s/\[Pattern Name\]/$NAME/g" "docs/memories/${FILENAME}.md"
sed -i "s/YYYY-MM-DD/$DATE/g" "docs/memories/${FILENAME}.md"

echo "✓ Created: docs/memories/${FILENAME}.md"
```

**Use**:
```bash
./scripts/create-memory.sh "API Retry Pattern"
```

---

## Best Practices

### DO ✅

- **Start sessions with context**: Paste WORKSPACE_RULES.md
- **Create memories for reusable patterns**
- **Update use_count manually** after each use
- **Promote at 2 uses**: Trust the threshold
- **Review monthly**: Archive unused patterns

### DON'T ❌

- **Don't rely on AI memory**: It forgets between sessions
- **Don't skip file creation**: Must persist manually
- **Don't forget to update**: Memories get stale
- **Don't create for one-offs**: Only reusable patterns
- **Don't delete prematurely**: Archive instead

---

## Troubleshooting

### Issue: AI Doesn't Remember

**Solution**: AI assistants without native memory don't persist knowledge

**Workaround**:
- Paste relevant docs each session
- Reference memory files explicitly
- Build context at start of session

---

### Issue: Too Manual

**Solution**: Consider migrating to:
- **Windsurf**: Native memory system
- **Cursor**: `.cursorrules` support
- Both offer better SCMS integration

---

### Issue: Lost Track of Memories

**Solution**: Update dashboard weekly

**Or**: Run list script:
```bash
./scripts/list-memories.sh
```

---

## Migration Path

### To Windsurf

**Advantages**:
- Native memory system
- Automatic retrieval
- Workspace scoping
- Zero file management

**Migration**:
1. Install Windsurf
2. Convert file-based memories to Windsurf memories
3. Copy content, set tags
4. See `config/windsurf/SETUP.md`

---

### To Cursor

**Advantages**:
- `.cursorrules` support
- File-based (already compatible!)
- @ mentions for docs
- Better than generic AI

**Migration**:
1. Install Cursor
2. Copy `.cursorrules` file (already done!)
3. Memories already in docs/memories/
4. See `config/cursor/SETUP.md`

---

## Quick Reference

### Start Session
```
Project: [name], Stack: [tech]
SCMS docs: docs/WORKSPACE_RULES.md
Task: [your task]
```

### Create Memory
```bash
cp docs/memories/_TEMPLATE.md docs/memories/pattern-name.md
# Edit file
```

### Promote to L1
```
Copy to WORKSPACE_RULES.md
Update memory: Status = PROMOTED
```

### Create SOP
```
Copy docs/templates/SOP_TEMPLATE.md to docs/sops/PATTERN_SOP.md
Fill sections
```

---

## Support

**Documentation**:
- System: `docs/00_DOCUMENTATION_HIERARCHY.md`
- Workflows: `workflows/`
- Templates: `docs/templates/`

---

**Generic AI + SCMS = Manual but functional continual learning!**

**Recommendation**: Migrate to Windsurf or Cursor for better experience.

**Status**: ✅ Setup complete - Start documenting manually!
