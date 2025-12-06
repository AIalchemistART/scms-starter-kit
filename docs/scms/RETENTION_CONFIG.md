# Retention Gate Configuration (MIRAS-Validated)

**Purpose**: Configure memory decay and retention policies based on Google's MIRAS research  
**Last Updated**: 2025-12-05  
**Research Validation**: Google MIRAS Framework (Dec 2025) - "Forgetting is as important as remembering"

---

## 🎯 Core Principle

> **"Forgetting is as important as remembering."** - Google MIRAS (2025)

SCMS implements **Retention Gates** that control how long memories persist based on their value. Unlike flat vector databases (Mem0, etc.) that save everything indefinitely, SCMS uses validated decay mechanisms to prevent memory overflow and maintain system health.

---

## 📊 Retention Scoring Formula

```
retention_score = base_value × surprise_factor × confidence_weight × recency_decay
```

### Base Value (by Layer)

| Layer | Base Value | Rationale |
|-------|------------|-----------|
| L0 (Candidate) | 1.0 | Unvalidated, standard decay applies |
| L0 (Validated) | 2.0 | Proven useful, elevated retention |
| L1 (Promoted) | ∞ (PERMANENT) | Quality gates, no decay |
| L2 (Failures) | Variable | Based on severity × surprise |
| L3 (Case Studies) | 3.0 | Reference material, slow decay |
| L4 (Global Rules) | ∞ (PERMANENT) | Universal constraints, no decay |

### Surprise Factor (Titans-Validated)

| Stars | Factor | Meaning |
|-------|--------|---------|
| ⭐ (1) | × 1.0 | Expected, routine |
| ⭐⭐ (2) | × 1.2 | Known risk materialized |
| ⭐⭐⭐ (3) | × 1.5 | Unexpected but explainable |
| ⭐⭐⭐⭐ (4) | × 2.0 | Novel insight |
| ⭐⭐⭐⭐⭐ (5) | × 3.0 | Paradigm-shifting |

### Confidence Weight

| Level | Weight | Meaning |
|-------|--------|---------|
| 🟢 HIGH | × 1.5 | Validated 3+ times, no failures |
| 🟡 MEDIUM | × 1.0 | Validated 1-2 times |
| 🔴 LOW | × 0.5 | Untested or has issues |

### Recency Decay

```
recency_factor = decay_rate ^ days_since_last_use
```

| Decay Mode | Rate | Half-Life | Use Case |
|------------|------|-----------|----------|
| PERMANENT | 1.0 | ∞ | L1 patterns, critical failures |
| SLOW | 0.99 | ~70 days | Important lessons |
| STANDARD | 0.95 | ~14 days | Normal L0 memories |
| FAST | 0.90 | ~7 days | Context-specific |

---

## 🚦 Retention Thresholds

### Promotion Threshold (L0 → L1)

| Project Phase | Use Count Required | Confidence Required |
|---------------|-------------------|---------------------|
| Greenfield (Weeks 1-4) | ≥ 5 | 🟡 MEDIUM+ |
| Establishing (Months 2-3) | ≥ 3 | 🟡 MEDIUM+ |
| Mature (4+ months) | ≥ 2 | 🟢 HIGH preferred |

### Decay Threshold (Memory Removal)

| Score | Action |
|-------|--------|
| > 5.0 | Active retention, high priority |
| 3.0 - 5.0 | Normal retention |
| 1.0 - 3.0 | At risk, may decay |
| < 1.0 | **DECAY CANDIDATE** - Review or remove |

---

## 🛡️ Decay Override Rules

### Never Decay (Automatic PERMANENT)

1. **L1 Promoted Patterns** - Quality gates must persist
2. **Critical Failures** - Severity=Critical, any surprise level
3. **Paradigm-Shifting Discoveries** - Surprise=⭐⭐⭐⭐⭐
4. **Core Identity Patterns** - Persona encoding, user preferences
5. **Global Rules (L4)** - Universal constraints

