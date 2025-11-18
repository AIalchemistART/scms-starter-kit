# 📁 Dashboard Project Path Configuration

**How the dashboard knows which project's data to load**

---

## ✅ **How It Works Now**

### **Automatic Project Detection**

When you clone the starter kit to your project's `docs/scms/` folder, the dashboard automatically:

1. ✅ Creates data file at **project root**
2. ✅ Loads from **project root**
3. ✅ Clears localStorage if fresh project
4. ✅ Each project has isolated data

---

## 📂 **File Structure**

### **Correct Setup:**

```
your-project/                                    ← PROJECT ROOT
├── economics-dashboard-data.json                ← Data file here!
├── src/
├── package.json
└── docs/
    └── scms/                                    ← Cloned starter kit
        ├── electron/
        │   └── dashboard-main.js                ← Knows to go 2 levels up
        ├── docs/tools/
        │   └── scms-dashboard.html
        ├── package.json
        └── README.md
```

### **Path Resolution:**

```javascript
// electron/dashboard-main.js
const DATA_PATH = path.join(__dirname, '..', '..', 'economics-dashboard-data.json');

// Resolves to:
// your-project/docs/scms/electron/dashboard-main.js
//              ^^^^  ^^^^  ^^^^^^^^
//               |     |       |
//           Level 1  Level 2  Current file
//
// Goes up 2 levels → your-project/economics-dashboard-data.json
```

---

## 🔄 **Fresh Project Behavior**

### **First Launch:**

1. **Dashboard starts**
2. **Checks if data file exists**
   - If NOT: Creates clean file with all zeros
   - If YES: Loads existing data

3. **Checks localStorage**
   - If file is fresh (all zeros) BUT localStorage has data
   - Clears localStorage automatically
   - Shows notification: "✨ Fresh Project - Storage cleared for clean start!"

4. **Result:** Completely clean dashboard ✅

---

## 🎯 **Multiple Projects**

### **Each Project is Isolated:**

```
C:\Projects\
├── project-a/
│   ├── economics-dashboard-data.json       ← Project A's data
│   └── docs/scms/
│       └── npm run dashboard:app           → Loads Project A's data
│
├── project-b/
│   ├── economics-dashboard-data.json       ← Project B's data
│   └── docs/scms/
│       └── npm run dashboard:app           → Loads Project B's data
│
└── project-c/
    ├── economics-dashboard-data.json       ← Project C's data
    └── docs/scms/
        └── npm run dashboard:app           → Loads Project C's data
```

**Each dashboard loads its own project's data!** ✅

---

## 🔧 **How Data Path Works**

### **Electron Main Process:**

```javascript
// electron/dashboard-main.js

// 1. Calculate data path (2 levels up from electron/)
const DATA_PATH = path.join(__dirname, '..', '..', 'economics-dashboard-data.json');

// 2. Ensure file exists before app starts
function ensureDataFile() {
  if (!fs.existsSync(DATA_PATH)) {
    const emptyData = {
      scmsSessions: 0,
      baselineSessions: 0,
      sessions: [],
      exportDate: null,
      analysis: {
        scmsAvgCost: 0,
        baselineAvgCost: 0,
        savingsPercent: 0
      }
    };
    fs.writeFileSync(DATA_PATH, JSON.stringify(emptyData, null, 2), 'utf-8');
    console.log('[dashboard] Created clean data file:', DATA_PATH);
  }
}

// 3. Called before window creation
app.whenReady().then(() => {
  ensureDataFile();  // ← Runs first!
  createWindow();
});
```

### **Dashboard Renderer:**

```javascript
// docs/tools/scms-dashboard.html

// 1. Load and check for fresh project
async function clearStorageIfFreshProject() {
  // Check if Electron API available
  if (!window.electronAPI?.loadDashboardData) return;
  
  // Load data file
  const result = await window.electronAPI.loadDashboardData();
  if (!result.ok) return;
  
  const fileData = result.data;
  
  // Is file fresh (all zeros)?
  const isFreshFile = (
    fileData.scmsSessions === 0 &&
    fileData.baselineSessions === 0 &&
    fileData.sessions?.length === 0
  );
  
  // Does localStorage have data?
  const storedData = localStorage.getItem('scms-cost-tracker-data');
  const hasLocalData = storedData && storedData !== '{}';
  
  // Clear localStorage if file is fresh but storage has old data
  if (isFreshFile && hasLocalData) {
    console.log('[dashboard] 🧹 Fresh project - clearing localStorage');
    localStorage.removeItem('scms-cost-tracker-data');
    localStorage.removeItem('scms-active-session');
    // Show notification
  }
}

// 2. Run on page load
document.addEventListener('DOMContentLoaded', async () => {
  await clearStorageIfFreshProject();  // ← Clears old data!
  restoreStartupPromptState();
  startHealthRefresh();
});
```

