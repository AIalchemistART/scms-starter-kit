# Windsurf + SCMS Setup Guide

**Windsurf Cascade** has native memory support, making SCMS integration seamless and powerful.

---

## ⚡ IMPORTANT: Choose Your L0 Strategy

Windsurf supports **TWO L0 strategies**. The setup script asked you to choose. Here's what each means:

### Strategy 1: Auto-Memory L0 (RECOMMENDED ✅)

**This is TRUE SCMS as researched.**

```
Windsurf Auto-Generated Memories (L0)
  ↓ retrieved [threshold] times
WORKSPACE_RULES.md (L1)
  ↓ used 5+ times
SOPs (L2)
```

**How it works**:
- AI creates memories automatically during development
- No manual documentation needed
- Temporal decay (unused patterns fade after 30 days)
- Validation through retrieval (AI uses memory = validation)
- **Zero overhead** - happens naturally
- **Your threshold**: Configured during setup (n≥2, 3, or 5 based on project phase)

**Best for**:
- Solo developers
- Rapid iteration
- Minimal documentation overhead
- True continual learning

**Setup**:
- Enable Cascade memories (this guide)
- Let AI create memories naturally
- Track retrievals in MEMORY_STATUS_DASHBOARD.md
- Promote to WORKSPACE_RULES.md when threshold reached
- **Check your configured threshold in MEMORY_STATUS_DASHBOARD.md**

