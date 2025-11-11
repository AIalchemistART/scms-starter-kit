# Mind-Map Framework Implementation Guide

**SCMS Core Principle**: Multi-Time-Scale Cognitive Architecture

---

## Overview

The Mind-Map Framework is SCMS's implementation of **multi-time-scale updates** for AI memory—independently validated by Google Research's Nested Learning (NeurIPS 2025). Instead of flat storage, memories organize into three cognitive levels with distinct update frequencies, preventing catastrophic forgetting at the interface level.

---

## Three-Level Architecture

### Visual Representation

```
RARE ←―――――――――――――――――――――――――――→ FREQUENT
       Update Frequency Spectrum

L0 (Foundation)     L1 (Implementation)    Dashboard (Session)
─────────────────   ───────────────────   ──────────────────
Abstract patterns   Concrete solutions    Immediate context
Cross-project       Project-specific      Session-specific  
Test via retrieval  Enforce via loading   Execute now
Days-weeks scale    Hours-days scale      Real-time scale
Probabilistic       Deterministic         Immediate
Natural selection   Quality gates         Working memory
```

---

## Level Definitions

### L0: Foundation Layer (RARE Updates)

**Purpose**: Abstract, cross-project patterns validated through usage

**Characteristics**:
- **Update frequency**: Days to weeks (when pattern generalizes)
- **Scope**: Cross-project knowledge
- **Activation**: Probabilistic (semantic search)
- **Validation**: Natural selection (2+ retrievals = validated)
- **Lifecycle**: Test → Validate → Promote or Decay

**Examples**:
- "QTE systems need timeout logic to prevent soft-locks"
- "Always-true conditions in validation logic always fail"
- "State machines > event listeners for critical timing"
- "Progress systems must validate pre-conditions before terminal states"

**When to Create L0**:
- Pattern applies across multiple projects
- Generalizable design principle
- Bug pattern that prevents entire error classes
- Anti-pattern that guides architecture

---

### L1: Implementation Layer (MEDIUM Updates)

**Purpose**: Concrete, project-specific solutions enforced automatically

**Characteristics**:
- **Update frequency**: Hours to days (when implementation stabilizes)
- **Scope**: Project-specific
- **Activation**: Deterministic (always loaded)
- **Validation**: Quality gates (AI MUST check)
- **Lifecycle**: Implement → Stabilize → Document → Enforce

**Examples**:
- "QTE timeout implementation: cancelQTE() after 30 seconds"
- "Use GameStateManager.validateTransition() before state changes"
- "Progress bar updates: call updateProgress(delta, false) not setProgress(value)"
- "Edge case: Handle progress=100 on initialization (auto-complete bug)"

**When to Create L1**:
- Concrete implementation detail
- Project-specific pattern
- Edge case handling
- Validated L0 pattern that needs concrete enforcement

---

### Dashboard: Session Layer (FREQUENT Updates)

**Purpose**: Immediate, ephemeral session context

**Characteristics**:
- **Update frequency**: Real-time (every session, naturally ephemeral)
- **Scope**: Current session only
- **Activation**: Immediate (working memory)
- **Validation**: None (disposable)
- **Lifecycle**: Create → Use → Discard

**Examples**:
- "Currently debugging QTE cancellation flow"
- "Working on: Refactoring timeout logic in QTEManager.ts"
- "Next task: Test edge case where progress initializes at 100%"
- "Blocked by: Need to understand GameStateManager lifecycle"

**When to Create Dashboard**:
- Current task tracking
- Session-specific context
- Temporary notes
- Immediate reminders

---

## Why Multi-Time-Scale Works

### The Problem: Catastrophic Forgetting

**Traditional flat storage**:
```
All memories updated at same rate
─────────────────────────────────
Session notes ─┐
               ├─→ ALL update frequently
Implementation │
               │
Patterns ──────┘

Result: High-frequency updates interfere with low-frequency knowledge
```

