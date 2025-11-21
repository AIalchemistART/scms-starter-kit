# Failure Pattern Analysis Template

**Prompt Batch**: P[XX]-P[XX]  
**Date**: YYYY-MM-DD  
**Environment**: [SCMS / Baseline]  
**Analyst**: [Your Name]

---

## 📋 Executive Summary

**Total Iterations to Pass All Tests**: [Number]  
**Total Time**: [Duration]  
**Failure Severity**: [Low / Medium / High]  
**Pattern Classification**: [See categories below]

**One-Line Assessment**: [Brief summary of what went wrong]

---

## 🔍 Failure Catalog

List each failure/iteration with details:

### Iteration 1: [Brief Description]

**Test Output Excerpt**:
```
[Paste relevant error messages]
```

**Failure Category**: [Select from categories below]
- [ ] Schema Mismatch (DB structure vs code expectations)
- [ ] API Contract Violation (endpoint behavior mismatch)
- [ ] Integration Error (components don't connect properly)
- [ ] Logic Error (incorrect business logic)
- [ ] Edge Case (unhandled scenario)
- [ ] Configuration Issue (setup/environment)
- [ ] Dependency Problem (missing package, wrong version)
- [ ] Type Error (TypeScript/type system)
- [ ] Test Infrastructure (test setup itself broken)
- [ ] Other: [Specify]

**Root Cause**: [What caused this failure?]

**Fix Applied**: [What was done to resolve?]

**Fix Complexity**: [Trivial / Simple / Moderate / Complex / Very Complex]

---

### Iteration 2: [Brief Description]

[Repeat same structure for each iteration...]

---

## 📊 Pattern Analysis

### Failure Type Distribution

| Category | Count | % of Total |
|----------|-------|------------|
| Schema Mismatch | X | XX% |
| API Contract | X | XX% |
| Integration | X | XX% |
| Logic Error | X | XX% |
| Edge Case | X | XX% |
| Configuration | X | XX% |
| Other | X | XX% |
| **TOTAL** | **X** | **100%** |

### Fix Complexity Distribution

| Complexity | Count | Notes |
|------------|-------|-------|
| Trivial (1-line fix) | X | [Examples] |
| Simple (< 10 lines) | X | [Examples] |
| Moderate (10-50 lines) | X | [Examples] |
| Complex (50+ lines or architectural) | X | [Examples] |

---

## 🎯 Failure Classification

**Primary Pattern**: [Select ONE that best describes overall struggle]

### A. **Foundation Gaps**
- Missing core functionality
- Features not implemented
- API endpoints incomplete
- Database schema incomplete
- Components don't exist

**Indicators**: "Cannot find...", "undefined is not...", "Missing implementation"

---

### B. **Integration Breakdown**
- Components exist but don't connect
- Contracts mismatched between layers
- Data flow broken
- Authentication not propagated
- State not synchronized

**Indicators**: "Expected X, got Y", "401 Unauthorized", "Null reference"

---

### C. **Edge Case Handling**
- Core functionality works
- Failures on boundary conditions
- Missing validation
- Unhandled error states
- Race conditions

**Indicators**: "Should handle empty...", "Should reject invalid...", "Timeout"

---

### D. **Configuration/Setup Issues**
- Test environment problems
- Dependencies missing/wrong
- Database not initialized
- Mocks not configured
- Path/environment issues

**Indicators**: "Cannot find module...", "Connection refused", "ENOENT"

---

### E. **Quality/Thoroughness Gaps**
- Rushed implementation
- Incomplete test coverage
- Copy-paste errors
- Inconsistent patterns
- Missing error handling

**Indicators**: Mix of trivial fixes, inconsistent naming, duplicate code

---

## 💡 Insight Analysis

### What This Reveals About the Codebase:

**Foundation Quality**: [Solid / Mixed / Weak]
- Evidence: [Cite specific failures]

**Integration Maturity**: [Well-integrated / Partially-integrated / Fragmented]
- Evidence: [Cite specific failures]

**Systems Thinking**: [Strong / Moderate / Weak]
- Evidence: [Did agent anticipate connections?]

**Code Quality**: [High / Medium / Low]
- Evidence: [Consistency, patterns, error handling]

---

## 🔬 Comparative Hypothesis Support

**Does this support "Systems Thinking vs Task-Focused" hypothesis?**

- [ ] **YES - Systems Thinking Pattern**: Failures mostly integration/edge-cases, indicating complex but connected system
- [ ] **YES - Task-Focused Pattern**: Failures mostly foundation gaps, indicating disconnected pieces
- [ ] **NO - Inconclusive**: Mixed pattern, no clear signal
- [ ] **NO - Different Pattern**: [Describe alternative]

**Evidence**: [Explain your reasoning]

---

## 📈 Efficiency Metrics

**Total Lines of Code Changed Across All Iterations**: [Estimate]

**Failure Resolution Velocity**:
- Iterations 1-3: [Fast / Medium / Slow]
- Iterations 4-6: [Fast / Medium / Slow]
- Iterations 7+: [Fast / Medium / Slow]

**Did agent learn during session?**
- [ ] YES - Later fixes faster/better
- [ ] NO - Struggled consistently
- [ ] UNCLEAR

**Most Costly Failure** (time/effort): [Iteration X - Brief description]

---

## 🎓 Lessons Learned

### Agent Strengths Demonstrated:
1. [What did they do well?]
2. [What recovered quickly?]

### Agent Weaknesses Revealed:
1. [What did they struggle with?]
2. [What took longest to fix?]

### Surprising Findings:
- [Anything unexpected?]

---

## 🔄 Recommendations

### For Future Prompts:
- [ ] [Specific suggestion based on patterns]
- [ ] [Adjustment to prompt strategy]

### For Analysis:
- [ ] [What to watch for in next batch]
- [ ] [Metrics to track]

### For Documentation:
- [ ] [What should be added to WORKSPACE_RULES?]
- [ ] [What should be logged in FAILURES.md?]

---

## 📎 Attachments

**Full Terminal Output**: [Link or reference]

**Code Diff Summary**: [If available]

**Related Artifacts**:
- [ ] Link to agent transcript
- [ ] Link to final working code
- [ ] Link to test output logs

---

## ✅ Validation Checklist

- [ ] All failures cataloged
- [ ] Failure types classified
- [ ] Pattern identified
- [ ] Comparative hypothesis assessed
- [ ] Insights documented
- [ ] Recommendations made
- [ ] Evidence cited for claims

---

**Template Version**: 1.0  
**Created**: 2024-11-21  
**Purpose**: Systematic analysis of test failure patterns to understand codebase quality and agent capabilities
