# Memory: [Pattern Name]

**Status**: ⏳ CANDIDATE | ✅ VALIDATED | 🚀 PROMOTED | 🗄️ ARCHIVED  
**Use Count**: X  
**First Used**: YYYY-MM-DD  
**Last Used**: YYYY-MM-DD  
**Confidence**: [🟢 HIGH | 🟡 MEDIUM | 🔴 LOW] (Validation strength)  
**Surprise Value**: [⭐-⭐⭐⭐⭐⭐] (How novel is this pattern?)  
**Retention Priority**: [PERMANENT | HIGH | MEDIUM | LOW]  
**Episode**: [Link to MEMORY_EPISODES.md#episode-name, if grouped]  
**Tags**: [category, technology, pattern-type]  
**Promoted To**: [Link if promoted to L1/L2] | Not yet promoted

---

## Pattern Description

[Clear, concise description of what this pattern does and when to use it]

### Problem It Solves

[What issue does this pattern address?]

### When to Use

- [Scenario 1]
- [Scenario 2]
- [Scenario 3]

### When NOT to Use

- [Exception 1]
- [Exception 2]

---

## Code Example

```[language]
// Complete, working code example
// Include enough context to understand

function examplePattern() {
  // Implementation
}
```

### Key Points

- [Important aspect 1]
- [Important aspect 2]
- [Important aspect 3]

---

## Expected Behavior

**When applied correctly, this pattern should**:
- [Expected outcome 1]
- [Expected outcome 2]
- [Expected outcome 3]

**You'll know it's working when**:
- [Observable result 1]
- [Observable result 2]

---

## Validation Criteria

- [ ] Pattern implemented successfully
- [ ] Tests pass
- [ ] No edge cases discovered
- [ ] Performance acceptable
- [ ] Team review complete (if applicable)

---

## 🎯 Confidence Assessment (Titans-Validated)
*Confidence indicates validation strength - how certain are we this pattern is correct?*

**Confidence Scoring:**
| Level | Meaning | Action |
|-------|---------|--------|
| 🟢 HIGH | Validated 3+ times, no failures | Ready for L1 promotion |
| 🟡 MEDIUM | Validated 1-2 times, minor issues | Continue testing, document edge cases |
| 🔴 LOW | Untested or has known issues | Do not promote, needs more validation |

**Confidence Factors:**
- [ ] **Breadth of Testing**: Used in multiple contexts
- [ ] **Edge Case Coverage**: Known edge cases documented and handled
- [ ] **Failure History**: No failures attributed to this pattern
- [ ] **Time Stability**: Pattern hasn't needed revision recently
- [ ] **Independent Validation**: Confirmed by multiple sessions/users

**Current Confidence Justification:**
[Why is this pattern at its current confidence level?]

---

## Known Edge Cases

**[Edge Case 1]**:
- Condition: [When this occurs]
- Handling: [How to deal with it]

**[Edge Case 2]**:
- Condition: [When this occurs]
- Handling: [How to deal with it]

---

## Common Pitfalls

**[Pitfall 1]**:
- Problem: [What can go wrong]
- Solution: [How to avoid/fix]

**[Pitfall 2]**:
- Problem: [What can go wrong]
- Solution: [How to avoid/fix]

---

## Related Patterns

### Similar Patterns (L0)

- [Pattern name]: `docs/memories/[file].md` - [How it relates]

### Promoted From (L1)

- [Pattern name]: `WORKSPACE_RULES.md` → [section] - [Quick reference]

### Detailed Documentation (L2)

- [SOP name]: `docs/sops/[file].md` - [Full procedure]

### Examples (L3)

- [Case study]: `docs/case-studies/[file].md` - [Complete example]

---

## Usage History

**Use 1**: YYYY-MM-DD
- Context: [Where/how used]
- Result: ✅ Success | 🔄 Needed revision
- Notes: [Any observations]

**Use 2**: YYYY-MM-DD
- Context: [Where/how used]
- Result: ✅ Success | 🔄 Needed revision
- Notes: [Any observations]
- **Action**: Pattern validated, promoted to L1

[Continue for additional uses...]

---

## Performance Notes

**Measured Impact**:
- [Metric 1]: [Value/improvement]
- [Metric 2]: [Value/improvement]

**Optimization Opportunities**:
- [Potential improvement 1]
- [Potential improvement 2]

---

## Changelog

**YYYY-MM-DD**: Created (use_count: 1, status: CANDIDATE, confidence: LOW)  
**YYYY-MM-DD**: Validated after testing (status: VALIDATED, confidence: MEDIUM)  
**YYYY-MM-DD**: Used 2nd time, promoted to L1 (status: PROMOTED, confidence: HIGH)  
**YYYY-MM-DD**: Updated based on new edge case discovered (confidence adjusted)

---

## ⏳ Retention Gate Configuration (MIRAS-Validated)
*Configure how this memory should persist over time*

**Retention Formula:** `retention_score = use_count × confidence_weight × surprise_value × recency`

| Factor | Value | Weight |
|--------|-------|--------|
| Use Count | [X] | × 1.0 |
| Confidence | [HIGH=3/MEDIUM=2/LOW=1] | × 1.5 |
| Surprise | [⭐-⭐⭐⭐⭐⭐ = 1-5] | × 1.2 |
| Recency | [Days since last use] | decay 0.98^days |

**Decay Configuration:**
- [ ] **PERMANENT** - Core pattern, never decay (L1 candidates)
- [ ] **SLOW DECAY** - Valuable pattern, extended retention
- [ ] **STANDARD DECAY** - Normal L0 lifecycle
- [ ] **FAST DECAY** - Context-specific, allow natural fade

---

**Created By**: [Person/Team]  
**Last Updated**: YYYY-MM-DD  
**Next Review**: YYYY-MM-DD (if CANDIDATE) | As needed (if VALIDATED/PROMOTED)

---

## Template Instructions (Remove This Section)

**To Create Memory from Template**:

1. **Copy to**: 
   - Windsurf: Create in native memory system
   - Cursor/Generic: `docs/memories/[pattern-name].md`

2. **Fill in all sections** with actual pattern details

3. **Set initial values**:
   - Status: ⏳ CANDIDATE
   - Use Count: 1
   - First Used: Today's date
   - Last Used: Today's date

4. **Tag appropriately**: Use consistent tags for retrieval
   - Technology: javascript, python, react, etc.
   - Category: api, testing, performance, etc.
   - Type: pattern, optimization, workaround, etc.

5. **Update after each use**:
   - Increment use_count
   - Update last_used date
   - Add to usage history
   - Change status if validated

6. **Promote when ready**:
   - Use count ≥2: Add to WORKSPACE_RULES.md (L1)
   - Use count ≥5: Create SOP if complex (L2)
   - Mark as PROMOTED, link to new location

**This is Layer 0 (L0)** - Dynamic memories that prove utility through repeated use before promoting to permanent documentation.
