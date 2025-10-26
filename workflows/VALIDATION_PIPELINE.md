# Dual Validation Pipeline: How SCMS Tests and Enforces Knowledge

**Core Concept**: Patterns prove utility through repeated use (L0 destructive validation), then become mandatory checks (L1 stable validation).

**Version**: v1.3 - Updated October 2025

---

## The Dual Validation Analogy

SCMS implements **two complementary validation systems**:

| Software Testing | SCMS L0 (Destructive) | SCMS L1 (Stable) |
|------------------|----------------------|------------------|
| **Test case** | Memory/pattern | Quality gate |
| **First execution** | Initial use (use_count = 1) | N/A (not yet promoted) |
| **Second execution** | Validation (use_count = 2) | PROMOTION TRIGGER |
| **Test passes** | Pattern proves useful | → Enforced in L1 |
| **Test fails (unused)** | Temporal decay archives | N/A (never promoted) |
| **Test suite** | L0 memory corpus (18-30 patterns) | L1 WORKSPACE_RULES.md |
| **CI/CD pipeline** | Probabilistic retrieval | Deterministic loading |
| **Purpose** | **Test patterns experimentally** | **Enforce patterns universally** |

**Key Insights**: 
- **L0**: Reuse IS the test that validates the pattern (destructive validation via natural selection)
- **L1**: Validated patterns become mandatory checks that AI MUST follow (stable validation via enforcement)

---

## How Patterns Enter the Pipeline

### Entry Point: Discovery

**Patterns enter L0 when**:
- Novel solution discovered
- Edge case encountered
- Optimization found
- Problem solved in non-obvious way

**Created as**:
```markdown
## Memory: [Pattern Name]

**Status**: ⏳ CANDIDATE
**Use Count**: 1
**First Used**: YYYY-MM-DD

[Pattern description and code]
```

**Marked**: CANDIDATE (awaiting validation)

---

## Validation Stages

### Stage 1: Initial Testing (Human)

**What Happens**:
1. Developer implements pattern
2. AI creates L0 memory (CANDIDATE)
3. Developer tests in real environment
4. Developer reports: "Works!" or "Issue: [desc]"

**Outcomes**:

**Success** ✅:
```markdown
**Status**: ✅ VALIDATED
**Use Count**: 1
**Validation**: Confirmed working by [developer] on [date]
```

**Failure** ❌:
```markdown
**Status**: ⏳ CANDIDATE (revised)
**Use Count**: 1
**Iteration**: Updated approach based on testing
```

**Key**: Human testing provides first validation

---

### Stage 2: Reuse Testing (Automatic)

**What Happens**:
1. Similar problem arises
2. AI retrieves validated L0 memory
3. Pattern applied to new scenario
4. Developer tests again

**Outcomes**:

**2nd Success** ✅ (Most Common):
```markdown
**Status**: 🚀 PROMOTED to L1
**Use Count**: 2
**Validation**: Proven through repeated use
```
→ Pattern moves to WORKSPACE_RULES.md

**2nd Failure** ❌ (Rare):
```markdown
**Status**: 🔄 NEEDS REVISION
**Use Count**: 2 (but not validated)
**Note**: Works in scenario 1, fails in scenario 2
```
→ Pattern refined for broader applicability

**Key**: Repeated success validates generalizability

---

### Stage 3: Frequent Use (Promotion to L2)

**What Happens**:
1. Pattern used 5+ times
2. System recognizes frequency
3. AI suggests creating detailed SOP

**Outcome**:
```markdown
**Status**: 📚 SOP READY
**Use Count**: 5+
**Recommendation**: Create detailed procedure
```
→ L2 SOP created in docs/sops/

**Key**: Frequency indicates standardization need

---

### Stage 4: Archival (Decay)

**What Happens**:
1. Pattern unused for 30+ days
2. Use count < 2 (never validated)
3. Monthly review identifies stale candidate

**Outcome**:
```markdown
**Status**: 🗄️ ARCHIVED
**Use Count**: 1
**Archived**: YYYY-MM-DD
**Reason**: Unused for 30+ days, never validated
```
→ Moved to ARCHIVED_MEMORIES.md