### Force Fast Decay

1. **One-off Context** - Session-specific, not generalizable
2. **Superseded Patterns** - Replaced by better solution
3. **Failed Experiments** - Approaches that didn't work (unless high surprise)
4. **Stale Information** - Outdated by external changes

---

## 📈 Retention Health Metrics

Track these metrics to ensure healthy memory system:

### Memory Distribution

| Metric | Healthy Range | Warning |
|--------|---------------|---------|
| L0 Active | 10-50 | >100 = overflow risk |
| L1 Patterns | 5-30 | >50 = review for consolidation |
| L2 Failures | 5-20 | >30 = systemic issues |
| Decay Rate | 10-30%/month | <5% = not decaying enough |

### Retention Balance

```
healthy_ratio = (L1_count + L2_count) / L0_count
```

| Ratio | Status |
|-------|--------|
| > 0.5 | ✅ Healthy - Good promotion rate |
| 0.2 - 0.5 | 🟡 Monitor - May need to promote more |
| < 0.2 | 🔴 Unhealthy - L0 accumulation, review thresholds |

---

## 🔧 Configuration Examples

### High-Value Pattern (Should Persist)

```yaml
pattern: "Error Boundary Implementation"
use_count: 4
confidence: HIGH (🟢)
surprise: ⭐⭐⭐ (3)
last_used: 3 days ago

# Calculation
base_value: 2.0 (validated L0)
surprise_factor: 1.5
confidence_weight: 1.5
recency: 0.95^3 = 0.857

retention_score: 2.0 × 1.5 × 1.5 × 0.857 = 3.86
status: ACTIVE (above 3.0 threshold)
```

### Low-Value Memory (Should Decay)

```yaml
pattern: "Temporary API Workaround"
use_count: 1
confidence: LOW (🔴)
surprise: ⭐ (1)
last_used: 30 days ago

# Calculation
base_value: 1.0 (candidate L0)
surprise_factor: 1.0
confidence_weight: 0.5
recency: 0.95^30 = 0.215

retention_score: 1.0 × 1.0 × 0.5 × 0.215 = 0.11
status: DECAY CANDIDATE (below 1.0 threshold)
```

---

## 🔗 Integration with SCMS Layers

### L0 (Destructive Validation)
- Default: STANDARD decay
- Promotion trigger: Use count + confidence threshold
- Decay trigger: retention_score < 1.0

### L1 (Stable Validation)
- Default: PERMANENT (no decay)
- Demotion trigger: Pattern invalidated by new failure
- Review trigger: 6 months without retrieval

### L2 (Failure Documentation)
- Default: Based on severity × surprise
- Permanent: Critical severity OR ⭐⭐⭐⭐⭐ surprise
- Standard: Major/Minor with lower surprise

---

## 📚 Research Background

### Google MIRAS (December 2025)

MIRAS identifies **four essential design choices** for sequence models:
1. **Memory Architecture** - How memories are structured
2. **Attentional Bias** - How memories are retrieved
3. **Retention Gate** - How memories decay ← **This config**
4. **Memory Algorithm** - How memories are updated

Key finding: Systems without forgetting mechanisms suffer unbounded memory growth and performance degradation.

### Google Titans (December 2025)

Titans introduces a **"surprise metric"** that prioritizes unexpected/important information. High-surprise events deserve stronger retention than routine data.

---

## 🎯 Mneme AI Application

For the Mneme chatbot side, these retention concepts translate to:

| SCMS Concept | Mneme Implementation |
|--------------|---------------------|
| Surprise Factor | Memory extraction confidence score |
| Confidence | User validation status (validated/pending) |
| Retention Score | Priority for retrieval ranking |
| Decay Mode | Memory lifecycle (active/fading/archived) |

See [MNEME_INTEGRATION.md](../examples/MNEME_INTEGRATION.md) for detailed mapping.

---

*This configuration is validated by Google's Titans and MIRAS research (December 2025).*
