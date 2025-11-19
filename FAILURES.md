# Operational Failure Log
*Track all tool failures, mock errors, and regressions here.*

---

## Failure Log 2025-11-18 - Tool Safety Constraint (Write vs Edit)
**Severity**: Low
**Impact**: Blocked workflow, required retry.

### 5 Whys Root Cause Analysis
1. Why? `write_to_file` failed on `src/main.ts`.
2. Why? The file already existed.
3. Why? Tool safety protocol prevents overwriting existing files without explicit permission or correct tool usage.
4. Why? I chose `write_to_file` to replace the entire file content instead of `edit`.
5. Why? (Root) I optimized for speed (one-shot write) over safety (check existence/edit).

### Resolution
- Used `edit` tool to replace file content safely.

### Prevention (L2)
- Rule: ALWAYS use `edit` (or `delete` + `write`) for files that already exist.

## Failure Log 2025-11-18 - Duplicate Code Injection (main.ts)
**Severity**: Critical (Build Break)
**Impact**: Blocked compilation, required manual fix.

### 5 Whys Root Cause Analysis
1. Why? `tsc` reported "Cannot redeclare block-scoped variable".
2. Why? `main.ts` contained two copies of `SHIP_SRC` and `playerSprite`.
3. Why? My previous `edit` tool call used an `old_string` that matched, but I accidentally included the code *again* in `new_string` (or the tool appended it incorrectly).
4. Why? I tried to "insert" code by matching the surrounding context, but failed to account for what was already there vs what I was adding.
5. Why? (Root) I did not read the file immediately before editing to verify the exact context, relying on memory of previous state.

### Resolution
- Deleted duplicate lines.

### Prevention (L2)
- Constraint: READ file before EDIT if previous edits might have shifted context.
- Pattern: Use unique anchors for edits.


