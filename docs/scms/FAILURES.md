# Failure Log (L2)

**Purpose**: Document failures with root cause analysis for pattern extraction.  
**Project**: [Project Name]  
**Last Updated**: [Date]

---

## 📊 Summary

| Total Failures | Resolved | Patterns Promoted |
|----------------|----------|-------------------|
| 0 | 0 | 0 |

---

## 🚨 Active Failures

*No failures logged yet - greenfield project*

---

## ✅ Resolved Failures

*No failures logged yet - greenfield project*

---

## 📝 Failure Entry Template

When documenting a failure, use this structure (or copy from `docs/templates/FAILURE_LOG_TEMPLATE.md`):

```markdown
---

## 🚨 FAIL-YYYYMMDD-XXX: [Brief Title]

**ID**: FAIL-YYYYMMDD-XXX  
**Date**: YYYY-MM-DD  
**Severity**: [Minor / Major / Critical]  
**Status**: [Active / Resolved]  
**Tags**: #[tag1] #[tag2]

---

### What Happened
[Describe the failure - what went wrong?]

### Expected vs Actual
- **Expected**: [What should have happened]
- **Actual**: [What actually happened]

### 5 Whys Analysis

1. **Why did [symptom] happen?**
   → [First-level cause]

2. **Why did [first-level cause] happen?**
   → [Second-level cause]

3. **Why did [second-level cause] happen?**
   → [Third-level cause]

4. **Why did [third-level cause] happen?**
   → [Fourth-level cause]

5. **Why did [fourth-level cause] happen?**
   → **ROOT CAUSE**: [Fundamental issue]

### Prevention Pattern

**Pattern Name**: [Name for the prevention pattern]

**Rule**:
> [Clear, actionable rule to prevent recurrence]

**When to Apply**:
- [Situation 1]
- [Situation 2]

### Resolution

- **Fix Applied**: [What was done to fix it]
- **Commit**: [commit hash if applicable]
- **Pattern Promoted**: [Yes/No - to L1 if applicable]

---
```

---

## 🔗 Related Documentation

- **Template**: `docs/templates/FAILURE_LOG_TEMPLATE.md`
- **Pattern Promotions**: `docs/scms/WORKSPACE_RULES.md`
- **Index**: `docs/scms/INDEX.md`

---

## 📈 Failure Metrics

| Severity | Count | % of Total |
|----------|-------|------------|
| Critical | 0 | 0% |
| Major | 0 | 0% |
| Minor | 0 | 0% |

**Patterns Promoted from Failures**: 0

---

**Remember**: Failures are the highest-ROI documentation. They contain 3-10× more information than successes!
