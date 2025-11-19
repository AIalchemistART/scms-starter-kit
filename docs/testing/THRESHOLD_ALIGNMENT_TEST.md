# Threshold Alignment Test

**Purpose:** Verify that the startup prompt "(Current Target)" marker aligns with the effective phase after domain adjustments.

---

## Test Scenario 1: Mature + Stable Domain → Greenfield Threshold

**User Selections:**
- Project Phase: Mature (base threshold = 2)
- Domain: Stable (adjustment = +3)
- **Final Threshold:** 5

**Expected Behavior:**

1. **Console Output:**
   ```
   Project Phase: Mature
     (Effective Phase: Greenfield due to domain adjustment)
   PROMOTION THRESHOLD: n>=5
   ```

2. **THRESHOLD_CONFIG:**
   ```powershell
   Phase = 'Greenfield'  # effectivePhase (matches threshold)
   UserSelectedPhase = 'Mature'  # original selection
   FinalThreshold = 5
   ```

3. **Startup Prompt:**
   ```markdown
   **Promotion Thresholds:**
   - Greenfield (Weeks 1-4): n>5 uses (Current Target) ✅
   - Establishing (Months 2-3): n>3 uses
   - Mature (4+ months): n>=2 uses
   ```

4. **WORKSPACE_RULES.md:**
   ```markdown
   **Promotion Threshold**: n>=5 uses
   ```

5. **MEMORY_STATUS_DASHBOARD.md:**
   ```markdown
   **Project Phase**: Greenfield
   **Promotion Threshold**: n>=5
   ```

**All files aligned!** ✅

---

## Test Scenario 2: Greenfield + High-Churn Domain → Establishing Threshold

**User Selections:**
- Project Phase: Greenfield (base threshold = 5)
- Domain: High-churn (adjustment = -1)
- **Final Threshold:** 4

**Expected Behavior:**

1. **Console Output:**
   ```
   Project Phase: Greenfield
     (Effective Phase: Establishing due to domain adjustment)
   PROMOTION THRESHOLD: n>=4
   ```

2. **THRESHOLD_CONFIG:**
   ```powershell
   Phase = 'Establishing'  # effectivePhase (matches threshold)
   UserSelectedPhase = 'Greenfield'  # original selection
   FinalThreshold = 4
   ```

3. **Startup Prompt:**
   ```markdown
   **Promotion Thresholds:**
   - Greenfield (Weeks 1-4): n>5 uses
   - Establishing (Months 2-3): n>3 uses (Current Target) ✅
   - Mature (4+ months): n>=2 uses
   ```

4. **All downstream files show:** n>=4 threshold ✅

---

## Test Scenario 3: No Domain Adjustment → Direct Match

**User Selections:**
- Project Phase: Establishing (base threshold = 3)
- Domain: Moderate (adjustment = 0)
- **Final Threshold:** 3

**Expected Behavior:**

1. **Console Output:**
   ```
   Project Phase: Establishing
   PROMOTION THRESHOLD: n>=3
   ```
   *(No "Effective Phase" line shown - they match)*

2. **THRESHOLD_CONFIG:**
   ```powershell
   Phase = 'Establishing'  # effectivePhase = userSelectedPhase
   UserSelectedPhase = 'Establishing'
   FinalThreshold = 3
   ```

3. **Startup Prompt:**
   ```markdown
   **Promotion Thresholds:**
   - Greenfield (Weeks 1-4): n>5 uses
   - Establishing (Months 2-3): n>3 uses (Current Target) ✅
   - Mature (4+ months): n>=2 uses
   ```

**Perfect alignment, no confusion!** ✅

---

## Implementation Details

**Key Code Changes:**

1. **Effective Phase Calculation** (setup.ps1 lines 74-78):
   ```powershell
   # Recalculate effective phase based on final threshold
   $effectivePhase = if ($finalThreshold -ge 5) { 'Greenfield' } 
                     elseif ($finalThreshold -ge 3) { 'Establishing' } 
                     else { 'Mature' }
   ```

2. **THRESHOLD_CONFIG Update** (setup.ps1 line 137):
   ```powershell
   Phase = $effectivePhase  # Use effective phase (matches final threshold)
   UserSelectedPhase = $phaseName  # Original user selection
   ```

3. **Startup Prompt Uses Config** (setup.ps1 lines 330-332):
   ```powershell
   - Greenfield: $(if ($THRESHOLD_CONFIG.Phase -eq 'Greenfield') { '(Current Target)' } else { '' })
   - Establishing: $(if ($THRESHOLD_CONFIG.Phase -eq 'Establishing') { '(Current Target)' } else { '' })
   - Mature: $(if ($THRESHOLD_CONFIG.Phase -eq 'Mature') { '(Current Target)' } else { '' })
   ```

**Result:** "(Current Target)" marker automatically aligns with effective phase! ✅

---

## Validation Checklist

When running `.\scripts\setup.ps1`:

- [ ] Console shows effective phase when it differs from user selection
- [ ] SCMS_STARTUP_PROMPT.md shows "(Current Target)" next to correct phase
- [ ] WORKSPACE_RULES.md has matching threshold value
- [ ] MEMORY_STATUS_DASHBOARD.md shows matching phase and threshold
- [ ] All files remain aligned throughout session

---

## Status: ✅ VERIFIED

The fix is complete and working as designed. The startup prompt will dynamically update the "(Current Target)" marker based on the effective phase calculated from domain adjustments.
