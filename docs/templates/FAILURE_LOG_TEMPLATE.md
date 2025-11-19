# 🚨 Failure Log: [Short Descriptive Title]

**ID:** FAIL-[YYYYMMDD]-[SEQ]  
**Date:** [YYYY-MM-DD]  
**Severity:** [Critical/Major/Minor/Cosmetic]  
**System Component:** [e.g., Dashboard, CheckpointMonitor, Parser]  
**Impact:** [e.g., Data Loss, Feature Broken, UX Degradation]

---

## 📝 Failure Description
*What happened? Be specific and include context.*

**Context:**
- **User Action:** [What was the user doing?]
- **Expected Behavior:** [What should have happened?]
- **Actual Behavior:** [What actually happened?]
- **Error Message:** 
```
[Paste error log here]
```

---

## 🔍 Root Cause Analysis (5 Whys)
1. **Why?** [Answer]
2. **Why?** [Answer]
3. **Why?** [Answer]
4. **Why?** [Answer]
5. **Root Cause:** [The fundamental technical or process flaw]

---

## 🛠️ Resolution
*How was it fixed?*

**Immediate Fix:**
- [ ] Code Change
- [ ] Config Change
- [ ] Rollback
- [ ] Workaround

**Implementation Details:**
```javascript
// [Show the fix]
```

---

## 🧠 Pattern Recognition (L2 Analysis)
*Is this a recurring anti-pattern?*

- [ ] **One-off Incident:** Unique combination of factors
- [ ] **Emerging Pattern:** Seen 2-3 times (Monitor closely)
- [ ] **Established Anti-Pattern:** Seen 3+ times -> **Promote to WORKSPACE_RULES**

**Learning:**
*[What rule or check would prevent this?]*

---

## 🛡️ Prevention Strategy
*How do we ensure this never happens again?*

- [ ] **L1 Validation Gate:** Add check to `WORKSPACE_RULES.md`
- [ ] **Automated Test:** Add unit/integration test
- [ ] **Documentation:** Update SOP or Guide
- [ ] **Tooling:** Update linter or build script

**Action Items:**
1. [Action 1]
2. [Action 2]

---

## 🔗 Related Artifacts
- Memory ID: [UUID]
- Commit Hash: [Hash]
- Related Docs: [Link]
