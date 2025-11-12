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

// Paths
const DATA_PATH = path.join(__dirname, '..', 'docs', 'tools', 'scms-cost-data.json');
const DASHBOARD_HTML = path.join(__dirname, '..', 'docs', 'tools', 'scms-dashboard.html');

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

// Start checkpoint monitor
ipcMain.handle('dashboard:start-monitor', async () => {
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

    await checkpointMonitor.start();
    console.log('[dashboard] Checkpoint monitor started');
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
