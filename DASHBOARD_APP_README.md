# SCMS Dashboard App - Lightweight Electron Wrapper

**Real-time cost tracking with integrated checkpoint monitoring**

---

## 🎯 **What Is This?**

A standalone Electron app that provides:
- ✅ **Real-time checkpoint monitoring** (built-in, no separate terminal needed)
- ✅ **Live cost updates** as you work
- ✅ **Session start/stop controls**
- ✅ **Visual charts and metrics**
- ✅ **Lightweight** (doesn't load a full game like Labyrinth Protocol)

**Use this when**: You want a visual dashboard with integrated monitoring

---

## 🚀 **Quick Start**

### **1. Install Dependencies**

```bash
# Install both regular and dev dependencies
npm install
```

This installs:
- `clipboardy` - For clipboard monitoring
- `electron` - For the dashboard app

### **2. Launch Dashboard App**

```bash
npm run dashboard:app
```

**What happens**:
- ✅ Electron window opens with dashboard
- ✅ Click "Start SCMS Session"
- ✅ Checkpoint monitor starts automatically
- ✅ Work in Cascade normally
- ✅ Copy conversation (Ctrl+A, Ctrl+C)
- ✅ Dashboard updates in real-time!

---

## 📊 **Dashboard Options Compared**

| Feature | `npm run dashboard` (CLI) | `npm run dashboard:app` (Electron) |
|---------|---------------------------|-----------------------------------|
| **Type** | Terminal output | Visual GUI |
| **Monitoring** | Manual (separate process) | Built-in, automatic |
| **Updates** | On-demand (run command) | Real-time (auto-refresh) |
| **Charts** | ASCII art | Visual graphs |
| **Session Control** | None | Start/Stop buttons |
| **Best For** | Quick checks | Active tracking |

---

## 🎨 **Features**

### **Built-in Checkpoint Monitor**
- ✅ Starts/stops with button clicks
- ✅ Live status display
- ✅ Log output in console
- ✅ No separate terminal needed

### **Real-Time Updates**
- ✅ Auto-refreshes every 5 seconds
- ✅ Live cost calculations
- ✅ Pattern ROI updates
- ✅ Session progress tracking

### **Visual Dashboard**
- ✅ Beautiful gradient UI
- ✅ Cost comparison charts
- ✅ Pattern usage metrics
- ✅ Session history
- ✅ Export functionality

---

## 💡 **How to Use**

### **Complete Workflow**

1. **Launch App**
   ```bash
   npm run dashboard:app
   ```

2. **Start Session**
   - Click "Start SCMS Session" in dashboard
   - Monitor starts automatically

3. **Work in Cascade**
   - Develop features normally
   - Use SCMS patterns (L0/L1/L5)

4. **Capture Checkpoints**
   - In Cascade: `Ctrl+A` (select all)
   - `Ctrl+C` (copy)
   - Dashboard updates automatically!

5. **Watch Live Updates**
   - See costs update in real-time
   - Pattern usage tracked
   - ROI calculations shown

6. **End Session**
   - Click "End Session" in dashboard
   - Monitor stops automatically
   - Export data if needed

---

## 🔧 **Technical Details**

### **Architecture**

```
Electron App (dashboard:app)
    ↓
Main Process (electron/dashboard-main.js)
    ↓
CheckpointMonitor Class (scripts/CheckpointMonitor.class.js)
    ↓
Watches Clipboard → Saves Checkpoints → Updates Dashboard Data
    ↓
Renderer Process (docs/tools/scms-dashboard.html)
    ↓
Auto-refreshes → Shows Live Metrics
```

### **IPC Communication**

The app uses Electron IPC for secure communication:

**Main Process → Renderer**:
- `monitor:log` - Send log messages to console
- `monitor:stopped` - Notify when monitor stops

**Renderer → Main Process**:
- `dashboard:start-monitor` - Start checkpoint monitoring
- `dashboard:stop-monitor` - Stop checkpoint monitoring
- `dashboard:load-data` - Load dashboard data

**Security**:
- ✅ Context isolation enabled
- ✅ Node integration disabled
- ✅ Preload script for safe IPC

---

## 📂 **File Structure**

```
scms-starter-kit/
├── electron/
│   ├── dashboard-main.js          # Electron main process
│   └── dashboard-preload.js       # IPC bridge (secure)
├── scripts/
│   └── CheckpointMonitor.class.js # Class-based monitor
├── docs/tools/
│   ├── scms-dashboard.html        # Dashboard UI
│   ├── scms-cost-tracker.js       # Cost tracking logic
│   └── scms-cost-data.json        # Data storage
├── checkpoints/                   # Saved checkpoints
└── package.json                   # npm scripts
```

---

## 🆚 **vs Other Options**

### **vs PowerShell Launcher** (`launch-dashboard-with-tracking.ps1`)
- **PowerShell**: Separate terminal + browser
- **Electron**: Integrated app, one window
- **Winner**: Electron (cleaner UX)

### **vs CLI Dashboard** (`npm run dashboard`)
- **CLI**: Quick snapshot, no monitoring
- **Electron**: Real-time tracking, visual
- **Winner**: Depends on use case
  - Quick check? → CLI
  - Active tracking? → Electron

### **vs Manual Monitoring** (`npm run checkpoint:monitor`)
- **Manual**: Separate terminal, manual refresh
- **Electron**: Integrated, auto-refresh
- **Winner**: Electron (automation)

---

## 🐛 **Troubleshooting**

### **"electron: command not found"**

**Fix**: Install dev dependencies
```bash
npm install --include=dev
```

### **"clipboardy not installed"**

**Fix**: Install regular dependencies
```bash
npm install
```

### **Dashboard doesn't update**

**Checks**:
1. ✅ Did you click "Start SCMS Session"?
2. ✅ Did you copy conversation (Ctrl+A, Ctrl+C)?
3. ✅ Check console (F12) for errors
4. ✅ Verify `scms-cost-data.json` exists

**Fix**: Restart app and try again

### **Monitor not starting**

**Check console for**:
- `clipboardy not installed` → Run `npm install`
- `Monitor already running` → Click "End Session" first
- Permission errors → Check file access

---

## 💡 **Pro Tips**

### **Development Mode**

Open DevTools automatically:
```bash
# Set environment variable
NODE_ENV=development npm run dashboard:app

# On Windows PowerShell:
$env:NODE_ENV="development"; npm run dashboard:app
```

### **Monitor Logs**

Watch the Electron console for:
- ✅ Checkpoint detections
- ✅ Token counts
- ✅ File saves
- ✅ Dashboard updates

### **Session Management**

Best practice:
1. One session per feature/task
2. End session before switching
3. Export data regularly
4. Start fresh session for new work

---

## 🎯 **When to Use Each Option**

### **Use CLI Dashboard** (`npm run dashboard`)
- ✅ Quick status check
- ✅ SSH/remote development
- ✅ CI/CD integration
- ✅ No GUI needed

### **Use Electron App** (`npm run dashboard:app`)
- ✅ Active development session
- ✅ Want visual dashboard
- ✅ Need real-time tracking
- ✅ Like integrated monitoring

### **Use PowerShell Launcher** (`launch-dashboard-with-tracking.ps1`)
- ✅ Prefer browser-based dashboard
- ✅ Want separate monitor terminal
- ✅ Need to keep monitor running in background

**Recommendation**: Try the Electron app first! It's the most integrated experience.

---

## 📈 **Expected Results**

### **What You'll See**

**On Start**:
```
[dashboard] App starting...
[dashboard] Window created
[dashboard] Checkpoint monitor started
🔍 Checkpoint Monitor Started
Checking clipboard every 3000ms
```

**On Checkpoint Capture**:
```
✅ Checkpoint 1 saved
   Tokens: 78,652 used
   File: checkpoint_1699123456789.txt
Dashboard updated with checkpoint data
```

**In Dashboard**:
- 📊 Session cost updates
- 💰 Token breakdown shows
- 🎯 Patterns tracked
- 📈 Savings percentage calculated

---

## ✅ **Bottom Line**

**The Electron dashboard app provides**:
- ✅ **All-in-one solution** (monitoring + dashboard)
- ✅ **Real-time tracking** (5-second refresh)
- ✅ **Visual interface** (charts and metrics)
- ✅ **Session controls** (start/stop buttons)
- ✅ **Lightweight** (no game assets)

**Perfect for**:
- Active development sessions
- Visual cost tracking
- Real-time pattern analysis
- Business case validation

**Launch it now**:
```bash
npm run dashboard:app
```

🚀✨📊
