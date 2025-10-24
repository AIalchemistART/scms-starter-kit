# Workspace Rules: Example Project

**Project**: Example Interactive Application  
**Type**: Web Application (React + Electron)  
**Tech Stack**: React 18, Electron, JavaScript  
**Last Updated**: 2025-10-24

*This is an example WORKSPACE_RULES.md showing validated patterns from a real project (sanitized)*

---

## 🎯 Core Architecture Principles

### Event-Driven State Management

**Pattern**: Centralized state with event-driven updates

```javascript
// Centralized state manager
const [appState, setAppState] = useState({
  currentScreen: 'menu',
  userProgress: {},
  settings: {}
});

// Event-driven updates
function handleUserAction(action) {
  setAppState(prev => ({
    ...prev,
    ...processAction(action)
  }));
}
```

**Why**: Predictable state flow, easy debugging, single source of truth

---

## 📝 Validated Patterns (L1)

### Exception Handling for Resource Loading (Validated Pattern - Use Count: 3)

**When to Use**: Loading external resources (videos, images, audio) that may have timing inconsistencies

**Pattern**:
```javascript
// Global pattern: Preload resource with optional seek
function handleResourceLoaded(resource) {
  markTransition('resource:onLoadedData');
  
  // Preload seek (skip intro frames) - works for MOST resources
  if (resource.currentTime === 0 && !EXCEPTIONS.includes(resource.id)) {
    resource.currentTime = 0.20; // Skip first 200ms
  }
}

// Exception handling: Test each resource independently
const EXCEPTIONS = ['resource_003'];  // Found to cause time jumps

// For exceptions, disable preload seek
function handleResource003Loaded() {
  markTransition('resource_003:onLoadedData:noPrerollSeek');
  // No seek - exception for this specific resource
}
```

**Known Edge Cases**:
- resource_003: 1-second time jump observed when preroll seek applied
- Solution: Disable for specific resource, keep global pattern

**Related**: See [Resource Loading SOP](../sops/RESOURCE_LOADING_SOP.md)

---

### Multi-Step User Interaction Safety (Validated Pattern - Use Count: 5)

**When to Use**: Interactive sequences that can be paused/resumed mid-flow

**Pattern** (Three-Layer Defense):

**Layer 1 - Guard Transitions**:
```javascript
const sid = sessionIdRef.current;
setTimeout(() => {
  if (sid !== sessionIdRef.current) return; // Stale session
  if (pausedRef.current) return; // Paused check - critical!
  
  interactionStartedRef.current = false;
  startNextInteraction();
}, 1970);
```

**Layer 2 - Resume Detection**:
```javascript
// In resumeInteraction() - catch up if paused after delay
if (currentStep === 'step_1' && !active && completedRef.current) {
  const currentTime = getElapsedTime();
  const stepIndex = currentStepIndexRef.current;
  
  if (stepIndex === 0 && currentTime >= 4.8) {
    interactionStartedRef.current = false;
    startNextInteraction();
  }
}
```

**Layer 3 - Natural Progression Fallback**:
```javascript
// In requestAnimationFrame loop
if (elapsedTime >= 4.8 && 
    currentStepIndex === 0 && 
    stepCompletedRef.current) {
  startNextInteraction();
}
```

**Why All Three Needed**:
- Different pause timings require different handling
- Before setTimeout: Layer 1 prevents
- During delay: Layer 2 detects and catches up
- After delay: Layer 3 natural progression

**Common Pitfalls**:
- Missing pause check in setTimeout: Causes immediate fail on resume
- Forgetting resume detection: User pauses mid-delay, gets stuck
- No rAF fallback: Edge case where setTimeout doesn't fire

---

### Special State Variants (Validated Pattern - Use Count: 4)

**Standard Naming**: Failure states typically use `*_fail` suffix (e.g., `interaction_fail`, `process_fail`)

**Multi-Outcome Exception**: Additional failures use sequential numbers beyond standard

**Example**:
```javascript
// Standard: One failure outcome
'process_01' → success or 'process_fail'

// Exception: Multiple failure outcomes  
'interaction_01' → success or 'interaction_fail_01' or 'interaction_fail_02'

// Detection pattern - MUST explicitly check special cases
const isFailState = stateName.endsWith('_fail') || 
                    stateName === 'interaction_fail_02';
```

**When to Create Special Fail States**:
- Multi-step interactions with 3+ outcomes
- Each failure needs distinct handling path
- Prevents collision with standard `_fail` naming