**Problem**: Session changes overwrite pattern knowledge, requiring re-learning.

### The Solution: Frequency Isolation

**Multi-time-scale architecture**:
```
Different update frequencies
─────────────────────────────
Session (frequent) ─────→ Updates don't touch patterns
         │
Implementation (medium) ─→ Updates don't touch patterns  
         │
Patterns (rare) ─────────→ Stable foundation
```

**Solution**: High-frequency changes isolated from low-frequency knowledge.

### Google Research Validation

From "Nested Learning" (Behrouz et al., NeurIPS 2025):

> "The uniform and reusable structure as well as multi time scale update in the brain are the key components to unlock the continual learning in humans."

SCMS implements this at the interface level; Google implemented it at model weights level. **Same fundamental principle, different abstraction levels.**

---

## Memory Promotion Flow

### The Lifecycle

```
Discovery
   │
   ├─→ Create L0 Candidate (AUTO or Manual)
   │        ↓
   │   Probabilistic Retrieval (semantic search)
   │        ↓
   │   Natural Selection
   │   ├─→ Retrieved 2+ times? → VALIDATED
   │   └─→ Not retrieved 30+ days? → DECAY
   │        ↓
   ├─→ Promote to L1? (if project-specific implementation needed)
   │        ↓
   │   Deterministic Loading (quality gate)
   │        ↓
   └─→ Enforce automatically (AI must check)
```

### Promotion Criteria

#### L0 → L1 Promotion

**When to promote**:
- ✅ L0 pattern validated (2+ retrievals)
- ✅ Project-specific implementation needed
- ✅ Concrete enforcement required
- ✅ Edge case handling documented

**Example**:
```
L0: "QTE systems need timeout logic" (abstract pattern)
    ↓ (validated through 3 uses across 2 projects)
L1: "QTE timeout: call cancelQTE() after 30s" (concrete enforcement)
```

#### Decay Criteria

**When to decay (L0 only)**:
- ❌ Not retrieved in 30+ days
- ❌ use_count < 2 (unvalidated)
- ❌ Pattern superseded by better approach
- ❌ Project-specific (should be L1 instead)

**Example**:
```
L0: "Try event listeners for QTE state sync"
    ↓ (not retrieved in 45 days, use_count=1)
DECAYED: Failed approach documented in anti-patterns
```

---

## Implementation Examples

### Windsurf (Auto-Memory) Implementation

**L0 Creation** (Automatic):
```typescript
// AI automatically creates L0 memory during development:
Memory {
  title: "QTE Systems Need Timeout Logic",
  content: "QTE interactions must implement timeout mechanisms...",
  tags: ["pattern", "qte", "timeout", "soft-lock-prevention"],
  created: "2025-10-15",
  use_count: 0,
  level: "L0"  // ← Multi-time-scale level
}
```

**Natural Selection** (Automatic):
```typescript
// Problem recurs → Memory retrieved → use_count++
// After 2nd retrieval:
Memory {
  use_count: 2,  // ← VALIDATED
  validated: true,
  last_used: "2025-10-20"
}
```

**L1 Promotion** (Manual trigger, auto-create):
```typescript
// Developer or AI promotes validated L0 to concrete L1:
WorkspaceRule {
  title: "QTE Timeout Implementation",
  content: "Call cancelQTE() after 30 seconds of inactivity...",
  tags: ["implementation", "qte", "timeout", "concrete"],
  source_l0: "QTE Systems Need Timeout Logic",
  level: "L1",  // ← Deterministic enforcement
  enforcement: "must_check"
}
```

### Manual Markdown Implementation

**L0 Creation** (`docs/memories/qte-timeout-pattern.md`):
```markdown
---
level: L0
tags: [pattern, qte, timeout, soft-lock-prevention]
use_count: 0
created: 2025-10-15
---

# QTE Systems Need Timeout Logic

QTE interactions must implement timeout mechanisms to prevent
soft-locks when players fail to respond...

## Validation History
- 2025-10-20: Retrieved during dialogue QTE implementation
- 2025-10-22: Retrieved during combat QTE refactor

Status: VALIDATED (2+ uses)
```

