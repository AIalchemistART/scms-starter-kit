# Baseline Tracking Prompt

**Purpose:** Extract economic data from the Baseline Agent without contaminating it with SCMS patterns.
**Usage:** Paste this prompt into the Baseline Agent's chat at the end of every Phase or Prompt Block (e.g., after Prompt 10).

---

### 📋 Copy This Prompt:

```markdown
SYSTEM_AUDIT_REQUEST:
Please report the current session statistics AND track them in a standalone file.

1. **Token Usage:**
   - Check the context window or usage logs.
   - Output format: "Token usage: [Used]/[Total]" (e.g., 15000/200000)

2. **Cost Estimate:**
   - Calculate based on:
   - Input: $3.00 / 1M tokens
   - Output: $15.00 / 1M tokens
   - Output format: "Current Cost: $[Amount]"

3. **File Impact:**
   - List files modified in this step.
   - Count total lines of code (LOC) in the project (approx).

4. **Track in File:**
   - Append this checkpoint to: `docs/testing/baseline-tracking.md`
   - Format:
     ```
     ## Checkpoint [X] - [Date/Time]
     Token usage: [Used]/[Context]
     Current Cost: $[Cost]
     Files modified: [Number]
     Project LOC: [Number]
     ```

**REQUIRED OUTPUT FORMAT (Plain Text):**
Token usage: [Used]/[Context]
Current Cost: $[Cost]
Files modified: [Number]
Project LOC: [Number]

**THEN:** Append this data to `docs/testing/baseline-tracking.md` with checkpoint header.
```

---

### ❓ How to Use Data
1. **Agent tracks automatically** - Data is appended to `docs/testing/baseline-tracking.md`.
2. **Manual backup (optional)** - You can also save output to `checkpoints/baseline/checkpoint-prompt-X.txt`.
3. **Compare** - Use `baseline-tracking.md` to compare against SCMS metrics at matching checkpoints.
