# Memory Status Dashboard

**Last Updated**: 2025-12-05  
**Project**: SCMS Starter Kit  
**SCMS Version**: 2.0 (Titans/MIRAS Enhanced)

---

## 📊 Pattern Promotion Configuration

### Promotion Threshold

**Current Phase**: Mature  
**Threshold**: n≥2 uses + 🟡 MEDIUM confidence minimum

| Phase | Timeline | Use Count | Confidence | Rationale |
|-------|----------|-----------|------------|-----------|
| Greenfield | Weeks 1-4 | n≥5 | 🟡 MEDIUM+ | Higher bar while learning codebase |
| Establishing | Months 2-3 | n≥3 | 🟡 MEDIUM+ | Balanced validation |
| Mature | 4+ months | n≥2 | 🟢 HIGH preferred | Efficient pattern capture |

> ⚠️ **READ-ONLY**: This file is configured by setup.ps1. Do not modify manually.

---

## ⏳ Retention Gate Configuration (MIRAS-Inspired)

**Decay Mode**: STANDARD (0.95^days)  
**Decay Threshold**: retention_score < 1.0  
**Review Cycle**: Monthly

| Layer | Default Decay | Override Conditions |
|-------|---------------|---------------------|
| L0 Candidate | STANDARD | FAST if one-off context |
| L0 Validated | SLOW | PERMANENT if ⭐⭐⭐⭐⭐ surprise |
| L1 Promoted | PERMANENT | Never decay |
| L2 Failures | Variable | PERMANENT if Critical + High Surprise |

> 📖 See [RETENTION_CONFIG.md](RETENTION_CONFIG.md) for full configuration details.

---

## 📈 L1 Patterns (WORKSPACE_RULES.md)

| Pattern | Date Promoted | Use Count | Confidence | Status |
|---------|---------------|-----------|------------|--------|
| Template Repository Isolation | 2025-11-28 | 2 | 🟢 HIGH | ✅ Active |
| X/LinkedIn Article Formatting | 2025-11-30 | 2 | 🟢 HIGH | ✅ Active |

**Total L1 Patterns**: 2

---

## 🚨 Failure Log Status (FAILURES.md)

| Failure ID | Date | Severity | Surprise | Retention | Status |
|------------|------|----------|----------|-----------|--------|
| FAIL-20251128-001 | 2025-11-28 | Major | ⭐⭐⭐ | HIGH | ✅ Resolved |
| FAIL-20251130-003 | 2025-11-30 | Major | ⭐⭐⭐⭐ | PERMANENT | ✅ Resolved |

**Total Failures Logged**: 2  
**Patterns Promoted from Failures**: 2  
**High-Surprise Failures (⭐⭐⭐+)**: 2

---

## 📊 Retention Health Metrics

### Memory Distribution

| Layer | Count | Healthy Range | Status |
|-------|-------|---------------|--------|
| L0 Active | 3 | 10-50 | ✅ Healthy |
| L1 Patterns | 2 | 5-30 | ✅ Healthy |
| L2 Failures | 5 | 5-20 | ✅ Healthy |

### Retention Balance

```
healthy_ratio = (L1 + L2) / L0 = (2 + 5) / 3 = 2.33
```

**Status**: ✅ Healthy (ratio > 0.5)

---

## 🗺️ Cross-References

### Failures → Patterns
- FAIL-20251128-001 → Template Repository Isolation (L1)
- FAIL-20251130-003 → Documentation Session Contamination Check (L1)

### Sessions → Documentation
- 2025-11-28: Template Cleanup + Memory System Evaluation
- 2025-11-30: Resonance Transfer Protocol + Integrity Cluster
- 2025-12-05: Titans/MIRAS Enhancement Integration

---

## 📈 Session Metrics

**Latest Session (2025-12-05)**:
- Enhancements Added: Surprise Metric, Confidence Indicators, Retention Gates
- Related Research: Google Titans + MIRAS (Dec 2025)
- Status: Phase 2 of 3 complete

**Previous Session (2025-11-30)**:
- Failures Logged: 2
- Patterns Promoted: 1
- Status: Contamination guard strengthened
