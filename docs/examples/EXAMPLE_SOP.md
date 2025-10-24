# Save & Resume System - Standard Operating Procedure

**Document Type**: Level 2 SOP (Example)  
**Status**: ✅ Validated Pattern (Use Count: 8)  
**Complexity**: Medium  
**Est. Implementation Time**: 45-60 minutes  
**Prerequisites**: State management setup, persistent storage access

*This is an example L2 SOP showing a complete procedure from a real project (sanitized)*

---

## 📋 Overview

### What This Does

Implements a save-and-resume system that allows users to:
- Save their progress at any point
- Exit the application
- Resume exactly where they left off

### When to Use This SOP

**Use this when**:
- Building applications with long user sessions
- Need to persist state across app restarts
- Want "Continue" functionality
- Implementing checkpoint systems

**Don't use this when**:
- State fits entirely in session storage
- No need for cross-session persistence
- Simpler localStorage patterns suffice

---

## 🎯 Expected Outcomes

**After following this SOP, you will have**:
- [ ] Save system that captures current state
- [ ] Resume functionality that restores exact state
- [ ] Data persisted across app restarts
- [ ] Save/Exit and Continue options in UI

**Success Criteria**:
- User can save and exit at any point
- Continue button loads saved state
- State restoration is exact (no data loss)
- No crashes or data corruption

---

## 🏗️ Architecture Overview

### High-Level Design

```
User Interaction
    ↓
Save Trigger → Capture State → Serialize → Write to Disk
                                                 ↓
Read from Disk → Deserialize → Restore State → Resume
    ↑
Continue Trigger
```

### Key Components

**SaveManager**:
- Purpose: Coordinate save operations
- Responsibilities: State capture, serialization, file I/O

**StateManager**:
- Purpose: Track resumable state
- Responsibilities: Current state tracking, restoration

**FileSystem Layer**:
- Purpose: Persistent storage
- Responsibilities: Read/write save files, handle errors

---

## 📝 Implementation Steps

### Step 1: Define Save Data Schema

**Purpose**: Establish what data needs to be saved

**Define Schema**:
```javascript
const saveDataSchema = {
  version: '1.0',           // Schema version for migrations
  timestamp: Date,          // When saved
  userProgress: {
    currentStage: String,   // Where user was
    completedStages: Array, // What they've completed
    settings: Object        // User preferences
  },
  resumeData: {
    type: String,           // What to resume (e.g., 'interactive', 'menu')
    specificState: String   // Exact state identifier
  }
};
```

**Example**:
```javascript
const saveData = {
  version: '1.0',
  timestamp: new Date().toISOString(),
  userProgress: {
    currentStage: 'level_3',
    completedStages: ['level_1', 'level_2'],
    settings: { volume: 0.7, difficulty: 'normal' }
  },
  resumeData: {
    type: 'gameplay',
    specificState: 'level_3_checkpoint_2'
  }
};
```

---

### Step 2: Implement Save Function

**Purpose**: Capture and persist current state

**Create Save Function**:
```javascript
async function saveProgress() {
  try {
    // 1. Capture current state
    const currentState = captureState();
    
    // 2. Build save data
    const saveData = {
      version: SAVE_VERSION,
      timestamp: new Date().toISOString(),
      userProgress: {
        currentStage: currentState.stage,
        completedStages: currentState.completed,
        settings: currentState.settings
      },
      resumeData: {
        type: currentState.type,
        specificState: currentState.identifier
      }
    };
    
    // 3. Validate data
    if (!isValidSaveData(saveData)) {
      throw new Error('Invalid save data');
    }
    
    // 4. Serialize
    const serialized = JSON.stringify(saveData, null, 2);
    
    // 5. Write to file (platform-specific)
    await writeSaveFile(serialized);
    
    console.log('Save successful:', saveData.resumeData);
    return { success: true };
    
  } catch (error) {
    console.error('Save failed:', error);
    return { success: false, error };
  }
}
```

**Expected Result**: Save file created in appropriate location

---

### Step 3: Implement Resume Function

**Purpose**: Load and restore saved state