---

## ✅ **Benefits**

### **1. Automatic Path Detection**
- No configuration needed
- Works immediately after cloning
- Finds project root automatically

### **2. Data Isolation**
- Each project has its own data file
- No cross-project contamination
- Safe to work on multiple projects

### **3. Fresh Start Guarantee**
- New projects start with clean data
- Old localStorage automatically cleared
- No demo data pollution

### **4. File Auto-Creation**
- Missing file? Created automatically
- Always starts with clean state
- No manual setup required

---

## 🚀 **Usage Instructions**

### **Setup in New Project:**

```bash
# 1. In your project folder
cd your-project

# 2. Clone starter kit
git clone https://github.com/AIalchemistART/scms-starter-kit.git docs/scms

# 3. Install dependencies
cd docs/scms
npm install

# 4. Launch dashboard
npm run dashboard:app

# ✅ Dashboard automatically:
#    - Creates: your-project/economics-dashboard-data.json
#    - Loads from: your-project/
#    - Clears localStorage if fresh
```

### **Verify Correct Path:**

```bash
# Check console output when dashboard starts
# Should see:
[dashboard] Created clean data file: C:\your-project\economics-dashboard-data.json

# Or in dashboard, press F12 and check console
# Should see project root path, not starter kit path
```

---

## 🔍 **Troubleshooting**

### **Issue: Dashboard shows wrong project's data**

**Check:** Are you running from the correct location?

```bash
# ❌ Wrong: Running from starter kit repo
cd C:\repos\scms-starter-kit
npm run dashboard:app
# Loads: C:\repos\economics-dashboard-data.json

# ✅ Correct: Running from project's scms folder
cd C:\your-project\docs\scms
npm run dashboard:app
# Loads: C:\your-project\economics-dashboard-data.json
```

### **Issue: Demo data still appearing**

**Solution 1:** Pull latest changes
```bash
cd docs/scms
git pull origin master
npm install
```

**Solution 2:** Delete data file and restart
```bash
# In project root
Remove-Item economics-dashboard-data.json
# Restart dashboard - file will be recreated fresh
```

**Solution 3:** Clear localStorage manually
```javascript
// In dashboard, press F12, run in console:
localStorage.clear();
location.reload();
```

---

## 📊 **Data File Format**

### **Fresh Project (Default):**

```json
{
  "scmsSessions": 0,
  "baselineSessions": 0,
  "sessions": [],
  "exportDate": null,
  "analysis": {
    "scmsAvgCost": 0,
    "baselineAvgCost": 0,
    "savingsPercent": 0
  }
}
```

### **After Sessions:**

```json
{
  "scmsSessions": 3,
  "baselineSessions": 2,
  "sessions": [
    {
      "id": 1700000000001,
      "type": "scms",
      "startTime": "2025-11-18T08:00:00.000Z",
      "endTime": "2025-11-18T09:30:00.000Z",
      "duration": 5400000,
      "totalCost": 0.0081,
      "tokenBreakdown": {
        "input": 1500,
        "output": 800,
        "thinking": 400,
        "tools": 200
      },
      "patterns": ["Error Handling", "API Integration"],
      "retrievalRatio": 0.65
    }
  ],
  "exportDate": "2025-11-18T09:30:00.000Z",
  "analysis": {
    "scmsAvgCost": 0.0081,
    "baselineAvgCost": 0.0145,
    "savingsPercent": 44.14
  }
}
```

---

## 🎯 **Key Points**

1. ✅ **Data file at project root** - 2 levels up from electron/
2. ✅ **Auto-created if missing** - No manual setup
3. ✅ **localStorage auto-cleared** - Fresh projects start clean
4. ✅ **Each project isolated** - No data cross-contamination
5. ✅ **No configuration needed** - Works out of the box

---

## 📝 **Related Documentation**

- **Setup Instructions:** `README.md`
- **Demo Data Issues:** `DEMO_DATA_TROUBLESHOOTING.md`
- **Dashboard Features:** `docs/tools/README.md`
- **Checkpoint Monitoring:** `scripts/CheckpointMonitor.class.js`

---

**The dashboard now automatically finds and uses your project's data - no configuration required!** ✅
