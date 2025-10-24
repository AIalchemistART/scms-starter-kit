# Recursive Documentation Workflow

**Purpose**: Enable automatic documentation updates after every implementation  
**Strategy**: Model B (Document-First) from SCMS Whitepaper Section 6.2.4  
**When to Enable**: After 2-3 months of conservative approach  
**Status**: Optional (enable when system is mature)

---

## Overview

**Recursive documentation** means the AI assistant automatically updates all documentation layers (L0-L3) immediately after implementation, without waiting for human approval.

### Flow Comparison

**Conservative (Default)**:
```
Implement → Test → Human approves → AI documents
```

**Recursive (Optional)**:
```
Implement → AI documents → Test → Validate or iterate
```

---

## When to Enable

### Good Time to Enable (✅)

**System Maturity**:
- ✅ 2-3 months into project
- ✅ Core patterns established
- ✅ Team comfortable with SCMS
- ✅ Documentation coverage >80%

**Team Readiness**:
- ✅ Strong testing culture
- ✅ Fast iteration loop
- ✅ Trust in AI assistant
- ✅ Low risk tolerance for temp inaccuracy

**Indicators**:
- Pattern space well-understood
- Most new work is variations of known patterns
- Documentation lag is pain point
- Want to reduce cognitive load

---

### Bad Time to Enable (❌)

**System Immaturity**:
- ❌ First month of project
- ❌ Pattern space unknown
- ❌ Frequent architecture changes
- ❌ High uncertainty

**Team Issues**:
- ❌ Weak testing culture
- ❌ Slow feedback loops
- ❌ Team unfamiliar with SCMS
- ❌ Critical system (medical, financial)

---

## Benefits

### Time Savings

**Before (Conservative)**:
```
Implementation: 30 min
Test: 10 min
Request doc update: 2 min
AI updates: 5 min
─────────────────────
Total: 47 min, 2 round-trips
```

**After (Recursive)**:
```
Implementation + auto-doc: 30 min
Test: 10 min
─────────────────────
Total: 40 min, 1 round-trip
Savings: 7 min, 1 round-trip
```

**Over 20 implementations**: ~2.3 hours saved, 20 fewer round-trips

---

### Cognitive Load Reduction

**Developer Benefits**:
- ✅ No need to remember "update docs"
- ✅ Docs always current when testing
- ✅ Clear validation status
- ✅ Automatic promotion tracking

**AI Benefits**:
- ✅ Consistent workflow
- ✅ Always knows latest patterns
- ✅ Can reference own updates immediately

---

## Risks & Mitigation

### Risk 1: Temporary Doc Inaccuracy

**Risk**: Document pattern before validation, might need revision

**Likelihood**: Medium (happens during iteration)

**Impact**: Low (easily fixed)

**Mitigation**:
- Mark patterns as CANDIDATE until validated
- Easy to update if pattern fails
- Iteration naturally updates docs

**Labyrinth Protocol Result**: 95%+ accuracy, 0 rollbacks needed

---

### Risk 2: Documentation Clutter

**Risk**: Multiple iterations create messy docs

**Likelihood**: Low

**Impact**: Low

