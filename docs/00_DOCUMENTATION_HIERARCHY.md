# SCMS Documentation Hierarchy

**Purpose**: Understand how the dual validation pipeline + reference layers work and when to use each.

**Version**: v1.3 (Updated October 2025)

---

## Overview

SCMS implements **dual validation infrastructure** where patterns are automatically tested (L0) and enforced (L1) through repeated use:

- **L0 (Destructive Validation)**: Tests patterns via probabilistic retrieval + temporal decay
- **L1 (Stable Validation)**: Enforces validated patterns via deterministic loading (AI MUST check)
- **L2-L4 (Reference Documentation)**: Traditional passive docs for deeper detail

**The Core Insight**: Transform memory from passive storage into **active quality control infrastructure** with complementary validation systems.

---

## The Dual Validation Pipeline + Reference Layers

```
┌─────────────────────────────────────────┐
│ VALIDATION PIPELINE (Active)            │
├─────────────────────────────────────────┤
│ L0: Destructive Validation              │
│  → Tests via probabilistic retrieval    │
│  → Temporal decay removes unvalidated   │
│  → Natural selection for patterns       │
│  → Status: Dynamic (18-30 memories)      │
├─────────────────────────────────────────┤
│ L1: Stable Validation                   │
│  → Enforces via deterministic loading   │
│  → AI MUST check before acting          │
│  → Quality gates for proven patterns    │
│  → Status: Stable (grows slowly)         │
└─────────────────────────────────────────┘
         ↓ (references)
┌─────────────────────────────────────────┐
│ REFERENCE DOCUMENTATION (Passive)       │
├─────────────────────────────────────────┤
│ L2: Standard Operating Procedures       │
│ L3: Case Studies & Architecture         │
│ L4: Global Rules (universal)            │
└─────────────────────────────────────────┘
```

---

## Layer 0: Destructive Validation

**Purpose**: Test patterns through natural selection (probabilistic retrieval + temporal decay)

**Status**: Dynamic (18-30 memories, self-cleaning)

**Function**: **Active validation system** - patterns prove value through repeated use or fade naturally

**Key Characteristics**:
- Probabilistic retrieval (may or may not activate)
- Temporal decay (unused patterns removed after 30 days)
- Natural selection (only patterns that help survive)
- Automatic quality control

**Implementation**: **Platform-specific** - see below

---

### Platform-Specific L0 Implementation

L0 works differently depending on your IDE/AI assistant:

#### Windsurf: Auto-Memory (TRUE SCMS) ✅ RECOMMENDED

**Location**: Windsurf Cascade native memories

**How it works**:
- AI creates memories automatically during development
- Retrieval = validation (AI pulls memory when solving problem)
- Temporal decay (unused patterns fade after 30 days)
- No manual file management needed

**Lifecycle**:
```
AI discovers pattern → Creates memory automatically
  ↓
AI retrieves memory to solve similar problem (validation!)
  ↓
Retrieved 2+ times → Promote to WORKSPACE_RULES.md (L1)
```

**Advantages**:
- Zero overhead (automatic)
- Natural sparse creation
- Self-cleaning (temporal decay)
- Validates through actual use

**This is SCMS as researched in the whitepaper.**

---

#### Cursor / Generic: Manual Markdown

**Location**: `docs/memories/*.md` files

**How it works**:
- Manually create markdown files using template
- Track `use_count` yourself
- Explicitly promote to L1 at threshold
- No temporal decay (stable)

**Lifecycle**:
```
Discover pattern → Create docs/memories/[pattern].md
  ↓
Use pattern again → Increment use_count manually
  ↓
use_count ≥ 2 → Copy to WORKSPACE_RULES.md (L1)
```

**Advantages**:
- Works without native memory support
- Stable (no decay)
- Team-shareable
- Version controlled

**Trade-off**: More manual overhead, less automated

---

### Choosing Your L0 Strategy

**If using Windsurf**:
- **Recommended**: Auto-memory (true SCMS)
- **Alternative**: Manual markdown (for teams/compliance)
- Setup script asks which you prefer

**If using Cursor/Generic**:
- **Only option**: Manual markdown
- Native memory support not available

### When Created

**Automatically** (with recursive documentation):
- After every implementation of novel pattern
- When edge case discovered
- When optimization found

**Manually** (conservative approach):
- When asked: "Document this pattern for reuse"
- When you recognize reusable pattern

