# Failure Log (L2)

**Purpose**: Document failures with root cause analysis for pattern extraction.  
**Project**: SCMS Starter Kit  
**Last Updated**: 2025-11-28

---

## 📊 Summary

| Total Failures | Resolved | Patterns Promoted |
|----------------|----------|-------------------|
| 1 | 1 | 1 |

---

## 🚨 Active Failures

*No active failures*

---

## ✅ Resolved Failures

---

## 🚨 FAIL-20251128-001: TaskFlow Pro Contamination in Starter Kit

**ID**: FAIL-20251128-001  
**Date**: 2025-11-28  
**Severity**: Major  
**Status**: ✅ Resolved  
**Tags**: #contamination #documentation #project-isolation

---

### What Happened
Project-specific content from the TaskFlow Pro comparative analysis test leaked into the SCMS starter kit's operational files (`docs/scms/`). The starter kit should contain only generic templates, but was populated with TaskFlow Pro patterns, failures, and session logs.

### Expected vs Actual
- **Expected**: `docs/scms/` contains generic `[Project Name]` placeholder templates
- **Actual**: Files contained 451 lines of TaskFlow Pro-specific patterns, 16KB of test failures, session logs with project-specific data

### 5 Whys Analysis

1. **Why did TaskFlow Pro content appear in the starter kit?**
   → The starter kit was used as a working SCMS instance during TaskFlow Pro testing

2. **Why was the starter kit used as a working instance?**
   → Convenience - it was already set up with SCMS structure

3. **Why wasn't a separate project used for testing?**
   → No clear separation between "template distribution" and "working instance" roles

4. **Why wasn't there clear separation?**
   → The starter kit serves dual purposes: (1) template source, (2) dogfood example

5. **Why wasn't this anticipated?**
   → **ROOT CAUSE**: Missing project isolation principle - template repos must remain generic

### Prevention Pattern

**Pattern Name**: Template Repository Isolation

**Rule**:
> Template/starter kit repositories must NEVER be used as working project instances. Clone to a separate location for actual project work.

**When to Apply**:
- Setting up SCMS for a new project
- Testing SCMS features with real work
- Any scenario where project-specific content would be generated

### Resolution

- **Fix Applied**: Reset all `docs/scms/` files to generic templates
- **Files Reset**: WORKSPACE_RULES.md, INDEX.md, FAILURES.md, MEMORY_STATUS_DASHBOARD.md, SESSION_LOG_L5.md
- **Pattern Promoted**: Yes - "Template Repository Isolation" added to L1

---

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
| Major | 1 | 100% |
| Minor | 0 | 0% |

**Patterns Promoted from Failures**: 1

---

**Remember**: Failures are the highest-ROI documentation. They contain 3-10× more information than successes!
