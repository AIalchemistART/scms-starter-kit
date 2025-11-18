/**
 * SCMS Economics Dashboard - Standalone Electron App
 * 
 * Lightweight wrapper for real-time cost tracking without loading a full game
 */

const { app, BrowserWindow, ipcMain } = require('electron');
const path = require('path');
const fs = require('fs');

let mainWindow = null;
let checkpointMonitor = null;

// Paths - Data file should be at project root (2 levels up from electron/)
// Structure: project-root/economics-dashboard-data.json
//            project-root/docs/scms/electron/dashboard-main.js
const DATA_PATH = path.join(__dirname, '..', '..', 'economics-dashboard-data.json');
const DASHBOARD_HTML = path.join(__dirname, '..', 'docs', 'tools', 'scms-dashboard.html');

// Ensure data file exists with clean state
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
      },
      scmsConfig: {
        projectPhase: 'Mature',
        teamSize: 'Solo',
        domain: 'Moderate',
        promotionThreshold: 2,
        nUnique: 1,
        setupCompleted: false
      }
    };
    fs.writeFileSync(DATA_PATH, JSON.stringify(emptyData, null, 2), 'utf-8');
    console.log('[dashboard] Created clean data file:', DATA_PATH);
  }
}

function createWindow() {
  mainWindow = new BrowserWindow({
    width: 1400,
    height: 900,
    title: 'SCMS Economics Dashboard',
    backgroundColor: '#667eea',
    webPreferences: {
      preload: path.join(__dirname, 'dashboard-preload.js'),
      contextIsolation: true,
      nodeIntegration: false
    }
  });

  // Load dashboard HTML
  mainWindow.loadFile(DASHBOARD_HTML);
  
  // Open DevTools in development
  if (process.env.NODE_ENV !== 'production') {
    mainWindow.webContents.openDevTools();
  }

  mainWindow.on('closed', () => {
    mainWindow = null;
  });

  console.log('[dashboard] Window created');
}

// Load dashboard data
ipcMain.handle('dashboard:load-data', async () => {
  try {
    if (!fs.existsSync(DATA_PATH)) {
      return { ok: false, error: 'Dashboard data not found' };
    }
    
    const data = JSON.parse(fs.readFileSync(DATA_PATH, 'utf-8'));
    return { ok: true, data };
  } catch (error) {
    console.error('[dashboard] Load error:', error);
    return { ok: false, error: error.message };
  }
});

// Update dashboard data (for export disconnect fix)
ipcMain.handle('dashboard:update-data', async (_event, data) => {
  try {
    fs.writeFileSync(DATA_PATH, JSON.stringify(data, null, 2), 'utf-8');
    console.log('[dashboard] Data updated:', DATA_PATH);
    return { ok: true };
  } catch (error) {
    console.error('[dashboard] Update error:', error);
    return { ok: false, error: error.message };
  }
});

// Start checkpoint monitor
ipcMain.handle('dashboard:start-monitor', async (_event, sessionStamp = {}) => {
  try {
    if (checkpointMonitor) {
      return { ok: false, error: 'Monitor already running' };
    }

    const CheckpointMonitor = require('../scripts/CheckpointMonitor.class.js');
    checkpointMonitor = new CheckpointMonitor();
    
    // Forward logs to renderer
    checkpointMonitor.on('log', (message) => {
      if (mainWindow) {
        mainWindow.webContents.send('monitor:log', message);
      }
    });

    checkpointMonitor.on('stopped', () => {
      if (mainWindow) {
        mainWindow.webContents.send('monitor:stopped');
      }
      checkpointMonitor = null;
    });

    await checkpointMonitor.start(sessionStamp);
    console.log('[dashboard] Checkpoint monitor started with type:', sessionStamp.type);
    return { ok: true };
  } catch (error) {
    console.error('[dashboard] Monitor start error:', error);
    return { ok: false, error: error.message };
  }
});

// Stop checkpoint monitor
ipcMain.handle('dashboard:stop-monitor', async () => {
  try {
    if (!checkpointMonitor) {
      return { ok: false, error: 'Monitor not running' };
    }

    await checkpointMonitor.stop();
    checkpointMonitor = null;
    console.log('[dashboard] Checkpoint monitor stopped');
    return { ok: true };
  } catch (error) {
    console.error('[dashboard] Monitor stop error:', error);
    return { ok: false, error: error.message };
  }
});

// App lifecycle
app.whenReady().then(() => {
  // Ensure data file exists before creating window
  ensureDataFile();
  createWindow();

  app.on('activate', () => {
    if (BrowserWindow.getAllWindows().length === 0) {
      createWindow();
    }
  });
});

app.on('window-all-closed', () => {
  // Clean up monitor
  if (checkpointMonitor) {
    checkpointMonitor.stop().catch(console.error);
  }
  
  if (process.platform !== 'darwin') {
    app.quit();
  }
});

console.log('[dashboard] App starting...');