**Mitigation**:
- AI replaces candidate content (doesn't append)
- Only promote validated patterns to L1
- Automatic archival of unused patterns

---

### Risk 3: Team Confusion

**Risk**: Unclear what's validated vs candidate

**Likelihood**: Low with clear markers

**Impact**: Medium

**Mitigation**:
- Clear status markers (⏳ CANDIDATE, ✅ VALIDATED)
- L1 only contains validated patterns
- Dashboard shows validation status

---

## Implementation Steps

### Step 1: Prerequisites Check

Before enabling, verify:

- [ ] SCMS used for 2-3 months
- [ ] Core patterns documented in L1
- [ ] Team comfortable with system
- [ ] Strong testing culture in place
- [ ] Documentation coverage >80%
- [ ] Memory system working reliably

**If any are ❌, wait longer before enabling**

---

### Step 2: Configure AI Assistant

**Windsurf**:

1. Create memory: "Recursive Documentation Enabled"
2. Content:
```markdown
After every implementation:
1. Create/update L0 memory (mark CANDIDATE)
2. If pattern 2nd use, add to L1 WORKSPACE_RULES
3. If pattern 5th use, suggest L2 SOP
4. Report what was documented

Do NOT wait for approval to document.
Mark patterns as CANDIDATE until user validates.
```

**Cursor**:

1. Edit `.cursorrules`:
```
# Recursive Documentation
After each implementation:
1. Create/update memory in docs/memories/
2. If use_count >= 2, add to WORKSPACE_RULES.md
3. If use_count >= 5, suggest creating SOP
4. Report documentation updates
```

**Generic AI**:

1. Add to system prompt:
```
After implementing, automatically create/update documentation:
- L0 memory (always)
- L1 WORKSPACE_RULES (if 2nd use)
- L2 SOP suggestion (if 5th use)
```

---

### Step 3: Set Update Rules

**L0 Memory Updates** (Always):
```
AFTER implementation:
  Create or update L0 memory
  Set status: CANDIDATE
  Increment use_count
  Update last_used date
```

**L1 Promotion** (Automatic at 2nd use):
```
IF use_count >= 2:
  Add pattern to WORKSPACE_RULES.md
  Mark memory as PROMOTED
  Report promotion
```

**L2 SOP Suggestion** (Automatic at 5th use):
```
IF use_count >= 5:
  Suggest creating detailed SOP
  Offer to create from template
```

---

### Step 4: Update Response Template

**AI should respond like**:

```markdown
✅ Implementation Complete

**Code Changes**:
- [List files modified]

**Documentation Updates**: ← AUTOMATIC
- 📝 L0: Created/Updated "[Memory Name]"
  - Status: ⏳ CANDIDATE (use_count: X)
  - [Brief description]

[IF 2nd use:]
- ⚡ L1: Added to WORKSPACE_RULES.md → [Section]
  - Pattern validated through repeated use

[IF 5th use:]
- 📚 L2: Pattern ready for SOP. Create detailed procedure?

**Validation Needed**:
- [ ] Test [functionality]
- [ ] Verify [behavior]

Test and report results!
```

---

### Step 5: Test on Small Feature

**Pilot Test**:

1. **Implement small feature**
2. **Verify AI auto-documents**
3. **Test the implementation**
4. **Report**: "Works!" or "Issue: [desc]"
5. **Observe**: Did AI update docs correctly?

**Success Criteria**:
- ✅ L0 memory created automatically
- ✅ Use count tracked correctly
- ✅ Status markers clear
- ✅ Easy to iterate if needed

**If test fails**: Revert to conservative, diagnose issue

---

### Step 6: Evaluate After 15 Implementations

**Track These Metrics**:

| Metric | Target | Actual |
|--------|--------|--------|
| Doc lag | <2 hours | _____ |
| Doc accuracy | ≥95% | _____ |
| Revisions needed | <10% | _____ |
| Time saved/impl | ~5-7 min | _____ |
| Dev satisfaction | High | _____ |

**Decision Points**:
- ✅ **Keep**: If metrics met, accuracy ≥95%
- 🔄 **Adjust**: If accuracy 90-95%, tweak thresholds
- ❌ **Rollback**: If accuracy <90% or confusion high

---

## Rollback Procedure

### If Recursive Docs Cause Issues

**Indicators**:
- Documentation frequently inaccurate (>10% revisions)
- Team confused by CANDIDATE vs VALIDATED
- Preference for more control

**Rollback Steps**:

1. **Disable auto-promotion**:
   ```
   Remove automatic L1 promotion rule
   Require human approval for L1 updates
   Keep L0 automatic (low risk)
   ```

2. **Update AI configuration**:
   - Windsurf: Update memory to conservative mode
   - Cursor: Edit `.cursorrules` to remove auto-update
   - Generic: Update system prompt

3. **Notify team**: Explain reversion and why

4. **Document lessons**: What didn't work, what to try differently

**Recovery Time**: <30 minutes

---

## Workflow Details

### L0: Active Memories (Always Auto-Update)

**After Every Implementation**:

```markdown
## Memory: [Pattern Name]

**Status**: ⏳ CANDIDATE
**Use Count**: [Increment]
**First Used**: [If new]
**Last Used**: [Today]

**Pattern**: [What was implemented]

**Code Example**:
```language
// Working code
```

**Validation Needed**:
- [ ] User tests confirm functionality
```

**On Iteration** (if pattern fails):
- Replace CANDIDATE content with revised approach
- Keep status as CANDIDATE until validated
- Note what changed

**On Validation** (when user confirms success):
- Change status to ✅ VALIDATED
- Keep in L0 until 2nd use

---

### L1: Quick Reference (Auto-Promote at 2nd Use)

**Trigger**: `use_count >= 2`

**Action**:
```markdown
Add to WORKSPACE_RULES.md:

### [Pattern Name] (Validated Pattern - Use Count: 2+)

**When to Use**: [Brief description]

**Pattern**:
```language
// Code from implementations
```

**Known Edge Cases**: [From L0 memory]
```

**Mark L0 Memory**:
- Status: 🚀 PROMOTED
- Link: WORKSPACE_RULES.md → [section]

---

### L2: Detailed SOPs (Suggest at 5th Use)

**Trigger**: `use_count >= 5`

**AI Suggests**:
```
📚 This pattern has been used 5+ times. 
Should I create a detailed SOP?

Would include:
- Step-by-step procedure
- Complete code examples
- Testing checklist
- Common pitfalls
- Performance notes
```

**If User Approves**:
- Create from SOP_TEMPLATE.md
- Populate with L0/L1 content
- Add to docs/sops/
- Link from WORKSPACE_RULES

---

## Status Markers

**Use these consistently**:

| Marker | Meaning | Layer |
|--------|---------|-------|
| ⏳ **CANDIDATE** | Implemented, awaiting validation | L0 |
| ✅ **VALIDATED** | Proven through testing | L0 |
| 🚀 **PROMOTED** | Moved to L1 WORKSPACE_RULES | L0→L1 |
| 📚 **SOP READY** | Suggest creating detailed procedure | L1→L2 |
| 🗄️ **ARCHIVED** | Unused 30+ days, archived | L0 |

---

## Best Practices

### DO ✅

- **Mark clearly**: Use status markers consistently
- **Replace, don't append**: Update candidate content, not add versions
- **Promote automatically**: Trust the use_count threshold
- **Report updates**: Always tell user what was documented
- **Iterate freely**: Easy to update if pattern fails

### DON'T ❌

- **Don't guess**: Only document what was implemented
- **Don't promote unvalidated**: Keep use_count >= 2 rule
- **Don't clutter**: Archive unused patterns monthly
- **Don't hide status**: Always show CANDIDATE vs VALIDATED
- **Don't skip validation**: User must test before marking validated

---

## Success Stories

### Labyrinth Protocol Case Study

**Context**: 4-month game development, complex QTE system

**Transition**:
- Months 1-4: Conservative approach
- Month 5+: Recursive documentation

**Results**:
- Documentation lag: 2 days → <2 hours (-95%)
- Time saved: ~5 min per implementation
- Accuracy: 95%+ (occasional revisions needed)
- Rollbacks: 0 (iterations handled corrections)
- Developer satisfaction: High (reduced cognitive load)

**Key Success Factors**:
- Strong testing culture (gameplay validation)
- Mature pattern library
- Fast iteration loop
- Clear status markers

**Lesson**: For AI-assisted development with strong testing, recursive documentation is not just viable—it's preferable after patterns stabilize.

---

## Troubleshooting

### Issue: AI Not Auto-Documenting

**Cause**: Configuration not applied

**Fix**:
- Windsurf: Check memory system, verify memory content
- Cursor: Check `.cursorrules` in project root
- Generic: Repeat instructions in each session

---

### Issue: Documentation Inaccurate

**Cause**: Pattern failed but doc not updated

**Fix**:
- Normal! Just iterate
- AI should update docs on revision
- If not, explicitly request update

---

### Issue: Confusion About Status

**Cause**: Status markers unclear

**Fix**:
- Use emoji consistently (⏳ ✅ 🚀)
- Check MEMORY_STATUS_DASHBOARD weekly
- Review with team what each status means

---

### Issue: Too Many Candidates

**Cause**: Patterns not being validated or promoted

**Fix**:
- Test implementations promptly
- Report results (success/failure)
- Run monthly cleanup (archive old candidates)

---

## Related Documents

- **MEMORY_PROMOTION_WORKFLOW.md**: Promotion criteria details
- **VALIDATION_PIPELINE.md**: How patterns prove utility
- **WORKSPACE_RULES.md**: Where L1 patterns live
- **Whitepaper Section 6.2.4**: Three documentation strategies

---

## Evaluation Checklist

**After 2 months or 15 implementations**:

### Metrics Review

- [ ] Documentation lag <2 hours achieved?
- [ ] Documentation accuracy ≥95%?
- [ ] Time savings realized (~5-7 min/impl)?
- [ ] Developer satisfaction high?
- [ ] System working smoothly?

### Decision

**Keep Recursive** if:
- ✅ All metrics met
- ✅ Team satisfied
- ✅ Accuracy acceptable

**Adjust Thresholds** if:
- ⚠️ Accuracy 90-95% (maybe use_count 3 for L1?)
- ⚠️ Too many candidates (raise promotion bar?)

**Rollback to Conservative** if:
- ❌ Accuracy <90%
- ❌ Team confusion
- ❌ Preference for more control

---

**Status**: Optional Enhancement  
**Recommended**: After 2-3 months of conservative approach  
**Evaluation**: After 15 implementations  
**Rollback**: Easy (<30 min)

**Enable recursive documentation when system is mature and team is ready. The cognitive load reduction and time savings make it worthwhile for established projects.**