**Restoration**: If pattern used again, restore from archive

**Key**: Unused patterns removed, keeping corpus clean

---

## Validation vs. Guessing

### Traditional Approach (Guessing)

```
Developer: "I think this pattern might be useful"
→ Documents immediately
→ Never used again
→ Documentation cluttered with unused patterns
```

**Problem**: No validation, just guessing

---

### SCMS Approach (Validation)

```
Developer: "I solved problem X with pattern Y"
→ L0 CANDIDATE created
→ Problem X recurs → Pattern Y retrieved and applied
→ Success → VALIDATED and PROMOTED to L1
```

**Benefit**: Only proven patterns reach permanent docs

---

## Validation Criteria

### What Makes a Pattern Valid?

**Technical Validation**:
- ✅ Code works in real implementation
- ✅ Passes tests (unit, integration, manual)
- ✅ No major issues discovered

**Reusability Validation**:
- ✅ Used in 2+ scenarios successfully
- ✅ Generalizes beyond first use case
- ✅ Applicable to similar problems

**Quality Validation**:
- ✅ Clear description (understandable)
- ✅ Working code example (copy-paste ready)
- ✅ Edge cases documented (if discovered)

---

## The Promotion Decision Tree

```
Pattern Discovered
    ↓
Create L0 Memory (CANDIDATE)
    ↓
Test #1 (Developer validates)
    ├─ ✅ Success → Mark VALIDATED
    └─ ❌ Failure → Revise, test again
    ↓
Used 2nd time?
    ├─ YES → Promote to L1 (WORKSPACE_RULES)
    └─ NO → Wait... (check monthly)
        ↓
    Unused for 30 days?
        ├─ YES → Archive
        └─ NO → Keep in L0
    ↓
Used 5th time?
    ├─ YES → Suggest L2 SOP creation
    └─ NO → Continue in L1
    ↓
Complete feature with multiple patterns?
    ├─ YES → Consider L3 Case Study
    └─ NO → Continue normal workflow
```

---

## Validation Metrics

### Track These

**Pattern Lifecycle**:
- Discovery → Validation: ~1-2 days (testing time)
- Validation → L1: ~3-14 days (time to 2nd use)
- L1 → L2: ~2-8 weeks (time to 5th use)

**Success Rates**:
- % of CANDIDATES that become VALIDATED: Target >80%
- % of VALIDATED that promote to L1: Target >60%
- % of L1 that reach L2: Target >20%

**Quality**:
- L0 accuracy: >90% (some iterations expected)
- L1 accuracy: >95% (validated through reuse)
- L2 accuracy: >98% (used 5+ times)

---

## Validation Through Real Use

### Example: Multi-Key QTE Pattern (Labyrinth Protocol)

**Discovery** (Day 1):
```javascript
// shot006_01: Dual-key QTE (Space + E)
function startDualKeyQTE(key1, key2, window) {
  // Implementation
}
```
Status: ⏳ CANDIDATE, use_count: 1

**Testing** (Day 1):
- Developer tests in game
- Reports: "Works great!"
- Status: ✅ VALIDATED

**Reuse** (Day 8):
```javascript
// shot007_01: Also needs dual-key (Space + Q)
// AI retrieves pattern, applies to new scenario
```
Status: 🚀 PROMOTED to L1, use_count: 2

**Frequent Use** (Day 45):
```javascript
// Used in shot006, shot007, shot008, shot009, shot010
```
Status: 📚 SOP READY, use_count: 5

**Outcome**: Pattern validated through actual use in 5 different implementations.

---

## Anti-Patterns to Avoid

### ❌ Premature Documentation

**Don't**:
```
Discover pattern → Document in L1 immediately → Never use again
```

**Do**:
```
Discover pattern → L0 CANDIDATE → Validate through testing → Wait for 2nd use → Promote to L1
```

---

### ❌ Over-Promotion

**Don't**:
```
Use once → Promote to L1 → Pattern turns out to be wrong
```