**L1 Promotion** (`WORKSPACE_RULES.md`):
```markdown
## QTE Timeout Implementation

**Level**: L1 (Project-Specific Enforcement)  
**Source**: L0 pattern "QTE Systems Need Timeout Logic"

### Implementation
Call `cancelQTE()` after 30 seconds of inactivity:
\`\`\`typescript
setTimeout(() => {
  if (!this.completed) {
    this.cancelQTE();
  }
}, 30000);
\`\`\`

### Edge Cases
- Handle early cancellation (user completes before timeout)
- Clean up timeout on component unmount
```

---

## Tag Strategies

### L0 Tags (Abstract Patterns)

**Pattern types**:
- `pattern` - General design pattern
- `bug-pattern` - Bug that prevents error classes
- `anti-pattern` - Design to avoid
- `failed-approach` - Tried and didn't work

**Domain tags**:
- `qte`, `dialogue`, `combat`, `ui`, etc.

**Concept tags**:
- `timeout`, `state-machine`, `validation`, `lifecycle`

**Example**:
```yaml
tags: [pattern, qte, timeout, soft-lock-prevention, state-machine]
```

### L1 Tags (Concrete Implementations)

**Implementation types**:
- `implementation` - Concrete solution
- `edge-case` - Specific handling
- `workaround` - Temporary fix

**Specificity tags**:
- `qte-manager`, `game-state`, `progress-bar`

**Example**:
```yaml
tags: [implementation, qte-manager, timeout, concrete, edge-case]
```

### Dashboard Tags (Session Context)

**Task types**:
- `task`, `bug`, `refactor`, `feature`

**Status tags**:
- `in-progress`, `blocked`, `next`, `done`

**Example**:
```yaml
tags: [task, qte-refactor, in-progress, timeout-logic]
```

---

## Retrieval Patterns

### L0: Probabilistic Retrieval

**Mechanism**: Semantic search based on query similarity

```
User query: "How do I prevent QTE soft-locks?"
     ↓
Semantic embedding match
     ↓
L0 memories ranked by similarity:
  1. "QTE Systems Need Timeout Logic" (0.89 similarity)
  2. "State Machines for Critical Timing" (0.72 similarity)
  3. "Event Listener Anti-Pattern" (0.65 similarity)
     ↓
Top-3 retrieved (probabilistic)
```

**When activated**:
- During problem-solving
- When pattern is relevant
- Natural discovery through use

### L1: Deterministic Loading

**Mechanism**: Always loaded at session start (workspace rules)

```
Session Start
     ↓
Load all L1 rules automatically
     ↓
AI MUST check before acting:
  ✓ QTE Timeout Implementation
  ✓ State Machine Validation
  ✓ Progress Bar Edge Cases
  ✓ ... (all L1 rules)
     ↓
Enforced as quality gates
```

**When activated**:
- Every session (automatic)
- Before relevant actions
- As validation checkpoints

### Dashboard: Immediate Access

**Mechanism**: Presented immediately as session context

```
Session Start
     ↓
Dashboard loaded as working memory:
  • Currently working on: QTE timeout refactor
  • Next task: Test edge case with progress=100
  • Blocked by: Need GameStateManager understanding
     ↓
Immediate context for AI
```

**When activated**:
- Immediately (working memory)
- Updated in real-time
- Discarded after session

---

## Maintenance Workflows

### Weekly Review (L0)

**Check for promotion candidates**:
```bash
# Find validated L0 memories (2+ uses):
grep -r "use_count: [2-9]" docs/memories/ | grep "level: L0"

# Review for L1 promotion if:
- Pattern needs concrete implementation
- Project-specific details emerged
- Edge cases documented
```

### Monthly Cleanup (L0)

