/**
 * SCMS Dashboard Preload Script
 * 
 * Exposes safe IPC APIs to the dashboard renderer
 */

const { contextBridge, ipcRenderer } = require('electron');

// Expose dashboard APIs
contextBridge.exposeInMainWorld('electronAPI', {
  // Load dashboard data
  loadDashboardData: () => ipcRenderer.invoke('dashboard:load-data'),

  // Load SCMS startup/session prompts
  loadPrompts: () => ipcRenderer.invoke('dashboard:load-prompts'),
  
  // Update dashboard data (for export disconnect fix)
  updateDashboardData: (data) => ipcRenderer.invoke('dashboard:update-data', data),
  
  // Start checkpoint monitoring
  startCheckpointMonitor: () => ipcRenderer.invoke('dashboard:start-monitor'),
  
  // Stop checkpoint monitoring
  stopCheckpointMonitor: () => ipcRenderer.invoke('dashboard:stop-monitor'),
  
  // Listen for monitor logs
  onCheckpointMonitorLog: (callback) => {
    ipcRenderer.on('monitor:log', (_event, message) => callback(message));
  },
  
  // Listen for monitor stopped
  onCheckpointMonitorStopped: (callback) => {
    ipcRenderer.on('monitor:stopped', () => callback());
  }
});

console.log('[dashboard-preload] APIs exposed');
