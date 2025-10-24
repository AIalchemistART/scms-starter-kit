# Memory Promotion Workflow

**Purpose**: Define clear criteria and process for promoting patterns across SCMS layers  
**Layers**: L0 (Memories) → L1 (Quick Reference) → L2 (Detailed SOPs) → L3 (Case Studies)

---

## Overview

SCMS uses **validation through repeated use** as the promotion trigger. Patterns must prove utility before moving to more permanent documentation layers.

### The Validation Pipeline

```
Discovery → L0 CANDIDATE → Test → L0 VALIDATED → 2nd Use → L1 PROMOTED → 5th Use → L2 SOP → Milestone → L3 Case Study
```

---

## Promotion Criteria by Layer

### L0 → L1: Memory to Quick Reference

**Threshold**: Use count ≥ 2

**Criteria**:
- ✅ Pattern used successfully twice
- ✅ Reusable across scenarios
- ✅ Has clear code example
- ✅ Edge cases documented (if any)
- ✅ User validated through testing

**What Promotes**:
- Patterns that solve recurring problems
- Techniques that work reliably
- Architectural decisions that stick
- Common pitfall solutions

**What Doesn't Promote**:
- One-off fixes (use_count = 1)
- Experimental approaches not yet proven
- Project-specific hacks
- Temporary workarounds

---

### L1 → L2: Quick Reference to Detailed SOP

**Threshold**: Use count ≥ 5

**Criteria**:
- ✅ Pattern used 5+ times
- ✅ Complex enough to need step-by-step guide
- ✅ Has multiple decision points or configurations
- ✅ Team frequently asks "how do I do X?"
- ✅ Worth 15+ minutes to document thoroughly

**What Gets an SOP**:
- Multi-step procedures
- Complex integrations
- Patterns with many variations
- Systems requiring setup/configuration

**What Stays in L1**:
- Simple patterns (single code snippet sufficient)
- Self-explanatory techniques
- Patterns with few variations

---

### L2 → L3: SOP to Case Study

**Threshold**: Feature demonstrates multiple L2 SOPs

**Criteria**:
- ✅ Complete implementation exists
- ✅ Uses 2+ L2 SOPs together
- ✅ Has measurable results/metrics
- ✅ Novel insights or learnings
- ✅ Significant milestone achieved

**What Becomes a Case Study**:
- Complex features showing multiple patterns
- Implementations with unexpected learnings
- Milestone achievements worth documenting
- Examples that teach multiple concepts

**What Doesn't**:
- Simple feature implementations
- Routine work following existing SOPs
- Features without notable learnings

---

## Promotion Process

### L0 → L1 Promotion

**Step 1: Recognize Validation**

Pattern is validated when:
- Used successfully in real implementation
- Tested by developer
- Confirmed working: "Works great!"

**Step 2: Check Use Count**

```
IF use_count >= 2 THEN
  Pattern is ready for L1 promotion
END IF
```

**Step 3: Extract to WORKSPACE_RULES**

Add to `WORKSPACE_RULES.md`:

```markdown
### [Pattern Name] (Validated Pattern - Use Count: X)

**When to Use**: [From L0 memory]

**Pattern**:
```language
// Code from L0 memory
```

**Known Edge Cases**: [From L0 memory]

**Related**: See [L2 SOP] if exists
```

**Step 4: Update L0 Memory**

```markdown
**Status**: 🚀 PROMOTED to L1
**Promoted To**: WORKSPACE_RULES.md → [Section name]
**Promoted Date**: YYYY-MM-DD
```

**Step 5: Keep L0 Active**

Don't delete L0 memory—keep for:
- Continued use tracking
- Additional edge case discoveries
- Future SOP creation (at 5 uses)

---

### L1 → L2 Promotion

**Step 1: Recognize Frequency**

```
IF use_count >= 5 AND complexity >= medium THEN
  Pattern ready for detailed SOP
END IF
```

**Step 2: Assess Complexity**

**Needs SOP if**:
- Multiple steps required
- Decision points during implementation
- Configuration options available
- Common pitfalls need detailed explanation
- Testing requires specific procedures

**Step 3: Create SOP**

1. Copy `docs/templates/SOP_TEMPLATE.md`
2. Name: `docs/sops/[PATTERN_NAME]_SOP.md`
3. Fill in all sections:
   - Overview
   - Step-by-step implementation
   - Common pitfalls
   - Testing checklist
   - Code templates
4. Include content from L0 and L1

**Step 4: Link from L1**

Update WORKSPACE_RULES.md pattern:

```markdown
**Related**: See [Pattern Name SOP](docs/sops/[file].md) for detailed procedure
```

**Step 5: Update Memory**

```markdown
**Promoted To L2**: docs/sops/[file].md
**SOP Created**: YYYY-MM-DD
```

---

### L2 → L3 Promotion

**Step 1: Identify Milestone**

Case study candidates:
- Feature completing a sprint/milestone
- Implementation using multiple SOPs
- Problem solving that yielded insights
- Architecture decision with measurable impact

**Step 2: Gather Information**

Collect:
- Implementation timeline
- SOPs used (L2 references)
- Patterns applied (L1 references)
- Challenges encountered
- Solutions discovered
- Metrics (before/after)

**Step 3: Create Case Study**

