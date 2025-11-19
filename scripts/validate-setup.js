#!/usr/bin/env node

/**
 * SCMS Setup Validation
 * Checks if setup script was run and guides user if not
 */

const fs = require('fs');
const path = require('path');

const REQUIRED_FILES = [
  'docs/scms/MEMORY_STATUS_DASHBOARD.md',
  'docs/scms/SCMS_STARTUP_PROMPT.md',
  'docs/scms/WORKSPACE_RULES.md'
];

function checkSetup() {
  const missingFiles = REQUIRED_FILES.filter(file => !fs.existsSync(path.join(process.cwd(), file)));
  
  if (missingFiles.length > 0) {
    console.error('\n❌ SCMS NOT CONFIGURED\n');
    console.error('It looks like you haven\'t run the setup script yet.');
    console.error('The setup script configures critical settings like:\n');
    console.error('  • Promotion thresholds (greenfield vs mature)');
    console.error('  • IDE detection (Windsurf/Cursor/Generic)');
    console.error('  • L0 strategy (auto-memory vs manual)');
    console.error('  • Team size and domain adjustments\n');
    console.error('📋 REQUIRED STEP:\n');
    
    if (process.platform === 'win32') {
      console.error('  Run:  .\\scripts\\setup.ps1\n');
    } else {
      console.error('  Run:  ./scripts/setup.sh\n');
    }
    
    console.error('This takes 2-3 minutes and only needs to be done once.\n');
    process.exit(1);
  }
  
  // Setup completed - silent success
  return true;
}

// Run validation
try {
  checkSetup();
} catch (error) {
  console.error('Error checking setup:', error.message);
  process.exit(1);
}
