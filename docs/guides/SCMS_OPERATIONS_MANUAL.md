# 📘 SCMS Operations Manual

**Version:** 1.0  
**Scope:** Daily Operations & System Maintenance  
**Target Audience:** AI Agents & Developers

---

## 🔄 The Optimization Loop

SCMS operates on a continuous loop of **Retrieval → Execution → Capture → Validation**.

```mermaid
graph TD
    A[Session Start] -->|Retrieve L0/L1| B[Execution]
    B -->|Detect Patterns| C[Capture Memory]
    C -->|Log Failures| D[Validation (L2)]
    D -->|Promote Patterns| E[Standardization (L3)]
    E -->|Update Rules| F[Session Closure (L5)]
    F --> A
```

---

## 1️⃣ Session Start (L0 Retrieval)
**Goal:** Load context to prevent regression.

1. **Check `MEMORY_STATUS_DASHBOARD.md`**
   - Identify active patterns
   - Check "Focus Areas"
   
2. **Review `WORKSPACE_RULES.md` (L1)**
   - Mandatory quality gates
   - Hard constraints

3. **Start Session Tracking**
   - Click "Start Session" in Dashboard
   - Sets timestamp ID

---

## 2️⃣ Execution & Pattern Capture (L0)
**Goal:** Do work while listening for signals.

- **Success:** "This worked well." -> Create Memory (L0)
- **Failure:** "This broke." -> Log to `FAILURES.md` (L2)
- **Surprise:** "Didn't expect that." -> Document Anomaly

**Trigger:** ANY deviation from expected behavior is a signal.

---

## 3️⃣ Failure Analysis (L2)
**Goal:** Turn errors into assets.

**When to Log:**
- Code breaks after "fix"
- Tool misuse (JSON errors)
- Assumption violations

**How to Log:**
- Use `docs/templates/FAILURE_LOG_TEMPLATE.md`
- **5 Whys** are mandatory
- **Prevention Strategy** must be actionable (e.g., "Add L1 Rule")

---

## 4️⃣ Pattern Promotion (L3)
**Goal:** Standardize success.

**Threshold:** n ≥ 2 (Natural Reuse)

**Process:**
1. Identify L0 memory used twice
2. Fill `docs/templates/PATTERN_PROMOTION_TEMPLATE.md`
3. Verify "Critical Rules"
4. Add to `WORKSPACE_RULES.md`
5. Update `MEMORY_STATUS_DASHBOARD.md` (Promoted section)

---

## 5️⃣ Economic Tracking (L4)
**Goal:** Measure value.

**Workflow:**
1. Click "Export Data" in Dashboard
2. Paste prompt into Windsurf
3. AI creates checkpoint file
4. Dashboard calculates ROI/Savings

**Metrics:**
- **Tokens Saved:** vs Baseline (estimated)
- **Reuse Rate:** % of code from patterns

---

## 6️⃣ Session Closure (L5)
**Goal:** Verify system integrity.

**Checklist:**
1. **Pattern Reflection:** Failures logged?
2. **Pipeline Update:** Promotions handled?
3. **Dashboard Sync:** Data matches reality?
4. **System Health:** Tests pass?

**Artifact:**
- Generate `docs/scms/SESSION_LOG_L5.md` using `SESSION_CLOSURE_REPORT_TEMPLATE.md`

---

## 🚨 Emergency Procedures

**If System Degrades (Context Loss):**
1. Stop coding
2. Read `WORKSPACE_RULES.md` top-to-bottom
3. Review last 3 `FAILURES.md` logs
4. Restart session explicitly

**If Dashboard Desyncs:**
1. Check `economics-dashboard-data.json` syntax
2. Verify CheckpointMonitor is running
3. Export fresh data to force update