**Do**:
```
Use once → Keep in L0 → Use twice → Validate both times → Promote to L1
```

---

### ❌ Under-Archival

**Don't**:
```
Create 100 L0 candidates → Never archive → Cluttered memory system
```

**Do**:
```
Create L0 candidates → Monthly review → Archive unused (30+ days, use_count < 2)
```

---

## Validation vs. Testing

### They're Different

**Software Testing** (Code Correctness):
- Does code work as intended?
- Unit tests, integration tests
- Run before deployment

**SCMS Validation** (Pattern Utility):
- Is pattern useful/reusable?
- Validated through repeated use
- Happens over time

**Both Required**: Code must pass tests AND pattern must prove utility through reuse.

---

## Trust Calibration

### Building Trust in Patterns

**L0 CANDIDATE**:
- Trust: Low-Medium
- Reason: Untested in multiple scenarios
- Use: With caution, verify results

**L0 VALIDATED**:
- Trust: Medium
- Reason: Worked once, not yet proven generalizable
- Use: Confidently, but be alert for edge cases

**L1 PROMOTED**:
- Trust: High
- Reason: Worked 2+ times in different scenarios
- Use: Confidently, likely to work

**L2 SOP**:
- Trust: Very High
- Reason: Used 5+ times, detailed procedure exists
- Use: Follow SOP, standard practice

---

## Continuous Validation

### Patterns Evolve

**Pattern Lifecycle**:
1. **Discovery**: L0 CANDIDATE (untested)
2. **Validation**: L0 VALIDATED (tested once)
3. **Reuse**: L1 PROMOTED (proven generalizable)
4. **Standardization**: L2 SOP (frequent use, documented)
5. **Refinement**: Edge cases added, optimizations discovered
6. **Maturity**: Stable, rarely needs updates

**Key**: Validation is continuous, not one-time

---

## Validation Failures

### What If Pattern Doesn't Validate?

**Scenario**: Pattern used twice, fails second time

**Options**:

**1. Refine for Both Scenarios**:
```markdown
**Pattern**: Updated to handle both use cases
**Validation**: Now works in scenario A and B
**Status**: ✅ VALIDATED (revised)
```

**2. Split into Variants**:
```markdown
**Pattern A**: For scenario type 1
**Pattern B**: For scenario type 2
**Validation**: Each validated in its own context
```

**3. Deprecate if Fundamentally Flawed**:
```markdown
**Status**: ❌ DEPRECATED
**Reason**: Better approach discovered
**Replacement**: See [new pattern]
```

---

## Validation Pipeline Benefits

### For Developers

**Time Savings**:
- Don't re-discover working patterns
- Don't document unused patterns
- Don't maintain outdated docs

**Quality Improvement**:
- Only proven patterns in L1
- High confidence in L2 SOPs
- Clear status indicators

---

### For Teams

**Knowledge Sharing**:
- Patterns validated by Alice, reused by Bob
- Collective validation across team
- Automatic promotion without meetings

**Reduced Maintenance**:
- Self-cleaning (archival of unused)
- Self-promoting (automatic L1 at 2 uses)
- Self-documenting (with recursive mode)

---

### For AI Assistants

**Better Retrieval**:
- Prioritize validated patterns
- Surface frequently-used SOPs
- Avoid suggesting deprecated patterns

**Continuous Learning**:
- System improves with each use
- Patterns refined based on edge cases
- Knowledge base always current

---

## Summary

**SCMS Validation Pipeline**:
1. **Create**: Pattern discovered → L0 CANDIDATE
2. **Test**: Developer validates → L0 VALIDATED
3. **Reuse**: Used 2nd time → L1 PROMOTED
4. **Standardize**: Used 5th time → L2 SOP
5. **Archive**: Unused 30+ days → ARCHIVED

**Key Principle**: Patterns prove utility through repeated successful use, not through guessing or premature documentation.

**Result**: High signal-to-noise ratio across all documentation layers.

---

**The validation pipeline ensures only patterns that have proven their worth through real use reach permanent documentation, maintaining a clean, trustworthy knowledge base.**
