# SCMS Operations Manual

This guide defines the standard operating procedures for the **Systematic Context Management System (SCMS)**.

---

## 🔄 The Optimization Loop

SCMS is not just file structure; it is a process. Every session must follow this loop:

1.  **Retrieval (L0/L1)**: Before acting, check `INDEX.md` and `MEMORY_STATUS_DASHBOARD.md`.
2.  **Execution**: Perform the task using `WORKSPACE_RULES.md` as constraints.
3.  **Capture (L0)**: Create Memories for new patterns.
4.  **Validation (L2/L5)**: At session end, audit and document.

---

## 🚨 L2: Failure Documentation (The "Black Box")

**When to use:**
Whenever the Agent makes a mistake (syntax error, logic bug, hallucination) or the User has to intervene manually.

**Procedure:**
1.  Copy `docs/templates/FAILURE_LOG_TEMPLATE.md`.
2.  Create a new entry in `docs/scms/FAILURES.md` (or a separate file in `docs/failures/`).
3.  **Analyze the Root Cause**.
4.  **Create a Rule**: If this failure happens twice, add a rule to `WORKSPACE_RULES.md` to prevent it.

*Goal: Turn every error into a permanent asset.*

---

## ✅ L5: Session Closure (The "Audit")

**When to use:**
At the end of every coding session, before the Agent signs off.

**Procedure:**
1.  Run the **Session Closure Prompt**.
2.  The Agent will fill out `docs/templates/SESSION_CLOSURE_REPORT_TEMPLATE.md`.
3.  Update `docs/economics-dashboard-data.json`.
4.  Verify all L0 memories are indexed.

*Goal: Ensure no "Context Debt" is left behind.*

---

## 📈 L3: Pattern Promotion

**Threshold:**
-   **1 Use**: L0 Memory (Candidate).
-   **2 Uses**: L1 Pattern (Validated) -> Add to `WORKSPACE_RULES.md`.
-   **5 Uses**: L2 Standard (Global) -> Add to `GLOBAL_CODING_RULES.md`.

**Procedure:**
1.  Check `MEMORY_STATUS_DASHBOARD.md` for "Candidate" memories.
2.  If used > 2 times, extract the generic pattern.
3.  Add to the appropriate Rules file.
4.  Archive the L0 memory (optional).

---

## 📂 Standard Directory Structure

```text
docs/
├── scms/
│   ├── MEMORY_STATUS_DASHBOARD.md  # Active memory state
│   ├── FAILURES.md                 # L2 Failure Log
│   └── SESSION_LOGS/               # L5 Closure Reports
├── templates/
│   ├── MEMORY_TEMPLATE.md
│   ├── FAILURE_LOG_TEMPLATE.md
│   └── SESSION_CLOSURE_REPORT_TEMPLATE.md
└── guides/
    └── SCMS_OPERATIONS_MANUAL.md   # This file
```
