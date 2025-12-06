# 🚨 Failure Log: [Short Descriptive Title]

**ID:** FAIL-[YYYYMMDD]-[SEQ]  
**Date:** [YYYY-MM-DD]  
**Severity:** [Critical/Major/Minor/Cosmetic]  
**Surprise Factor:** [⭐⭐⭐⭐⭐] (1-5: How unexpected was this failure?)  
**Retention Priority:** [HIGH/MEDIUM/LOW] (Based on severity × surprise)  
**Episode:** [Link to related failure episode, if any]  
**System Component:** [e.g., Dashboard, CheckpointMonitor, Parser]  
**Impact:** [e.g., Data Loss, Feature Broken, UX Degradation]  
**Tags:** #[topic] #[category] (e.g., #tooling #renderer #physics)

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

## 🎯 Surprise Analysis (Titans-Validated)
*High-surprise failures contain more learning value and deserve stronger retention*

**Surprise Scoring Guide:**
| Score | Meaning | Retention Action |
|-------|---------|------------------|
| ⭐ (1) | Expected failure mode | Standard decay, low priority |
| ⭐⭐ (2) | Known risk that materialized | Normal retention |
| ⭐⭐⭐ (3) | Unexpected but explainable | Elevated retention, document root cause |
| ⭐⭐⭐⭐ (4) | Novel failure, new insight | High retention, create prevention pattern |
| ⭐⭐⭐⭐⭐ (5) | Paradigm-shifting discovery | Permanent retention, promote to L1 immediately |

**This Failure's Analysis:**
- **Why was this surprising?** [What assumptions were violated?]
- **What made it unexpected?** [Gap in mental model or documentation]
- **Novel insight gained:** [New understanding that didn't exist before]

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
- Episode Link: [MEMORY_EPISODES.md#episode-name]

---

## ⏳ Retention Gate Configuration (MIRAS-Validated)
*Configure how long this failure should persist in memory*

**Retention Formula:** `retention_score = severity_weight × surprise_factor × recency_bonus`

| Factor | Value | Weight |
|--------|-------|--------|
| Severity | [Critical=4/Major=3/Minor=2/Cosmetic=1] | × 1.0 |
| Surprise | [⭐-⭐⭐⭐⭐⭐ = 1-5] | × 1.5 |
| Recency | [Days since occurrence] | decay 0.95^days |

**Calculated Retention Priority:** [AUTO-CALCULATE or MANUAL]

**Decay Override:** 
- [ ] **NEVER DECAY** - Catastrophic failure, must persist permanently
- [ ] **SLOW DECAY** - Important lesson, extend retention 2x
- [ ] **STANDARD DECAY** - Normal L2 lifecycle
- [ ] **FAST DECAY** - Low-value, context-specific failure
