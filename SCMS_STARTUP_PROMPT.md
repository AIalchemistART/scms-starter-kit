# SCMS Auto-Memory Startup Prompt

**Purpose**: Copy-paste this prompt at the start of each development session to ensure TRUE SCMS workflow.

---

## 🚀 For Auto-Memory L0 (Windsurf)

**Copy this entire prompt and send to Cascade AI:**

```
IMPORTANT: This project uses SCMS v1.3 (Sparse Contextual Memory Scaffolding) with AUTO-MEMORY L0 strategy.

**SCMS ARCHITECTURE - Dual Validation Pipeline:**
- **L0 (Destructive Validation)**: Test patterns via Cascade auto-memories (probabilistic retrieval + temporal decay)
- **L1 (Stable Validation)**: Enforce patterns via WORKSPACE_RULES.md (deterministic loading - you MUST check)
- **L2-L4**: Reference documentation (passive, on-demand)

CRITICAL WORKFLOW RULES:

1. CREATE MEMORIES DURING DEVELOPMENT (not after):
   - When you discover a reusable pattern, IMMEDIATELY create a Cascade memory
   - Do NOT wait until implementation is complete
   - Use the memory creation tool as soon as pattern is recognized

2. DO NOT CREATE MARKDOWN DOCUMENTATION FILES:
   - NO docs/memories/*.md files (folder doesn't exist!)
   - NO SCMS_REPORT.md, INTEGRATION_REPORT.md, TEST_LOG.md
   - NO manual pattern tracking files
   - ONLY update: MEMORY_STATUS_DASHBOARD.md (for retrieval counts only)

3. MEMORY CREATION FORMAT:
   Title: "[Pattern Name] - [One-line description]"
   Content: Brief code example + context
   Tags: relevant keywords
   Status: Mark as "CANDIDATE" with use_count: 1

4. WHEN PATTERN RECURS:
   - Retrieve the memory automatically (you should do this)
   - Tell me: "Retrieved [pattern name] memory"
   - I will update dashboard with retrieval count

5. PROMOTION RULE:
   - After 2nd retrieval, copy pattern to WORKSPACE_RULES.md
   - Pattern becomes L1 (validated)

WHAT SUCCESS LOOKS LIKE:
- ✅ Memories created in Cascade panel during coding
- ✅ Zero markdown files in docs/memories/
- ✅ Dashboard shows retrieval counts only
- ✅ Patterns promoted to WORKSPACE_RULES.md at 2+ uses

INCORRECT BEHAVIOR TO AVOID:
- ❌ Implementing all code first, then documenting
- ❌ Creating comprehensive markdown reports
- ❌ Manual tracking spreadsheets
- ❌ Retroactive memory creation

This is TRUE SCMS - automatic, temporal, use-validated. Let's build!
```

---

## 📋 For Manual L0 (Cursor/Generic)

**Copy this prompt for manual markdown workflow:**

```
IMPORTANT: This project uses SCMS v1.3 (Sparse Contextual Memory Scaffolding) with MANUAL MARKDOWN L0 strategy.

**SCMS ARCHITECTURE - Dual Validation Pipeline:**
- **L0 (Destructive Validation)**: Test patterns via docs/memories/*.md files (manual tracking, no temporal decay)
- **L1 (Stable Validation)**: Enforce patterns via WORKSPACE_RULES.md (you MUST check before generating code)
- **L2-L4**: Reference documentation (passive, on-demand)

WORKFLOW RULES:

1. CREATE MEMORY FILES WHEN PATTERN DISCOVERED:
   - Create docs/memories/[pattern-name].md immediately
   - Use template from docs/templates/MEMORY_TEMPLATE.md
   - Mark as CANDIDATE with use_count: 1

2. TRACK REUSE:
   - When pattern used again, update use_count in file
   - Update last_used date

3. PROMOTION:
   - At use_count ≥ 2, copy to WORKSPACE_RULES.md
   - Mark as PROMOTED in memory file

4. UPDATE DASHBOARD:
   - Track patterns in MEMORY_STATUS_DASHBOARD.md
   - Show current counts and promotion status

Let's build with SCMS tracking!
```

---

## 🎯 Quick Reference

**Auto-Memory**: Copy prompt above at session start  
**Manual**: Use manual prompt above

**Both strategies**: Refer to this file anytime to refresh AI instructions

---

## 💡 Pro Tips

1. **Save as snippet** - Create IDE snippet for quick access
2. **Morning ritual** - Paste at start of each day
3. **After breaks** - Re-send if AI forgets workflow
4. **New chat** - Always send when starting fresh conversation

---

## 📖 See Also

- Full guide: `L0_AUTO_MEMORY_GUIDE.md`
- Strategy comparison: `L0_STRATEGY_COMPARISON.md`
- Setup instructions: `config/windsurf/SETUP.md`