1. Copy `docs/templates/CASE_STUDY_TEMPLATE.md`
2. Name: `docs/case-studies/[FEATURE_NAME]_CASE_STUDY.md`
3. Fill in complete narrative:
   - What was built
   - Patterns applied
   - Challenges & solutions
   - Performance metrics
   - Lessons learned
   - Reusability guidance

**Step 4: Link from L1 and L2**

Reference case study in relevant patterns:

```markdown
**Example**: See [Feature Name Case Study](docs/case-studies/[file].md)
```

---

## Quality Standards

### L1 Patterns Must Have

- [ ] Clear "when to use" description
- [ ] Working code example
- [ ] Known edge cases (if any discovered)
- [ ] Use count ≥ 2
- [ ] Validated through testing

### L2 SOPs Must Have

- [ ] Step-by-step procedure
- [ ] Complete code examples
- [ ] Common pitfalls with solutions
- [ ] Testing checklist
- [ ] Use count ≥ 5 or clear complexity need
- [ ] Reviewed for accuracy

### L3 Case Studies Must Have

- [ ] Complete implementation narrative
- [ ] Multiple patterns demonstrated
- [ ] Real metrics/results
- [ ] Lessons learned
- [ ] Reusability guidance
- [ ] Referenced from L1/L2

---

## Rollback/Demotion

### When to Demote

**L1 → L0**:
- Pattern found to be incorrect
- Better approach discovered
- Pattern superseded by new technique

**L2 → L1**:
- SOP too detailed for simple pattern
- Pattern simplified significantly
- SOP rarely referenced

**Process**:
1. Mark original as DEPRECATED
2. Create new L0 memory for correct approach
3. Link old → new
4. Update all references

---

## Automation

### With Recursive Documentation

**Automatic**:
- L0 memory creation/updates
- L0 → L1 promotion (at 2nd use)
- Use count tracking

**Semi-Automatic**:
- L1 → L2 suggestion (at 5th use)
- AI offers to create SOP

**Manual**:
- L2 → L3 case study creation
- Quality review
- Demotion decisions

### Without Recursive Documentation

**Manual**:
- L0 memory creation
- All promotions
- Use count tracking

**Process**:
1. Recognize pattern deserves promotion
2. Ask AI: "Promote [pattern] to L1"
3. AI extracts to WORKSPACE_RULES
4. Review and merge

---

## Examples

### Example 1: Simple Pattern Promotion

**Discovery**:
```markdown
## Memory: Date Formatting Utility

**Status**: ⏳ CANDIDATE
**Use Count**: 1
**First Used**: 2025-10-01

function formatDate(date) {
  return date.toISOString().split('T')[0];
}
```

**2nd Use** (2025-10-15):
```markdown
**Status**: ✅ VALIDATED
**Use Count**: 2
```

**Promotion to L1**:
```markdown
### Date Formatting (Validated Pattern - Use Count: 2)

**When to Use**: Formatting dates for display or API calls

**Pattern**:
```javascript
function formatDate(date) {
  return date.toISOString().split('T')[0];
}
```

**Known Edge Cases**: None discovered
```

---

### Example 2: Complex Pattern → SOP

**Pattern History**:
- Use 1-2: Basic API call pattern
- Use 3-4: Added error handling
- Use 5: Added retry logic
- **Recognition**: Pattern used 5 times, has complexity

**SOP Creation**:
```markdown
# API Error Handling - Standard Operating Procedure

**Use Count**: 5+
**Complexity**: Medium

## Implementation Steps

### Step 1: Basic Call Structure
...

### Step 2: Error Handling
...

### Step 3: Retry Logic
...
```

---

## Metrics

### Track These

**Promotion Velocity**:
- Time from discovery to L1: Target <2 days
- Time from L1 to L2: Target <1 week after 5th use

**Quality**:
- L1 pattern accuracy: >95%
- L2 SOP completeness: >90%
- L3 case study usefulness: Team feedback

**Coverage**:
- % of use_count ≥2 patterns in L1
- % of use_count ≥5 patterns with SOPs
- Major features with case studies

---

## Troubleshooting

### Issue: Pattern Not Promoting

**Cause**: Use count not tracked correctly

**Fix**:
- Verify use_count in L0 memory
- Manually increment if missed
- Check promotion criteria met

---

### Issue: L1 Getting Cluttered

**Cause**: Promoting too aggressively

**Fix**:
- Raise threshold to 3 uses
- Archive unused patterns
- Review monthly, demote rarely-used

---

### Issue: Not Enough SOPs

**Cause**: Not recognizing complexity

**Fix**:
- Look for patterns team asks about frequently
- Identify multi-step procedures
- Create SOPs proactively for complex patterns

---

## Best Practices

### DO ✅

- **Promote based on use**: Trust the use_count metric
- **Keep L0 active**: Don't delete after promotion
- **Link layers**: Reference L2 from L1, L3 from L1/L2
- **Review monthly**: Check for promotion candidates
- **Quality over speed**: Ensure promoted patterns are accurate

### DON'T ❌

- **Don't promote untested**: Wait for validation
- **Don't promote one-offs**: Use count must be ≥2
- **Don't over-document**: Not everything needs an SOP
- **Don't delete L0**: Keep for tracking and future updates
- **Don't promote to L3 prematurely**: Wait for complete feature

---

**This workflow ensures only proven, validated patterns reach permanent documentation, maintaining high signal-to-noise ratio across all SCMS layers.**
