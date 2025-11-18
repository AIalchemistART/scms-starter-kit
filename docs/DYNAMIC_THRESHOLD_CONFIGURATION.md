# 🎯 Dynamic Threshold Configuration

**How the dashboard adapts to YOUR project's threshold**

---

## ✅ **What's New**

The dashboard now **dynamically displays** your project's configured threshold instead of always showing `n≥2`.

### **Before:**
```
Dashboard always showed: "Retrieved pattern (n=X/2)"
Even if your project used n≥5!
```

### **After:**
```
Greenfield project: "Retrieved pattern (n=X/5)" ✅
Mature project: "Retrieved pattern (n=X/2)" ✅
Dashboard shows YOUR actual threshold!
```

---

## 🔧 **How It Works**

### **1. Setup Script Calculates Threshold**

When you run the setup script, it asks:

```powershell
Project Phase:
[1] Greenfield (Weeks 1-4) - Threshold: n>=5
[2] Establishing (Months 2-3) - Threshold: n>=3
[3] Mature (4+ months) - Threshold: n>=2

Team Size:
[1] Solo (1 developer) - n_unique>=1
[2] Small (2-5 developers) - n_unique>=2
[3] Medium (6-15 developers) - n_unique>=3
[4] Large (16+ developers) - n_unique>=4

Domain:
[1] High-churn (web, mobile) - threshold minus 1
[2] Moderate (general) - no adjustment
[3] Stable (embedded, scientific) - threshold plus 1
```

**Calculation:**
```
finalThreshold = max(2, baseThreshold + domainAdjust)
```

**Examples:**
- Greenfield + Solo + Moderate = 5 + 0 = **5**
- Establishing + Small + High-churn = 3 - 1 = **2** (min 2)
- Mature + Medium + Stable = 2 + 1 = **3**

---

### **2. Config Saved to Data File**

The setup script saves your config to `economics-dashboard-data.json`:

```json
{
  "scmsSessions": 0,
  "baselineSessions": 0,
  "sessions": [],
  "analysis": { ... },
  "scmsConfig": {
    "projectPhase": "Greenfield",
    "teamSize": "Solo",
    "domain": "Moderate",
    "promotionThreshold": 5,
    "nUnique": 1,
    "setupCompleted": true
  }
}
```

---

### **3. Dashboard Reads and Displays Config**

When you open the dashboard, it:

1. **Loads** `economics-dashboard-data.json`
2. **Reads** `scmsConfig.promotionThreshold`
3. **Updates** the threshold display
4. **Replaces** all `n≥X` references in prompts

**Result:** All threshold values match your actual configuration! ✅

---

## 📊 **Dashboard Display**

### **Threshold Info Bar**

Located above the "Session Start Prompt" in the Help tab:

**✅ Setup Complete:**
```
✅ Current Threshold: n≥5 (Greenfield, Solo, Moderate)
```
*Green background = config loaded successfully*

**⚠️ Default (Setup Not Run):**
```
⚠️ Current Threshold: n≥2 (default - run setup script to customize)
```
*Orange background = using defaults*

**❌ Error:**
```
❌ Error: Could not load configuration
```
*Red background = config file issue*

---

## 🎯 **Dynamic Prompt Updates**

### **Session Start Prompt**

All threshold references are automatically replaced:

**Before (hardcoded):**
```markdown
- Pattern promotion: ≥2 uses → copy to WORKSPACE_RULES.md
- L0/L1 pipeline update (threshold: 2+ uses)
- Retrieved [pattern] memory (n=X/2)
```

**After (dynamic - Greenfield example):**
```markdown
- Pattern promotion: ≥5 uses → copy to WORKSPACE_RULES.md
- L0/L1 pipeline update (threshold: 5+ uses)
- Retrieved [pattern] memory (n=X/5)
```

**After (dynamic - Mature example):**
```markdown
- Pattern promotion: ≥2 uses → copy to WORKSPACE_RULES.md
- L0/L1 pipeline update (threshold: 2+ uses)
- Retrieved [pattern] memory (n=X/2)
```

---

## 🚀 **Setup Script Updates**

### **New: Config Save Step**

The setup script now includes:

```powershell
# Save SCMS config to economics-dashboard-data.json
Write-Host 'Saving SCMS configuration...'

$scmsConfigData = @{
    scmsConfig = @{
        projectPhase = "Greenfield"
        teamSize = "Solo"
        domain = "Moderate"
        promotionThreshold = 5
        nUnique = 1
        setupCompleted = $true
    }
}

$scmsConfigData | ConvertTo-Json | Set-Content economics-dashboard-data.json
Write-Host "Configuration saved (threshold: n>=5)"
```

**Location:** `project-root/economics-dashboard-data.json`

---

## 📁 **File Structure**

```
your-project/
├── economics-dashboard-data.json           ← Config stored here
│   └── scmsConfig.promotionThreshold      ← Dashboard reads this
└── docs/scms/
    ├── scripts/setup.ps1                  ← Calculates & saves config
    └── docs/tools/scms-dashboard.html     ← Reads & displays config
```