**DO NOT** create markdown files in `docs/memories/` (folder doesn't exist)

---

### Strategy 2: Manual Markdown L0

**SCMS-inspired but less automated.**

```
Markdown Files in docs/memories/ (L0)
  ↓ manual promotion
WORKSPACE_RULES.md (L1)
  ↓ used 5+ times
SOPs (L2)
```

**How it works**:
- Create markdown files manually
- Track use_count yourself
- Manual promotion to L1
- No temporal decay

**Best for**:
- Teams needing shared documentation
- Compliance/audit requirements
- Cross-platform compatibility
- Stable, permanent references

**Setup**:
- Create files in `docs/memories/` using template
- Track use manually
- Promote explicitly

---

## Why Windsurf Is Ideal for SCMS

- ✅ **Native memory system** - Built-in support for persistent memories
- ✅ **Automatic retrieval** - Semantic search brings relevant memories to context
- ✅ **Workspace scoping** - Separate global and project-specific memories
- ✅ **No file management** - Memories stored in Windsurf's system, not files
- ✅ **Cascade AI** - Powerful code generation with memory awareness
- ✅ **Supports both L0 strategies** - Choose based on your needs

**Result**: Best SCMS experience with minimal setup.

---

## Prerequisites

- ✅ Windsurf Cascade installed (latest version)
- ✅ SCMS Starter Kit in your project (you're here!)
- ✅ Basic familiarity with Windsurf

---

## Setup Steps

### Step 1: Enable Memories

**Location**: Windsurf Settings → Cascade

1. Open Windsurf Settings
2. Navigate to **Cascade** section
3. Enable **Memories** ✓
4. Set memory scope:
   - **Workspace**: Project-specific patterns
   - **Global**: Universal coding rules

**Verification**: You should see "Memories" panel in Cascade sidebar

---

### Step 2: Create Global Memories

These memories apply across ALL your projects.

#### Memory 1: Global Coding Rules

**Create Memory**:
1. Open Cascade Memories panel
2. Click **"Create Memory"**
3. **Title**: `Global Coding Rules - SCMS`
4. **Content**: Copy from `rules/GLOBAL_CODING_RULES.md`
5. **Tags**: `global`, `scms`, `rules`, `universal`
6. **Scope**: Global

**Why**: Universal best practices (DRY, testing, etc.) available everywhere.

---

#### Memory 2: SCMS Documentation Hierarchy

**Create Memory**:
1. **Title**: `SCMS Documentation System`
2. **Content**:
```markdown
SCMS 5-Layer Hierarchy:

L0: Active Memories (Windsurf native memories) - Dynamic validation candidates
L1: WORKSPACE_RULES.md - Validated patterns (use_count ≥2)
L2: docs/sops/ - Detailed procedures (use_count ≥5)
L3: docs/case-studies/ - Complete examples
L4: docs/sessions/ - Historical records

Promotion triggers:
- L0 → L1: Pattern used 2nd time successfully
- L1 → L2: Pattern used 5th time, needs detailed procedure
- L2 → L3: Feature demonstrates multiple patterns

After every implementation:
1. Create/update L0 memory (mark CANDIDATE)
2. If 2nd use: Add to WORKSPACE_RULES.md (L1)
3. If 5th use: Suggest creating SOP (L2)

Status markers:
⏳ CANDIDATE - Implemented, awaiting validation
✅ VALIDATED - Proven through testing
🚀 PROMOTED - Moved to L1 WORKSPACE_RULES
```
3. **Tags**: `scms`, `documentation`, `workflow`, `system`
4. **Scope**: Global

---

#### Memory 3: Recursive Documentation Strategy (Optional)

**Create Memory** (if enabling recursive docs):
1. **Title**: `SCMS Recursive Documentation Enabled`
2. **Content**:
```markdown
RECURSIVE DOCUMENTATION ACTIVE

After every implementation:
1. Automatically create/update L0 memory
2. Mark as CANDIDATE until user validates
3. If pattern 2nd use: Auto-add to WORKSPACE_RULES.md
4. If pattern 5th use: Suggest creating SOP

Do NOT wait for approval to document.

Report format:
✅ Implementation Complete
📝 L0: Created "[Pattern]" (CANDIDATE, use_count: X)
[If 2nd use] ⚡ L1: Added to WORKSPACE_RULES.md
[If 5th use] 📚 L2: Suggest creating SOP?

User will test and report success/issues.
```
3. **Tags**: `scms`, `recursive`, `workflow`, `automation`
4. **Scope**: Global or Workspace (your choice)

**Note**: Only enable after 2-3 months of conservative approach. See `workflows/RECURSIVE_DOCUMENTATION.md`.

---

### Step 3: Create Project-Specific Memory

#### Memory: Project Context

**Create Memory**:
1. **Title**: `[Your Project Name] - SCMS Context`
2. **Content**:
```markdown
Project: [Your Project Name]
Type: [Web App / API / Game / etc.]
Tech Stack: [Languages, frameworks]

SCMS Status:
- Started: [Date]
- Documentation: docs/WORKSPACE_RULES.md
- Active memories: L0 (Windsurf native)
- Validated patterns: L1 (WORKSPACE_RULES.md)
- SOPs: docs/sops/
- Case studies: docs/case-studies/

Documentation approach: Conservative | Recursive
(Conservative: Document after validation)
(Recursive: Document immediately, validate through testing)

Custom rules in: docs/WORKSPACE_RULES.md
Global rules: See "Global Coding Rules - SCMS" memory
```
3. **Tags**: `project`, `scms`, `context`
4. **Scope**: Workspace

**Customize**: Fill in your actual project details

---

### Step 4: Configure Memory Retrieval

Windsurf automatically retrieves memories based on semantic similarity. To optimize:

#### Tagging Strategy

**Tag Categories**:
- **Technology**: `javascript`, `python`, `react`, `django`, etc.
- **Category**: `api`, `testing`, `performance`, `security`, etc.
- **Type**: `pattern`, `pitfall`, `optimization`, `workaround`
- **SCMS**: `scms`, `L0`, `L1`, `global`, `project`

**Example Good Tags**:
```
javascript, react, hooks, pattern, scms
python, api, error-handling, pattern, scms
testing, jest, integration, pitfall, scms
```

**Example Bad Tags**:
```
stuff, things, code  (too vague)
very-specific-unique-identifier-12345  (won't retrieve)
```

---

#### Title Strategy

**Good Titles** (descriptive, searchable):
- "React useEffect Cleanup Pattern"
- "API Error Handling with Retry Logic"
- "Database Connection Pooling Setup"
- "Multi-Key QTE Implementation Pattern"

**Bad Titles** (vague, not searchable):
- "Pattern 1"
- "The thing we did"
- "Fix for issue"

---

### Step 5: Test Memory System

**Quick Test** (5 minutes):

1. **Create test memory**:
   - Title: "Date Formatting Utility"
   - Content: 
   ```javascript
   function formatDate(date) {
     return date.toISOString().split('T')[0];
   }
   ```
   - Tags: `javascript`, `utility`, `date`, `test`

2. **Ask Cascade**: "How do I format a date?"

3. **Verify**: Cascade should reference your memory

4. **Success?** ✅ Memory system working!

5. **Cleanup**: Delete test memory

---

## Daily Workflow

### With Conservative Documentation (Default)

```
1. You: "Implement feature X"
2. Cascade: [implements]
3. You: [test in real environment]
4. You: "Works great! Document this pattern"
5. Cascade: [creates L0 memory, updates WORKSPACE_RULES if 2nd use]
```

---

### With Recursive Documentation (Optional, after 2-3 months)

```
1. You: "Implement feature X"
2. Cascade: [implements + auto-creates L0 memory]
3. Cascade: "📝 Created memory 'Pattern X' (CANDIDATE)"
4. You: [test in real environment]
5. You: "Works!" → Cascade marks as VALIDATED
   OR "Issue: [desc]" → Cascade iterates and updates memory
```

**Enable**: Create "Recursive Documentation Enabled" memory (Step 2, Memory 3)

---

## Managing Memories

### View All Memories

1. Open Cascade sidebar
2. Click **Memories** tab
3. See all workspace + global memories

### Edit Memory

1. Find memory in list
2. Click to open
3. Edit content
4. Save changes

### Delete Memory

1. Find memory in list
2. Click delete/remove
3. Confirm

**When to Delete**:
- Test memories
- Deprecated patterns (mark as DEPRECATED first)
- Superseded by better approach

**When NOT to Delete**:
- After promotion to L1 (keep for tracking)
- Validated patterns (might use again)
- Historical context

---

### Archive vs. Delete

**Archive** (Recommended):
- Mark status as 🗄️ ARCHIVED in content
- Add `archived` tag
- Keep in system for reference

**Delete** (Rare):
- Only for truly incorrect/useless memories
- Test memories
- Duplicates

---

## Memory Organization

### Suggested Memory Structure

**Global Memories**:
```
- Global Coding Rules - SCMS
- SCMS Documentation System
- [Language] Best Practices (e.g., JavaScript Best Practices)
- [Framework] Patterns (e.g., React Common Patterns)
```

**Workspace Memories**:
```
- [Project Name] - SCMS Context
- [Feature Area] Patterns (e.g., API Patterns, Testing Patterns)
- [Specific Patterns] (created as you develop)
```

---

## Promotion Workflow

### L0 → L1 (Memory → WORKSPACE_RULES)

**Trigger**: Pattern used 2nd time successfully

**Windsurf Action** (with recursive docs):
1. Detects 2nd use
2. Asks: "Pattern used twice. Add to WORKSPACE_RULES?"
3. You approve
4. Cascade adds to WORKSPACE_RULES.md
5. Updates memory: status = 🚀 PROMOTED

**Manual** (without recursive docs):
1. You notice pattern used twice
2. You: "Add [pattern] to WORKSPACE_RULES"
3. Cascade extracts from memory to WORKSPACE_RULES.md

---

### L1 → L2 (WORKSPACE_RULES → SOP)

**Trigger**: Pattern used 5th time, needs detailed procedure

**Windsurf Action**:
1. Detects 5th use
2. Suggests: "Pattern used 5+ times. Create SOP?"
3. You approve
4. Cascade creates `docs/sops/[PATTERN]_SOP.md` from template
5. Fills in content from memory + WORKSPACE_RULES

---

## Troubleshooting

### Issue: Memories Not Retrieved

**Possible Causes**:
- Tags too specific
- Title not descriptive
- Semantic match weak

**Solutions**:
1. **Add more general tags**: `pattern`, `scms`, technology name
2. **Improve title**: Make it searchable
3. **Add keywords**: In memory content, use terms Cascade might search for

---

### Issue: Too Many Memories Retrieved

**Cause**: Tags too broad or many similar patterns

**Solutions**:
1. **Use more specific tags**: Add technology, category
2. **Improve titles**: Make distinctions clear
3. **Archive old memories**: Mark unused patterns

---

### Issue: Duplicate Memories

**Cause**: Creating memory for same pattern twice

**Solutions**:
1. **Search before creating**: Check if memory exists
2. **Update existing**: Instead of creating new
3. **Merge duplicates**: Combine into single memory, delete duplicate

---

## Advanced Features

### Memory Templates in Windsurf

**Create template memory**:
1. Title: "SCMS Memory Template"
2. Content: Copy from `docs/templates/MEMORY_TEMPLATE.md`
3. Tag: `template`, `scms`

**Use**: Copy content when creating new memories for consistency

---

### Workspace vs Global Scope

**Global** (Cascade → Memories → Global):
- Universal rules
- Language/framework patterns
- SCMS system itself
- Available in ALL projects

**Workspace** (Cascade → Memories → Workspace):
- Project-specific patterns
- Custom architectural decisions
- Feature-specific implementations
- Only available in this project

**Recommendation**: Start global, move to workspace if project-specific

---

## Best Practices

### DO ✅

- **Use descriptive titles**: Makes retrieval better
- **Tag consistently**: Same tags for similar patterns
- **Update memories**: As patterns evolve
- **Promote when ready**: Trust use_count ≥2 threshold
- **Keep memories focused**: One pattern per memory

### DON'T ❌

- **Don't create duplicates**: Search first
- **Don't use vague tags**: Be specific
- **Don't delete prematurely**: Archive instead
- **Don't skip validation**: Test before marking VALIDATED
- **Don't over-create**: Only for reusable patterns

---

## Migration Path

### Transitioning to Recursive Documentation

**After 2-3 months of conservative approach**:

1. **Verify readiness**:
   - Core patterns documented
   - Team comfortable with SCMS
   - Strong testing culture
   - >80% documentation coverage

2. **Enable recursive mode**:
   - Create "Recursive Documentation Enabled" memory
   - Test on small feature
   - Evaluate after 15 implementations

3. **Monitor metrics**:
   - Documentation lag: Target <2 hours
   - Accuracy: Target >95%
   - Time saved: ~5-7 min per implementation

4. **Adjust if needed**:
   - Raise thresholds (use_count 3 for L1)
   - Disable if accuracy <90%
   - See `workflows/RECURSIVE_DOCUMENTATION.md`

---

## Quick Reference

### Create Memory
```
Cascade → Memories → Create
Title: [Descriptive name]
Content: [Pattern + code]
Tags: [tech, category, type, scms]
Scope: Global | Workspace
```

### Promote to L1
```
You: "Add [pattern] to WORKSPACE_RULES"
Cascade: [extracts to WORKSPACE_RULES.md]
```

### Create SOP (L2)
```
You: "Create SOP for [pattern]"
Cascade: [creates docs/sops/[PATTERN]_SOP.md]
```

---

## Support

**Documentation**:
- System overview: `docs/00_DOCUMENTATION_HIERARCHY.md`
- Workflows: `workflows/`
- Templates: `docs/templates/`

**Windsurf Help**:
- Settings → Help
- Cascade Documentation
- Windsurf Community

---

**Windsurf + SCMS = The most seamless continual learning experience for AI-assisted development!** 🚀

**Status**: ✅ Setup complete - Start developing and watch SCMS build automatically!