**Required Updates** when adding special fail states:
1. State management: Add to valid states list
2. Recovery logic: Add explicit check (doesn't match standard pattern)
3. Routing: Use index-based logic to determine correct state
4. Transition map: Add entry (e.g., `'interaction_01→interaction_fail_02'`)
5. Handlers: Create specific handlers for special state
6. Preload: Call preparation for special state from source state

---

### Dual State Tracking for Time-Critical Operations (Validated Pattern - Use Count: 6)

**When to Use**: Operations where timing is critical and state must be checked synchronously

**Pattern**:
```javascript
// ALWAYS use dual-state: ref (immediate) AND state (UI)
const operationCompletedRef = useRef(false);  // Immediate truth
const [operationResult, setOperationResult] = useState(null);  // UI state

// On operation start
operationCompletedRef.current = false;

// On operation success
operationCompletedRef.current = true;  // Set ref immediately
setOperationResult('success');  // UI updates (may batch)

// In pause logic - check ref, not state
function handlePause() {
  if (active && !operationResult && !operationCompletedRef.current) {
    // Pause logic
  }
}

// Clear ref when appropriate
operationCompletedRef.current = false;
```

**Why Both Needed**:
- **Ref**: Instant synchronous truth for logic checks
- **State**: Batched UI updates (React may delay)

**Common Pitfall**: Using only state → race conditions in pause/resume

**Related**: React batching behavior, timing-sensitive operations

---

## ⚠️ Common Pitfalls

### Pitfall: Inconsistent Timing in Multi-Step Flows

**Problem**: User action triggers multi-step flow, but timing calculations done separately for each step

**Symptom**: Transitions feel inconsistent, sometimes fast, sometimes slow

**Bad Example**:
```javascript
// Each step calculates its own timing
setTimeout(() => step1(), calculateDelay());  // Different each time
setTimeout(() => step2(), calculateDelay());  // Different each time
```

**Good Solution**:
```javascript
// Calculate all timings upfront based on base time
const baseTime = Date.now();
const step1Time = baseTime + 1000;
const step2Time = baseTime + 3000;

setTimeout(() => step1(), 1000);
setTimeout(() => step2(), 3000);
```

**Why It Happens**: Function calls at different times get different timestamps

---

### Pitfall: Forgetting to Reset Index Between Loops

**Problem**: Multi-step process doesn't reset counter on restart

**Symptom**: Second playthrough starts at wrong step

**Bad Example**:
```javascript
// Start process
function startProcess() {
  // Missing: currentStepIndex = 0
  startStep();
}
```

**Good Solution**:
```javascript
function startProcess() {
  currentStepIndexRef.current = 0;  // Always reset
  startStep();
}

// Also reset in play/restart handlers
function handleProcessPlay() {
  currentStepIndexRef.current = 0;
  // ... rest of handler
}
```

**Why It Happens**: Easy to forget reset when adding restart functionality

---

## 🎯 Performance Guidelines

### Critical Paths

**Resource Loading**: <2s for initial load  
**State Transitions**: <100ms response time  
**User Interactions**: <50ms input lag

### Optimization Patterns

```javascript
// Memoize expensive calculations
const processedData = useMemo(() => {
  return expensiveProcessing(data);
}, [data]);

// Lazy load resources
const HeavyComponent = lazy(() => import('./HeavyComponent'));

// Preload next states
useEffect(() => {
  if (currentState === 'loading') {
    preloadNextState('main');
  }
}, [currentState]);
```

---

## 🔒 Security Considerations

### Input Validation

```javascript
// Always validate user input
function processUserInput(input) {
  // 1. Sanitize
  const sanitized = sanitizeInput(input);
  
  // 2. Validate
  if (!isValid(sanitized)) {
    throw new ValidationError('Invalid input');
  }
  
  // 3. Process
  return handleInput(sanitized);
}
```

### Sensitive Data

**Never**:
- ❌ Hardcode API keys or tokens
- ❌ Log sensitive user data
- ❌ Commit secrets to version control

**Always**:
- ✅ Use environment variables
- ✅ Redact sensitive data in logs
- ✅ Keep .env in .gitignore

---

## 🔄 State Management

### Current Approach: useState + useRef

**Pattern**:
```javascript
// UI state
const [currentScreen, setCurrentScreen] = useState('menu');

// Synchronous state (for timing-critical checks)
const pausedRef = useRef(false);

// Complex state
const [appState, setAppState] = useState({
  screen: 'menu',
  progress: {},
  settings: {}
});
```

**When to Use Ref vs State**:
- **Ref**: Needs instant synchronous access (pause checks, timing)
- **State**: Drives UI updates (screen changes, display)

---

## 🧪 Testing Standards

### Test Coverage Requirements

**Minimum Coverage**:
- Unit tests: 70%
- Integration tests: Critical paths only
- Manual tests: All user-facing features

### Test Structure

```javascript
describe('Component/Feature', () => {
  // Setup
  beforeEach(() => {
    // Common setup
  });
  
  // Happy path
  test('should handle expected case', () => {
    // Test
  });
  
  // Edge cases
  test('should handle edge case', () => {
    // Test
  });
  
  // Error cases
  test('should handle error gracefully', () => {
    // Test
  });
});
```

---

## 🔗 Related Documentation

**L0 Memories**: `docs/memories/` - Active pattern validation candidates

**L2 SOPs**: 
- `docs/sops/RESOURCE_LOADING_SOP.md` - Complete resource handling guide
- `docs/sops/MULTI_STEP_INTERACTION_SOP.md` - Multi-step flow implementation

**L3 Case Studies**: 
- `docs/case-studies/COMPLEX_INTERACTION_CASE_STUDY.md` - Real example

**Global Rules**: `rules/GLOBAL_CODING_RULES.md` - Universal best practices

---

## 📊 SCMS Integration

This file is **Layer 1** (L1) in the SCMS hierarchy.

**Auto-Updated By**: AI assistant when pattern reaches use_count ≥2

**Promotion From**: L0 memories (`docs/memories/`)

**Promotes To**: L2 SOPs (`docs/sops/`) when pattern hits 5+ uses

**Review Frequency**: Weekly

---

**Last Updated**: 2025-10-24  
**Version**: 1.3  
**Status**: ✅ Active

---

*This example demonstrates what validated patterns look like in a real project using SCMS. Patterns are proven through repeated use before documenting here.*
