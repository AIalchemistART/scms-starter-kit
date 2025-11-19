# Baseline Tracking Prompt

**Purpose:** Extract economic data from the Baseline Agent without contaminating it with SCMS patterns.
**Usage:** Paste this prompt into the Baseline Agent's chat ONCE at the start of your test. The agent will then automatically track after each prompt & response.

---

### 📋 Copy This Prompt:

```markdown
SYSTEM_AUDIT_REQUEST:
Please begin tracking these metrics in a standalone file after each prompt & response.
Ensure you're figuring in the entire workflow from user prompt to summary - both input & output tokens.

1. **Token Usage:**
   - Count the ENTIRE workflow: user prompt → your response → summary
   - Include BOTH input tokens (user prompt + context) AND output tokens (your response)
   - Check the context window or usage logs
   - Output format: "Token usage: [Used]/[Total]" (e.g., 15000/200000)
   - Break down: "Input: [X] | Output: [Y] | Total: [Z]"

2. **Cost Estimate:**
   - Calculate based on FULL workflow (input + output):
     - Input: $3.00 / 1M tokens
     - Output: $15.00 / 1M tokens
   - Output format: "Current Cost: $[Amount]"

3. **File Impact:**
   - List files modified in this step
   - Count total lines of code (LOC) in the project (approx)

4. **Track in File:**
   - Append this checkpoint to: `docs/testing/baseline-tracking.md`
   - Do this AFTER EACH PROMPT & RESPONSE (not just milestones)
   - Format:
     ```
     ## Checkpoint [X] - [Date/Time]
     Token usage: [Used]/[Context]
     Input: [X] | Output: [Y] | Total: [Z]
     Current Cost: $[Cost]
     Files modified: [Number]
     Project LOC: [Number]
     ```

**REQUIRED OUTPUT FORMAT (Plain Text):**
Token usage: [Used]/[Context]
Input: [X] | Output: [Y] | Total: [Z]
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
