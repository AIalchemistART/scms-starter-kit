# Automated Checkpoint Tracking - Setup Guide

**SCMS Cost Tracker with Automated Token Measurement**

---

## 🎯 **What This Does**

Automatically tracks your Cascade AI token usage and costs **without needing Cascade API access**!

**How?** By parsing checkpoint summaries that Windsurf already provides in your conversations.

---

## 🚀 **Quick Start (3 Steps)**

### **Step 1: Install Dependencies**

```bash
npm install
```

This installs `clipboardy` for clipboard monitoring.

### **Step 2: Start Tracking**

**Option A: Automated (Recommended)**
```powershell
# Windows
.\scripts\launch-dashboard-with-tracking.ps1

# This will:
# - Start checkpoint monitor in background
# - Open SCMS dashboard in browser
# - Auto-track when you copy conversations
```

**Option B: Manual**
```bash
# Terminal 1: Start monitor
npm run checkpoint:monitor

# Terminal 2: Open dashboard
# Just open: docs/tools/scms-dashboard.html
```

### **Step 3: Track Your Session**

1. **In Dashboard**: Click "Start SCMS Session"
2. **Work in Cascade**: Develop normally
3. **Capture Checkpoint**: 
   - In Cascade conversation: `Ctrl+A` (select all)
   - `Ctrl+C` (copy)
4. **Auto-Magic**: Monitor processes and updates dashboard!
5. **In Dashboard**: Click "End Session" when done
6. **Export**: Click "Export Data for Analysis"

---

## 📊 **What Gets Tracked**

### **Automatically Captured from Checkpoints:**

✅ **Total tokens used** (from `<system_warning>` tags)  
✅ **Input/output split** (60/40 estimated ratio)  
✅ **Session cost** ($3/1M input, $15/1M output)  
✅ **Token progression** (deltas between checkpoints)  

### **Automatically Detected from Conversation:**

✅ **Patterns created** (new L0/L1 files)  
✅ **Patterns retrieved** (L0/L1 usage mentions)  
✅ **Code edits** (tool usage)  
✅ **ROI calculations** (savings per pattern)  

---

## 🔍 **How It Works**

### **Checkpoint Data Source**

Windsurf provides token usage in checkpoint summaries:

```xml
<budget:token_budget>200000</budget:token_budget>
<system_warning>Token usage: 78652/200000; 121348 remaining</system_warning>
```

**We extract:**
- Used: 78,652 tokens
- Budget: 200,000 tokens  
- Remaining: 121,348 tokens

### **Processing Pipeline**

```
Cascade Conversation
        ↓
    Copy (Ctrl+C)
        ↓
Clipboard Monitor (running in background)
        ↓
    Detects checkpoint data
        ↓
    Saves to checkpoints/ directory
        ↓
    Parses token usage
        ↓
Calculates costs & patterns
        ↓
Updates docs/tools/scms-cost-data.json
        ↓
Dashboard auto-refreshes (every 5 seconds)
        ↓
    Live metrics update!
```

---

## 💾 **File Structure**

```
scms-starter-kit/
├── package.json                           # NPM config with scripts
├── checkpoints/                           # Auto-created by monitor
│   └── checkpoint-[sessionId].txt         # Saved conversations
├── docs/tools/
│   ├── scms-dashboard.html                # Cost tracking dashboard
│   ├── scms-cost-tracker.js               # Tracker logic
│   └── scms-cost-data.json               # Auto-generated data
└── scripts/
    ├── checkpoint-monitor.js              # Clipboard monitor
    ├── parse-checkpoints.js               # Checkpoint parser
    └── launch-dashboard-with-tracking.ps1 # One-click launcher
```

---

## 📝 **NPM Scripts**

### **Start Checkpoint Monitor**
```bash
npm run checkpoint:monitor
```
Watches clipboard for checkpoint data and auto-processes.

### **Parse Existing Checkpoints**
```bash
npm run checkpoint:parse
```
Processes all saved checkpoint files in `checkpoints/` directory.

### **Watch Mode**
```bash
npm run checkpoint:watch
```
Continuously watches `checkpoints/` directory for new files and auto-parses.

---

## 🎨 **Dashboard Features**