**Create Resume Function**:
```javascript
async function resumeProgress() {
  try {
    // 1. Read save file
    const saveFileContent = await readSaveFile();
    
    // 2. Parse and validate
    const saveData = JSON.parse(saveFileContent);
    
    if (!isValidSaveData(saveData)) {
      throw new Error('Invalid save file');
    }
    
    // 3. Check version compatibility
    if (saveData.version !== SAVE_VERSION) {
      // Migrate if needed
      saveData = migrateSaveData(saveData);
    }
    
    // 4. Restore state
    restoreUserProgress(saveData.userProgress);
    
    // 5. Resume from specific point
    const resumePoint = saveData.resumeData;
    
    switch (resumePoint.type) {
      case 'gameplay':
        resumeGameplay(resumePoint.specificState);
        break;
      case 'menu':
        showMenu();
        break;
      default:
        throw new Error(`Unknown resume type: ${resumePoint.type}`);
    }
    
    console.log('Resume successful:', resumePoint);
    return { success: true, resumeData: resumePoint };
    
  } catch (error) {
    console.error('Resume failed:', error);
    return { success: false, error };
  }
}
```

---

### Step 4: Implement State Capture

**Purpose**: Collect all necessary state data

**Helper Function**:
```javascript
function captureState() {
  return {
    stage: getCurrentStage(),
    type: getCurrentType(),           // 'gameplay', 'menu', etc.
    identifier: getStateIdentifier(), // Exact resume point
    completed: getCompletedStages(),
    settings: getUserSettings()
  };
}

function getStateIdentifier() {
  // Build specific identifier for exact resume point
  const stage = getCurrentStage();
  const checkpoint = getCurrentCheckpoint();
  
  return `${stage}_${checkpoint}`;
}
```

---

### Step 5: Add UI Integration

**Purpose**: Provide user-facing save/continue options

**Save & Exit Button**:
```javascript
function handleSaveAndExit() {
  // 1. Check if save is allowed
  if (!isSaveAllowed()) {
    showMessage('Cannot save at this point');
    return;
  }
  
  // 2. Save progress
  const result = await saveProgress();
  
  // 3. Handle result
  if (result.success) {
    showMessage('Progress saved');
    // 4. Exit to menu
    navigateToMenu();
  } else {
    showMessage('Save failed. Try again?');
  }
}
```

**Continue Button**:
```javascript
function handleContinue() {
  // 1. Check if save file exists
  if (!hasSaveFile()) {
    showMessage('No saved progress found');
    return;
  }
  
  // 2. Resume progress
  const result = await resumeProgress();
  
  // 3. Handle result
  if (result.success) {
    // Automatically continues to saved point
  } else {
    showMessage('Failed to load save. Starting new?');
  }
}
```

---

## ⚠️ Critical Pitfalls

### Pitfall 1: Saving During Restricted States

**Description**: Allowing save during states that can't be properly restored

**Symptom**: Resume loads but immediately crashes or behaves incorrectly

**Bad Example**:
```javascript
// No restrictions - can save anytime
function handleSave() {
  await saveProgress();  // ❌ Might save during transition
}
```

**Good Example**:
```javascript
function handleSave() {
  // Check if save is valid
  if (isInFailState() || isInTransition() || isInCutscene()) {
    showMessage('Cannot save right now');
    return;
  }
  
  await saveProgress();  // ✅ Only save in valid states
}

function isSaveAllowed() {
  const currentState = getCurrentState();
  
  // Disallow saves in:
  // - Fail states (user lost)
  // - Transitions (between states)
  // - Special events
  // - Loading screens
  
  return !currentState.endsWith('_fail') &&
         !currentState.includes('transition') &&
         !currentState.startsWith('event_') &&
         currentState !== 'loading';
}
```

**Why It Happens**: Easy to add save button without checking context

**Prevention**: Always validate state before saving

---

### Pitfall 2: Not Handling Missing Save Files

**Description**: Resume assumes save file exists

**Symptom**: Crash or error when user clicks Continue without existing save

**Bad Example**:
```javascript
function handleContinue() {
  const save = await readSaveFile();  // ❌ Crashes if no file
  resumeProgress(save);
}
```