**Check for decay candidates**:
```bash
# Find stale L0 memories (30+ days, <2 uses):
# (Automatic in Windsurf, manual in Markdown)

# Archive if:
- No retrievals in 30+ days
- use_count < 2 (unvalidated)
- Pattern superseded
```

### Continuous (L1)

**Update as implementation evolves**:
- New edge cases discovered → Add to L1
- Implementation changes → Update L1 rules
- Pattern invalidated → Remove from L1

---

## Success Metrics

### Quantitative

| Metric | Target | Measures |
|--------|--------|----------|
| **L0 validation rate** | 40-60% | Natural selection working |
| **L0 → L1 promotion** | 20-30% | Patterns becoming concrete |
| **L0 decay rate** | 20-40% | Temporal selection working |
| **L1 enforcement** | 100% | Quality gates active |
| **Dashboard turnover** | 100% | Ephemeral as intended |

### Qualitative

- ✅ Pattern re-discovery eliminated (recognized from L0)
- ✅ Concrete enforcement automatic (L1 quality gates)
- ✅ Session context clear (Dashboard working memory)
- ✅ Cross-project learning (L0 patterns transfer)
- ✅ No documentation debt (temporal decay cleaning)

---

## Common Pitfalls

### ❌ Wrong Level Assignment

**Problem**: Putting concrete implementations in L0
```
Bad:  L0: "Call cancelQTE() after 30 seconds"  (too concrete)
Good: L0: "QTE systems need timeout logic"     (abstract pattern)
Good: L1: "Call cancelQTE() after 30 seconds"  (concrete enforcement)
```

### ❌ No Natural Selection

**Problem**: Manually promoting L0 before validation
```
Bad:  Create L0 → Immediately promote to L1 (no validation)
Good: Create L0 → Use naturally 2+ times → Promote validated pattern
```

### ❌ Dashboard Overflow

**Problem**: Keeping session notes in L0/L1
```
Bad:  L0: "Currently debugging QTE cancellation"  (ephemeral)
Good: Dashboard: "Currently debugging QTE cancellation"
```

### ❌ Flat Tags

**Problem**: No level distinction in tags
```
Bad:  tags: [qte, timeout] (which level?)
Good: tags: [pattern, qte, timeout, soft-lock-prevention] (clearly L0)
Good: tags: [implementation, qte-manager, timeout, concrete] (clearly L1)
```

---

## Integration with Failure Documentation

The Mind-Map Framework and Failure Documentation work together:

### Failures Flow Through Levels

```
Bug Discovered
     ↓
Document as L0 Bug Pattern (if generalizable)
     ↓
Validated through natural selection (2+ retrievals)
     ↓
Promote to L1 Implementation (if project-specific)
     ↓
Enforce as quality gate (prevent recurrence)
```

### Example Flow

1. **Discovery**: QTE soft-lock when progress=100 on init
2. **L0 Pattern**: "Progress systems must validate pre-conditions"
3. **Validation**: Retrieved during 2 similar progress bugs
4. **L1 Implementation**: "Check progress ≠ 100 before enabling"
5. **Enforcement**: AI checks this rule before progress system changes

---

## Conclusion

The Mind-Map Framework transforms AI memory from flat storage into a **multi-time-scale cognitive architecture**:

- **L0**: Abstract patterns tested through natural selection
- **L1**: Concrete implementations enforced as quality gates  
- **Dashboard**: Ephemeral session context as working memory

This prevents catastrophic forgetting at the interface level—validated by Google Research's independent discovery of the same principles at the model level.

**Start using**: Tag your memories with `level: L0/L1/Dashboard` and watch natural selection optimize your knowledge base automatically.

---

**See also**:
- [Failure Documentation Principles](FAILURE_DOCUMENTATION.md)
- [SCMS Whitepaper](../reference/WHITEPAPER.md#mind-map-framework-multi-time-scale-architecture)
- [Setup Guide](../../SETUP.md)