### Memory Schema

```markdown
## Memory: [Pattern Name]

**Status**: ⏳ CANDIDATE | ✅ VALIDATED | 🚀 PROMOTED
**Use Count**: X
**First Used**: YYYY-MM-DD
**Last Used**: YYYY-MM-DD
**Tags**: [tag1, tag2, tag3]

**Pattern Description**:
[What was implemented, core mechanism]

**Code Example**:
```language
// Relevant code
```

**Expected Behavior**:
[What should happen if pattern works]

**Validation Criteria**:
- [ ] User testing confirms functionality
- [ ] No edge cases discovered
- [ ] Performance acceptable

**Related Patterns**: [Links]
```

### Lifecycle

```
Created (use_count = 1) → CANDIDATE
    ↓ (tested successfully)
Validated (use_count = 1) → VALIDATED
    ↓ (used 2nd time)
Promoted (use_count ≥ 2) → PROMOTED to L1
```

---

## Layer 1: Stable Validation (WORKSPACE_RULES.md)

**Purpose**: **Enforce validated patterns** as quality gates that AI MUST check before acting

**Status**: Stable (updated only when patterns validated in L0, grows slowly)

**Function**: **Active enforcement system** - deterministic loading guarantees AI checks these patterns

**Key Characteristics**:
- Deterministic loading (AI MUST check this file every session)
- Quality gates (validated patterns become mandatory checks)
- Dual role: Pattern repository + index to L2-L4
- Promotion threshold: use_count ≥ 2 in L0

**Why This Matters**: L1 is NOT just "better docs"—it's an **enforcement layer** that transforms suggestions into requirements.

**Contains**: Code snippets, common pitfalls, quick patterns

**Location**: `docs/WORKSPACE_RULES.md` (single file for speed)

### When Updated

**Automatic Promotion** (with recursive docs):
- Pattern used 2nd time → auto-add to WORKSPACE_RULES

**Manual Promotion** (conservative):
- After pattern validated in testing
- When explicitly asked: "Add to WORKSPACE_RULES"

### Entry Format

```markdown
### [Pattern Name] (Validated Pattern - Use Count: X)

**When to Use**: [Brief description]

**Pattern**:
```language
// Code example from implementations
```

**Known Edge Cases**:
- [Issues discovered during validation]

**Common Pitfalls**:
- [What can go wrong]

**Related**: See [SOP link] for details
```

### Organization

Group by category:
- Core architecture patterns
- Framework-specific patterns
- Testing patterns
- Common pitfalls
- Performance optimizations

---

## Layer 2: Standard Operating Procedures (SOPs)

**Purpose**: Detailed step-by-step procedures for complex patterns

**Status**: Stable (created when pattern used ≥5 times)

**Contains**: Complete implementation guides, testing checklists, examples

**Location**: `docs/sops/[PATTERN_NAME]_SOP.md`

### When Created

**Suggested** (with recursive docs):
- Pattern reaches use_count ≥ 5
- AI suggests: "Create SOP for this pattern?"

**Manual**:
- When pattern needs detailed documentation
- When onboarding new team members
- When pattern has multiple steps

### SOP Structure

```markdown
# [Pattern Name] - Standard Operating Procedure

**Status**: ✅ Validated (Use Count: X)
**Complexity**: [Low|Medium|High]
**Time**: XX-XX minutes

## Overview
[What this does, when to use]

## Prerequisites
[What you need before starting]

## Implementation Steps

### Step 1: [Name]
[Detailed instructions]
```code
```

### Step 2: [Name]
[Continue...]

## Common Pitfalls
[Problems and solutions]

## Testing Checklist
- [ ] Test scenario 1
- [ ] Test scenario 2

## Performance Considerations
[Optimization notes]

## Related Patterns
[Links to L0, L1, other L2]
```

---

## Layer 3: Case Studies

**Purpose**: Complete examples demonstrating multiple patterns

**Status**: Stable (created for milestones/complex features)

**Contains**: Full implementation narrative, metrics, lessons learned

**Location**: `docs/case-studies/[FEATURE_NAME]_CASE_STUDY.md`

### When Created

**Suggested**:
- Feature demonstrates multiple L2 SOPs
- Significant implementation milestone
- Novel insights worth documenting

