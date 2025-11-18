# 📊 Session Tracking Explained

**Date:** November 17, 2025  
**Version:** 2.0

---

## 🎯 What Each Button Does

### 1. Start Session Button → Tracks SESSION BOUNDARIES

```javascript
Creates session metadata:
- Session ID: 1731890400000 (timestamp)
- Type: 'scms' or 'baseline'
- Start Time: ISO timestamp
- Starts file watcher

Does NOT track: Token usage (comes from checkpoint)
```

### 2. End Session Button → Tracks SESSION END

```javascript
Adds to session:
- End Time: ISO timestamp
- Duration: milliseconds
- Stops file watcher

Does NOT track: Token usage (comes from checkpoint)
```

### 3. Export Button → Creates CHECKPOINT & Exports

```javascript
Workflow:
1. Reads session metadata from Start/End
2. Generates checkpoint prompt WITH session info
3. Copies prompt to clipboard
4. You paste into Windsurf
5. AI creates checkpoint-{sessionID}.txt
6. File includes: session metadata + all token warnings
7. CheckpointMonitor processes file
8. Correlates by session ID
9. Export includes complete data
```

---

## 📋 Data Sources

| Data | Source | When |
|------|--------|------|
| Session ID | Start Session button | On start |
| Session Type | Start Session button | On start |
| Start Time | Start Session button | On start |
| End Time | End Session button | On end |
| Duration | End Session button | On end |
| Token Usage | Checkpoint file | At export |
| Cost | Checkpoint file | At export |

---

## 🔄 Complete Workflow

```
1. Click "Start Session"
   → Session ID, Type, Start Time tracked
   → File watcher started
   ↓

2. Work in Windsurf
   → Token usage accumulates in conversation
   ↓

3. Click "End Session"
   → End Time, Duration tracked
   → File watcher stopped
   ↓

4. Click "Export Data"
   → Dashboard reads session metadata
   → Generates checkpoint prompt WITH session info
   → Copies to clipboard
   ↓

5. Paste into Windsurf (Ctrl+V)
   → AI extracts all token warnings
   → AI creates checkpoint-{sessionID}.txt
   → File includes session metadata + tokens
   ↓

6. Return to dashboard & click OK
   → File watcher detects checkpoint
   → CheckpointMonitor parses file
   → Finds session by ID
   → Updates session with token data
   ↓

7. Export completes
   → Session metadata + Token data combined
   → Download created with complete data!
```

---

## 🧩 How Data Combines

### Session Metadata (from buttons)
```json
{
  "id": 1731890400000,
  "type": "scms",
  "startTime": "2025-11-17T20:00:00.000Z",
  "endTime": "2025-11-17T21:30:00.000Z",
  "duration": 5400000
}
```

### Token Data (from checkpoint file)
```json
{
  "tokenBreakdown": {
    "input": 9000,
    "output": 6000
  },
  "totalCost": 0.00036
}
```

### Combined Session (final export)
```json
{
  "id": 1731890400000,
  "type": "scms",
  "startTime": "2025-11-17T20:00:00.000Z",
  "endTime": "2025-11-17T21:30:00.000Z",
  "duration": 5400000,
  "tokenBreakdown": {
    "input": 9000,
    "output": 6000
  },
  "totalCost": 0.00036
}
```

---

## 📊 Dashboard Updates

### When Metrics Update

**After Export Completes:**
- ✅ Session counts (Total / SCMS / Baseline)
- ✅ Savings percentage
- ✅ Cost comparison chart
- ✅ Current session metrics
- ✅ Cumulative ROI
- ✅ Pattern list
- ✅ All visualizations

**Automatic Refresh:**
Dashboard reloads data and updates UI immediately after checkpoint is processed!

---

## 🎯 Key Points

### Start/End Session = Track TIME
- When session started
- When session ended
- How long it lasted
- What type of session

### Checkpoint File = Track TOKENS
- Token usage over time
- Input/output split
- Cost calculation

### Export = COMBINE Both
- Session time boundaries
- Token usage data
- Complete economic metrics
- Ready for analysis

---

## ✅ Summary

**Three data sources work together:**

1. **Start Session:** Creates container with ID and time metadata
2. **End Session:** Completes time boundaries
3. **Checkpoint File:** Fills container with token data

**Result:** Complete session tracking with proper correlation!

---

**The key insight:** Session buttons track WHEN and WHAT TYPE. Checkpoint file tracks HOW MUCH. Export combines them into complete economic data. 🚀