**Good Example**:
```javascript
function handleContinue() {
  // Check existence first
  const exists = await saveFileExists();
  
  if (!exists) {
    showMessage('No saved progress');
    return;
  }
  
  try {
    const save = await readSaveFile();
    await resumeProgress(save);
  } catch (error) {
    showMessage('Save file corrupted');
    // Optionally offer to delete corrupted save
  }
}
```

---

### Pitfall 3: Forgetting to Update lastCompletedStage

**Description**: Save data doesn't track what user last successfully completed

**Symptom**: User resumes but progress seems incorrect

**Bad Example**:
```javascript
// Only saves current position, not what's completed
const saveData = {
  currentStage: getCurrentStage()  // ❌ Missing completion tracking
};
```

**Good Example**:
```javascript
// Track both position and completion
const saveData = {
  currentStage: getCurrentStage(),
  lastCompletedStage: getLastCompletedStage(),  // ✅ Track completion
  completedStages: getAllCompletedStages()      // ✅ Full history
};

// Update on success events
function handleStageSuccess() {
  const stage = getCurrentStage();
  updateCompletedStages(stage);
  updateLastCompleted(stage);
  // Now save data will include this completion
}
```

---

## ✅ Testing Checklist

### Basic Save/Load

- [ ] Save progress mid-session
- [ ] Exit application completely
- [ ] Relaunch application
- [ ] Click Continue
- [ ] Verify exact state restored

### Edge Cases

- [ ] Save when no previous save exists
- [ ] Save, then save again (overwrite)
- [ ] Continue with no save file (should show error)
- [ ] Save with corrupted data (should validate)
- [ ] Resume with different app version (migration)

### Restricted States

- [ ] Try saving during transition (should block)
- [ ] Try saving in fail state (should block)
- [ ] Try saving during special event (should block)
- [ ] Verify save allowed in normal gameplay

### Data Integrity

- [ ] All user settings preserved
- [ ] Progress tracking accurate
- [ ] No data loss on save/load cycle
- [ ] Timestamps correct

---

## 🎯 Performance Considerations

### Expected Performance

**Save operation**: < 100ms  
**Load operation**: < 200ms  
**File size**: < 10KB (typical)

### Optimization Tips

**Async Operations**:
```javascript
// Don't block UI during save
async function saveProgress() {
  showSavingIndicator();
  
  try {
    await writeSaveFile(data);
    showSaveSuccess();
  } finally {
    hideSavingIndicator();
  }
}
```

**Debounce Auto-Save**:
```javascript
// If implementing auto-save, debounce it
const debouncedSave = debounce(saveProgress, 5000);

// Call on state changes
function handleStateChange() {
  debouncedSave();
}
```

---

## 🔧 Code Templates

### Complete Save Function Template

```javascript
async function saveProgress() {
  try {
    // Capture
    const state = {
      version: '1.0',
      timestamp: new Date().toISOString(),
      progress: captureUserProgress(),
      resume: captureResumePoint()
    };
    
    // Validate
    if (!validate(state)) throw new Error('Invalid');
    
    // Serialize
    const json = JSON.stringify(state, null, 2);
    
    // Persist
    await fs.writeFile(SAVE_PATH, json);
    
    return { success: true };
  } catch (err) {
    console.error('Save error:', err);
    return { success: false, error: err };
  }
}
```

---

## 📊 Metrics & Validation

### Success Metrics

**Quantitative**:
- Save success rate: >99.5%
- Load success rate: >99%
- Average save time: <100ms
- Data integrity: 100%

**Qualitative**:
- User can save anytime (except restricted states)
- Resume feels seamless
- No lost progress

---

## 🔗 Related Documentation

### Within SCMS

- **L0 Memory**: `docs/memories/save-system-pattern.md`
- **L1 Pattern**: WORKSPACE_RULES.md → Save System
- **L3 Case Study**: `docs/case-studies/SAVE_SYSTEM_IMPLEMENTATION.md`

### External Resources

- File system APIs documentation
- JSON schema validation
- State management patterns

---

**Last Updated**: 2025-10-24  
**Maintained By**: Development Team  
**Review Frequency**: Monthly or when modified

---

*This example demonstrates a complete L2 SOP from a real project, showing how detailed procedures are documented once patterns reach 5+ uses.*