**Manual**:
- Sprint retrospectives
- Complex feature completions
- When pattern shows unexpected benefits

### Case Study Structure

```markdown
# [Feature Name] - Case Study

**Date**: YYYY-MM-DD
**Complexity**: [Low|Medium|High]

## Overview
[What was built, why significant]

## Patterns Applied
- L2 SOP: [Link]
- L2 SOP: [Link]
- L1 Pattern: [Link]

## Implementation Journey
[Chronological narrative]

## Challenges & Solutions
[Problems encountered, how solved]

## Metrics
- Time saved: X%
- Code quality: [Measure]
- Performance: [Measure]

## Lessons Learned
[Key insights for future]

## Code Examples
[Complete working examples]
```

---

## Layer 4: Historical Records

**Purpose**: Session/sprint summaries for long-term context

**Status**: Archive (created periodically)

**Contains**: What was done, decisions made, next steps

**Location**: `docs/sessions/SESSION_YYYY-MM-DD.md`

### When Created

**End of session**:
- What was accomplished
- Patterns discovered
- Issues encountered

**End of sprint**:
- Sprint goals achieved
- Metrics and velocity
- Retrospective insights

### Format

```markdown
# Session Summary - YYYY-MM-DD

## Objectives
[What we planned to accomplish]

## Completed
- [Feature 1]
- [Feature 2]

## Patterns Discovered
- [L0 memory created]
- [L1 pattern promoted]

## Issues Encountered
- [Problem and solution]

## Metrics
- Time spent: X hours
- Features completed: X
- Patterns documented: X

## Next Session
- [ ] Task 1
- [ ] Task 2
```

---

## Information Flow

### Scenario: Implementing New Feature

**Step 1: AI Consults Documentation**
```
AI reads (in priority order):
1. L0 Memories (auto-retrieved, most specific)
2. L1 WORKSPACE_RULES (quick reference)
3. L2 SOPs (if detailed procedure needed)
4. L3 Case Studies (if similar feature exists)
```

**Step 2: Implementation**
```
AI implements using retrieved patterns
```

**Step 3: Documentation** (Automatic with recursive docs)
```
AI creates/updates L0 memory (CANDIDATE)
Marks: use_count++, last_used = today
```

**Step 4: Testing**
```
Developer tests in real environment
Reports: "Works!" or "Issue: [description]"
```

**Step 5: Validation**
```
If success: Mark memory as VALIDATED
If failure: Iterate (update memory with revised approach)
```

**Step 6: Promotion** (Automatic on 2nd use)
```
If use_count ≥ 2:
  Add to L1 WORKSPACE_RULES
  Mark memory as PROMOTED
  
If use_count ≥ 5:
  Suggest creating L2 SOP
```

---

## Retrieval Priority

When AI solves a problem, it consults layers in this order:

**1. L0 Memories** (Most Relevant)
- Auto-retrieved based on semantic similarity
- Most specific to current task
- Contains latest discoveries not yet in docs

**2. L1 WORKSPACE_RULES** (Quick Patterns)
- Fast lookup for validated patterns
- Code snippets readily available
- Common pitfalls already documented

**3. L2 SOPs** (Detailed Procedures)
- When implementation needs step-by-step guide
- Complex patterns requiring multiple stages
- Referenced from L1 for details

**4. L3 Case Studies** (Complete Examples)
- When similar feature implemented before
- Learn from complete implementation
- See how multiple patterns work together

**5. L4 Historical** (Background Context)
- Understand past decisions
- See evolution of patterns
- Rarely needed for day-to-day work

---

## Promotion Decision Tree

```
New pattern discovered
    ↓
Create L0 memory (CANDIDATE)
    ↓
Test and validate
    ↓
    ├─ Success → Mark VALIDATED
    └─ Failure → Iterate (update memory)
    ↓
Pattern used 2nd time?
    ├─ YES → Promote to L1 (add to WORKSPACE_RULES)
    └─ NO → Keep in L0, increment use_count
    ↓
Pattern used 5th time?
    ├─ YES → Suggest creating L2 SOP
    └─ NO → Continue in L1
    ↓
Feature complete with multiple patterns?
    ├─ YES → Consider L3 Case Study
    └─ NO → Continue normal workflow
```

---

## Maintenance Schedule

### Daily (Automatic with Recursive Docs)
- L0 memories created/updated after implementations
- Use counts incremented
- Automatic promotion to L1 when thresholds met