---

## 🔍 **Verification**

### **Check Your Config:**

```powershell
# View your current config
Get-Content economics-dashboard-data.json | ConvertFrom-Json | Select-Object -ExpandProperty scmsConfig

# Should show:
projectPhase        : Greenfield
teamSize            : Solo
domain              : Moderate
promotionThreshold  : 5
nUnique             : 1
setupCompleted      : True
```

### **Test Dashboard Display:**

1. Open dashboard (`npm run dashboard:app`)
2. Go to **Help** tab
3. Look for **threshold info bar** (above Session Start Prompt)
4. Should show: `✅ Current Threshold: n≥X (Phase, Team, Domain)`
5. Copy Session Start Prompt
6. All threshold references should match `n≥X`

---

## 🎓 **Examples by Project Type**

### **1. Brand New Project (Greenfield)**

**Setup Answers:**
- Phase: Greenfield [1]
- Team: Solo [1]
- Domain: Moderate [2]

**Result:** `n≥5`

**Dashboard Shows:**
```
✅ Current Threshold: n≥5 (Greenfield, Solo, Moderate)

Pattern promotion: ≥5 uses → copy to WORKSPACE_RULES.md
```

**Why:** New projects need more validation before promoting patterns

---

### **2. Growing Project (Establishing)**

**Setup Answers:**
- Phase: Establishing [2]
- Team: Small [2]
- Domain: High-churn [1]

**Result:** `n≥2` (3 - 1 = 2)

**Dashboard Shows:**
```
✅ Current Threshold: n≥2 (Establishing, Small, High-churn)

Pattern promotion: ≥2 uses → copy to WORKSPACE_RULES.md
```

**Why:** Web/mobile projects change fast, lower threshold appropriate

---

### **3. Mature Project (4+ months)**

**Setup Answers:**
- Phase: Mature [3]
- Team: Medium [3]
- Domain: Stable [3]

**Result:** `n≥3` (2 + 1 = 3)

**Dashboard Shows:**
```
✅ Current Threshold: n≥3 (Mature, Medium, Stable)

Pattern promotion: ≥3 uses → copy to WORKSPACE_RULES.md
```

**Why:** Stable domains (embedded, scientific) need extra validation

---

## 🔧 **Changing Your Threshold**

### **Option 1: Run Setup Again (Recommended)**

```powershell
cd docs/scms
.\scripts\setup.ps1
# Answer questions with new values
# Config will be updated
```

### **Option 2: Manual Edit**

```powershell
# Edit economics-dashboard-data.json
# Find scmsConfig section
# Change promotionThreshold value
# Restart dashboard
```

**Example:**
```json
"scmsConfig": {
  "projectPhase": "Establishing",
  "teamSize": "Small",
  "domain": "Moderate",
  "promotionThreshold": 3,  ← Change this
  "nUnique": 2,
  "setupCompleted": true
}
```

---

## 🎯 **Benefits**

### **1. Accuracy**
- Prompts show YOUR actual threshold
- No confusion about when to promote
- Clear expectations set

### **2. Flexibility**
- Different thresholds for different project phases
- Adapts as project matures
- Domain-appropriate settings

### **3. Transparency**
- See why threshold is what it is
- Understand calculation (Phase + Domain)
- Easy to verify and change

### **4. Consistency**
- Setup script = single source of truth
- Dashboard reads from config
- All docs reference correct value

---

## 📝 **Related Files**

| File | Purpose |
|------|---------|
| `economics-dashboard-data.json` | Stores scmsConfig |
| `scripts/setup.ps1` | Calculates & saves config |
| `electron/dashboard-main.js` | Creates empty config if missing |
| `docs/tools/scms-dashboard.html` | Reads & displays config |

---

## 🐛 **Troubleshooting**

### **Issue: Dashboard shows "Setup Required"**

**Cause:** No scmsConfig in data file

**Fix:**
```powershell
cd docs/scms
.\scripts\setup.ps1
# Config will be created
```

---

### **Issue: Dashboard shows wrong threshold**

**Cause:** Outdated config file

**Fix:**
```powershell
# Re-run setup
cd docs/scms
.\scripts\setup.ps1

# Or manually edit economics-dashboard-data.json
```

---

### **Issue: Threshold not updating in prompts**

**Cause:** Dashboard cached old prompts

**Fix:**
1. Hard refresh: `Ctrl + Shift + R`
2. Or close and reopen dashboard
3. Config should load fresh

---

## ✅ **Summary**

**Before:**
- ❌ Hardcoded `n≥2` in all prompts
- ❌ Confusing for Greenfield projects using `n≥5`
- ❌ Manual updates needed

**After:**
- ✅ Dynamic threshold based on project config
- ✅ Setup script calculates optimal value
- ✅ Dashboard displays YOUR threshold
- ✅ All prompts automatically updated
- ✅ Color-coded status indicator

**Result:** The dashboard is now context-aware and shows configuration that matches your actual project setup! 🎉

---

**The setup script is now the single source of truth for your SCMS configuration.**
