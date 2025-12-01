# Terminology Correction Template

> **Purpose**: Lightweight template for documenting conceptual/terminology corrections  
> **When to Use**: When a definition or term was misused (not an implementation failure)  
> **Destination**: FAILURES.md (with cross-ref to INTEGRITY_CLUSTER.md)

---

## Template

```markdown
## 🔧 CORRECTION-YYYYMMDD-XXX: [Brief Description]

**ID**: CORRECTION-YYYYMMDD-XXX  
**Date**: YYYY-MM-DD  
**Severity**: Minor  
**Status**: ✅ Resolved  
**Tags**: #terminology #[topic]

---

### What Was Incorrect
[Describe the incorrect usage or definition]

### Correct Definition
[State the correct definition clearly]

### Why It Matters
[Explain the conceptual significance of this distinction]

### Anti-Pattern
- Don't: [What to avoid]
- Do: [What to do instead]

### Added to Integrity Cluster
✅ Yes - See [INTEGRITY_CLUSTER.md](../scms/INTEGRITY_CLUSTER.md)

---
```

---

## Example

```markdown
## 🔧 CORRECTION-20251130-001: SCMS Acronym

**ID**: CORRECTION-20251130-001  
**Date**: 2025-11-30  
**Severity**: Minor  
**Status**: ✅ Resolved  
**Tags**: #terminology #scms-definition

---

### What Was Incorrect
SCMS stated as "Sparse Contextual Memory **System**"

### Correct Definition
SCMS = Sparse Contextual Memory **Scaffolding**

### Why It Matters
- "Scaffolding" emphasizes structure, support, and architecture
- "System" implies mechanism and process
- The distinction affects how users conceptualize the framework

### Anti-Pattern
- Don't: Assume common acronym suffixes (DBMS, CMS → "System")
- Do: Verify core terminology before teaching or summarizing

### Added to Integrity Cluster
✅ Yes - See INTEGRITY_CLUSTER.md

---
```

---

## When to Use This vs Full 5-Whys

| Situation | Template |
|-----------|----------|
| Implementation bug | FAILURE_LOG_TEMPLATE.md (full 5-Whys) |
| Architecture decision failure | FAILURE_LOG_TEMPLATE.md (full 5-Whys) |
| Terminology/definition error | **This template** (lightweight) |
| Conceptual misunderstanding | **This template** (lightweight) |
| Process failure | FAILURE_LOG_TEMPLATE.md (full 5-Whys) |

---

## Self-Healing Integration

After logging a terminology correction:

1. ✅ Add entry to FAILURES.md using this template
2. ✅ Update INTEGRITY_CLUSTER.md with correct definition
3. ✅ Add topic tag to INDEX.md
4. ✅ System now "knows" the correct definition

This completes the Self-Healing Cognition loop:
```
L2 (Detect) → Integrity Cluster (Stabilize) → Future Alignment (Heal)
```