### Weekly (Manual Review)
- Check MEMORY_STATUS_DASHBOARD.md
- Review patterns ready for promotion
- Identify stale candidates (use_count = 1, 14+ days)

### Monthly (Cleanup)
- Archive unused L0 candidates (30+ days, use_count < 2)
- Review L1 patterns still relevant
- Update SOPs with lessons learned
- Create case studies for completed features

---

## Benefits of This System

### 1. Zero Documentation Debt

**Traditional**:
```
Debt = Σ(Discovery - Documentation) → Grows unbounded
```

**SCMS**:
```
Debt ≤ Promotion_Lag × Discovery_Rate → Bounded
```

With 4-day promotion lag and 0.5 patterns/week:
```
Debt ≈ 0.28 patterns (essentially zero)
```

### 2. Validated Knowledge Only

Only patterns **proven through repeated use** reach permanent docs.

No guessing. No documenting unused patterns. No clutter.

### 3. Automatic Promotion

System promotes patterns when thresholds met—no manual tracking needed.

### 4. Context-Aware Retrieval

AI automatically retrieves most relevant L0 memories for current task.

### 5. Hierarchical Efficiency

- L0: Thousands of candidates (dynamic)
- L1: Dozens of validated patterns (quick lookup)
- L2: Handful of complex procedures (detailed)
- L3: Few complete examples (learning)
- L4: Historical archive (rarely accessed)

Each layer contains only what it should, optimizing retrieval speed.

---

## When SCMS Delivers Maximum Value

**v1.3 Research Finding**: SCMS benefit varies by project characteristics and context freshness.

### Highest Impact (85-96% time reduction)

**Scenarios where SCMS excels:**
- **Stale context recovery**: Returning to project after weeks/months
- **Long-horizon projects**: Multi-month development with accumulated patterns
- **Complex evolving systems**: Numerous edge cases, architectural patterns
- **Collaborative work**: Multiple developers sharing context

**Why**: Dual validation pipeline (L0+L1) prevents catastrophic forgetting when context has decayed. The 96% time reduction in stale-context scenarios validates this.

### Moderate Impact (60-80% time reduction)

**Scenarios where SCMS helps significantly:**
- Ongoing development with pattern reuse
- Projects with regular session gaps
- Knowledge-intensive work requiring continuity

**Why**: Continuous validation maintains knowledge and prevents re-discovery.

### Lower Impact (30-50% time reduction)

**Scenarios where SCMS still beneficial but less critical:**
- Greenfield projects (fresh context)
- Short-term tasks (<1 month)
- Well-documented domains

**Why**: Fresh context reduces forgetting impact; benefits present but magnitude lower.

### Practical Necessity vs Optional

**Research-backed guidance**: For projects >1 month with iterative pattern discovery under realistic constraints (growing knowledge, fixed resources, temporal decay), SCMS transitions from "optimization" to "structural necessity."

**Impossibility result**: Dense alternatives (trying to remember everything) provably fail at scale due to O(K²) interference growth. Sparse validation is the only viable architecture for continual learning.

---

## Common Questions

### When do I create an L0 memory?

**With recursive docs (automatic)**: After every implementation of novel pattern.

**Without recursive docs (manual)**: When you recognize a reusable pattern worth documenting.

**Rule of thumb**: If you think "I might need this again," document it.

### How do I know when to promote to L1?

**Automatic**: System promotes when use_count ≥ 2.

**Manual**: When pattern validated and used 2+ times.

### When should I create an L2 SOP?

**Automatic**: System suggests when use_count ≥ 5.

**Manual**: When pattern is complex enough to need step-by-step guide.

### Do I need all 5 layers?

**Minimum**: L0 (memories) + L1 (WORKSPACE_RULES)

**Recommended**: Add L2 (SOPs) after 2-3 months

**Optional**: L3 (case studies), L4 (session records)

Start minimal, expand as needed.

---

## Next Steps

1. **Read**: [SETUP.md](../SETUP.md) - Installation guide
2. **Review**: [Examples](examples/) - Real patterns from Labyrinth Protocol
3. **Configure**: [Workflows](../workflows/) - Recursive documentation guide
4. **Start**: Begin documenting patterns in your project!

---

**Previous**: [Setup](../SETUP.md) | **Next**: [Examples](examples/)