### **Live Metrics** (auto-refresh every 5 seconds)
- Current session cost
- Total tokens (input/output)
- Retrieval ratio
- Pattern usage
- Cost comparison (SCMS vs Baseline)

### **Pattern ROI**
- Top 10 performing patterns
- Uses per pattern
- Savings per pattern ($0.015/reuse)
- Total ROI

### **Export Capability**
- JSON export for analysis
- Includes all sessions
- Pattern tracking data
- Comparative analysis

---

## 🔧 **Troubleshooting**

### **Monitor not detecting checkpoints?**

**Check:**
1. ✅ Did you copy the conversation? (Ctrl+A, Ctrl+C)
2. ✅ Does the conversation contain checkpoint data?
   - Look for: `Token usage: X/Y; Z remaining`
3. ✅ Is monitor running? Check terminal output

**Fix:**
```bash
# Restart monitor
Ctrl+C
npm run checkpoint:monitor
```

### **Dashboard not updating?**

**Check:**
1. ✅ Is `scms-cost-data.json` being created?
2. ✅ Open browser console (F12) - any errors?
3. ✅ Hard refresh dashboard (Ctrl+Shift+R)

**Fix:**
```bash
# Manually parse checkpoints
npm run checkpoint:parse

# Verify data file
cat docs/tools/scms-cost-data.json
```

### **No checkpoints directory?**

Monitor auto-creates it on first run. If missing:

```bash
mkdir checkpoints
npm run checkpoint:monitor
```

---

## 💡 **Pro Tips**

### **When to Copy Conversations**

**Best practice**: Copy at natural checkpoints
- ✅ After completing a feature
- ✅ Before switching tasks
- ✅ At end of session
- ✅ When you see token warnings

**Frequency**: Every 15-30 minutes or when convenient

### **Multiple Sessions**

Each copy creates a new checkpoint file:
- `checkpoint-1699123456789.txt`
- `checkpoint-1699123567890.txt`

Monitor tracks session by timestamp automatically!

### **Baseline Comparison**

To measure SCMS value:
1. Track session WITH SCMS (using patterns)
2. Track session WITHOUT SCMS (fresh exploration)
3. Dashboard calculates savings percentage

---

## 📈 **Expected Results**

### **Conservative Targets**
- **Cost Reduction**: 30-45% vs baseline
- **Annual Savings**: $200-400 for heavy users
- **Platform Savings**: $2-3.5M for 100K users

### **Sample Session Output**

```json
{
  "sessions": [
    {
      "id": 1699123456789,
      "type": "scms",
      "totalCost": 0.00336,
      "tokenBreakdown": {
        "input": 48000,
        "output": 32000
      },
      "patterns": [
        "error-handling-pattern",
        "api-integration-pattern"
      ],
      "retrievalRatio": 0
    }
  ]
}
```

---

## 🚨 **Important Notes**

### **Data Privacy**
- All data stays **local** on your machine
- Checkpoints saved to `checkpoints/` directory
- No external API calls
- You control all data

### **Accuracy**
- Token counts are **exact** (from Cascade)
- Input/output split is **estimated** (60/40 ratio)
- Pattern detection is **heuristic** (text parsing)
- Costs calculated with **current pricing** ($3/$15 per 1M tokens)

### **Limitations**
- Requires manual copy action (can't intercept Cascade API)
- Checkpoints are periodic (not every interaction)
- Input/output split is estimated (no breakdown from Cascade)
- Pattern detection based on text matching

---

## ✅ **Verification**

### **Test the System**

1. **Start monitor**: `npm run checkpoint:monitor`
2. **Copy this checkpoint example**:

```xml
<system_warning>Token usage: 10000/200000; 190000 remaining</system_warning>

Created file: test-pattern.md
Using pattern: error-handling
```

3. **Check output**: Monitor should detect and process
4. **View data**: `cat docs/tools/scms-cost-data.json`
5. **Open dashboard**: Should show the test session!

---

## 🎊 **You're Ready!**

The automated checkpoint tracking system is fully integrated and ready to use!

**Next Step**: Run your first tracked session!

```powershell
# Windows
.\scripts\launch-dashboard-with-tracking.ps1

# Or manually
npm run checkpoint:monitor
# Then open: docs/tools/scms-dashboard.html
```

**Happy tracking!** 📊💰✨
