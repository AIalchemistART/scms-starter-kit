# Failure Documentation as First Principles

**SCMS Core Principle**: Failures contain 10-100× more information than successes

---

## The Information Asymmetry

### Successes vs Failures

**Success**:
```
"This solution worked"
───────────────────────
Information: 1 bit (true/false)
Value: Confirms one path
```

**Failure**:
```
"This solution failed because:
- Assumption X was wrong
- Constraint Y wasn't considered  
- Interaction Z caused race condition"
─────────────────────────────────────────
Information: N bits (full causal model)
Value: Eliminates entire solution spaces
```

### Why Failures Are Higher Value

| Aspect | Success | Failure |
|--------|---------|---------|
| **Information** | 1 bit | N bits |
| **Scope** | One solution | Entire approach classes |
| **Generalization** | Limited | High |
| **Prevention** | None | Future errors eliminated |
| **Learning** | "Do this" | "Don't do this + why" |

**ROI**: One documented failure prevents 3-10 similar errors.

---

## Failure Documentation Pyramid

### Visual Hierarchy

```
        ╱▔▔▔▔▔▔▔▔▔▔▔▔╲
       ╱ Bug Patterns  ╲     ← L0: Highest value
      ╱ (Generalizable) ╲      (eliminates entire approaches)
     ╱▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁╲
    ╱  Anti-Patterns     ╲   ← L0: High value  
   ╱  (Design Lessons)    ╲    (guides architecture)
  ╱▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁╲
 ╱  Failed Approaches      ╲ ← L0: Medium value
╱  (Constraint Discovery)   ╲  (narrows solution space)
▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
     Edge Cases            ← L1: Project value
   (Specific Handling)       (implementation details)
```

### Level Definitions

#### Level 1: Bug Patterns (L0 - Highest Value)

**Definition**: Generalizable bug classes that recur across projects

**Characteristics**:
- Cross-project applicability
- Eliminates entire error categories
- Abstract principle, not specific implementation
- Highest ROI (prevents 10+ similar bugs)

**Template**:
```markdown
# [Bug Pattern Name]

**Level**: L0 Bug Pattern  
**Tags**: [bug-pattern, domain, concept]

## Pattern
[Abstract description of bug class]

## Why It Fails
[Root cause analysis - constraint violation]

## How to Detect
[Symptoms and warning signs]

## Correct Approach
[Alternative pattern that avoids the issue]

## Real Examples
- [Project A]: [Specific instance]
- [Project B]: [Similar manifestation]

## Prevention Checklist
- [ ] [Check 1]
- [ ] [Check 2]
```

**Real Example**:
```markdown
# Always-True Conditions in Validation Logic

**Level**: L0 Bug Pattern  
**Tags**: [bug-pattern, validation, logic-errors, boolean-algebra]

## Pattern
Validation logic that includes always-true conditions, making the
entire validation pass regardless of actual state.

## Why It Fails
**Root Cause**: Boolean short-circuit with || operator

\`\`\`typescript
// BUG: condition || true → always true
if (userInput.isValid || true) {
  processInput(userInput);  // Always executes
}
\`\`\`

Single boolean failure point eliminates entire condition branch.

## How to Detect
- Code review: Look for literal `true` in OR expressions
- Testing: Validation passes when it should fail
- Logic: Any `(X || true)` simplifies to `true`

## Correct Approach
\`\`\`typescript
// CORRECT: Only intended conditions
if (userInput.isValid) {
  processInput(userInput);
}

// Or explicit multi-condition:
if (userInput.isValid || userInput.isAdmin) {
  processInput(userInput);
}
\`\`\`

## Real Examples
- **Labyrinth Protocol**: QTE validation had `|| true` in completion check
- **Progress System**: Achievement unlock used `(progress >= 100 || true)`

## Prevention Checklist
- [ ] No literal `true` in OR expressions
- [ ] All conditions serve a purpose
- [ ] Test validation with failing cases
- [ ] Code review focuses on boolean logic

**Impact**: Prevented 4 similar bugs across 2 projects
```

---

#### Level 2: Anti-Patterns (L0 - High Value)

**Definition**: Design approaches that seem correct but fail systematically

**Characteristics**:
- Architectural-level lessons
- Not bugs, but flawed design patterns
- Guide overall system architecture
- High ROI (prevents redesigns)

**Template**:
```markdown
# [Anti-Pattern Name]

**Level**: L0 Anti-Pattern  
**Tags**: [anti-pattern, architecture, domain]

## The Pattern
[What the anti-pattern looks like]

## Why It Seems Right
[Intuitive appeal - why devs try this]

## Why It Fails
[Systematic failure mode]

## When It Breaks
[Conditions that expose the flaw]

## Correct Pattern
[Alternative architectural approach]

## Migration Path
[How to refactor from anti-pattern to correct pattern]

## Real Examples
- [Project]: [Consequence of using anti-pattern]
```

**Real Example**:
```markdown
# Progress Systems With Auto-Complete at 100%

**Level**: L0 Anti-Pattern  
**Tags**: [anti-pattern, progress-tracking, state-machines, initialization]

## The Pattern
Progress tracking systems that trigger completion when `progress >= 100`,
with progress initialized to 100 by default.

\`\`\`typescript
class ProgressSystem {
  progress: number = 100;  // Default value
  
  updateProgress() {
    if (this.progress >= 100) {
      this.complete();  // Triggers immediately!
    }
  }
}
\`\`\`

## Why It Seems Right
- "100% means complete" is intuitive
- Threshold check seems like clean logic
- Default of 100 seems "safe" (nothing to do)

## Why It Fails
**Terminal State Without Pre-Conditions**

The system auto-completes before any progress occurs because:
1. Default value (100) satisfies completion condition
2. No validation of initial state
3. Completion can occur before start

Result: Progress bars complete instantly, achievements unlock wrongly.

## When It Breaks
- On initialization (most common)
- After reset without state validation
- When loading saved progress (if saved at 100%)

## Correct Pattern
**Explicit State Machine with Pre-Conditions**

\`\`\`typescript
class ProgressSystem {
  progress: number = 0;  // Start at 0
  state: 'idle' | 'active' | 'complete' = 'idle';
  
  start() {
    this.state = 'active';
    this.progress = 0;
  }
  
  updateProgress(delta: number) {
    if (this.state !== 'active') return;  // Pre-condition
    
    this.progress += delta;
    
    if (this.progress >= 100) {
      this.complete();
    }
  }
  
  complete() {
    if (this.state !== 'active') return;  // Pre-condition
    this.state = 'complete';
    // ... completion logic
  }
}
\`\`\`

**Key Changes**:
1. Progress starts at 0 (not 100)
2. Explicit state machine (idle → active → complete)
3. Pre-conditions on state transitions
4. Can't complete without being active first

## Migration Path
1. Add state field to existing progress systems
2. Replace threshold checks with state checks
3. Add pre-conditions to all state transitions
4. Initialize to 0, not 100
5. Test initialization and reset paths

## Real Examples
- **Labyrinth Protocol**: Achievement system auto-completed on load
- **QTE System**: Progress bar filled instantly on component mount

**Impact**: Redesigned all progress tracking; prevented 5+ similar bugs
```

---

#### Level 3: Failed Approaches (L0 - Medium Value)

**Definition**: Implementation strategies that were tried but didn't work

**Characteristics**:
- Specific technical approaches
- Constraint discovery through failure
- Narrows solution space for future attempts
- Medium ROI (saves exploration time)

**Template**:
```markdown
# [Failed Approach Name]

**Level**: L0 Failed Approach  
**Tags**: [failed-approach, domain, technical-area]

## What We Tried
[Implementation strategy that was attempted]

## Why We Thought It Would Work
[Reasoning and assumptions]

## What Actually Happened
[Failure mode and symptoms]

## Root Cause
[Why the approach was fundamentally flawed]

## Constraints Discovered
[What we learned about the problem space]

## What Worked Instead
[Successful alternative approach]

## When This Approach Might Work
[Conditions where it could be valid, if any]
```

**Real Example**:
```markdown
# Event Listeners for QTE State Synchronization

**Level**: L0 Failed Approach  
**Tags**: [failed-approach, qte, state-sync, event-driven]

## What We Tried
Synchronize QTE state across components using event listeners:

\`\`\`typescript
// Component A: QTE Manager
class QTEManager {
  startQTE() {
    this.emit('qte:started', { id: this.qteId });
  }
  
  completeQTE() {
    this.emit('qte:completed', { result: this.result });
  }
}

// Component B: UI Controller
class UIController {
  constructor() {
    EventBus.on('qte:started', this.showQTE);
    EventBus.on('qte:completed', this.hideQTE);
  }
}
\`\`\`

## Why We Thought It Would Work
- Decoupling seemed clean
- Event-driven architecture is standard
- Easy to add more listeners
- React-friendly (event → state update)

## What Actually Happened
**Race Conditions and State Desync**

1. **Timing Issues**: Events fired in rapid succession
   - `qte:started` → UI shows
   - `qte:completed` → UI hides
   - But UI didn't finish showing yet → visual glitch

2. **Order Dependencies**: Multiple listeners with implicit ordering
   - ScoreManager must update before UIController
   - GameStateManager must update before both
   - No guaranteed order → random failures

3. **State Inconsistency**: Components had different views of QTE state
   - QTEManager: "completed"
   - UIController: "showing" (event not processed yet)
   - ScoreManager: "in-progress" (missed event)

## Root Cause
**Events Don't Model State Machines Well**

For critical timing-sensitive systems like QTE:
- State transitions have explicit pre-conditions
- Transitions must be atomic (all-or-nothing)
- Current state must be queryable
- Events are fire-and-forget (no state guarantee)

## Constraints Discovered
1. **QTE state is synchronous**: Components need immediate consistency
2. **Transitions are atomic**: Can't partially complete a QTE
3. **Pre-conditions matter**: Can't complete if not started
4. **Queries required**: "Is QTE active?" must be answerable

## What Worked Instead
**State Machine with Direct State Access**

\`\`\`typescript
// Single Source of Truth
class QTEStateMachine {
  private state: 'idle' | 'active' | 'completed' = 'idle';
  
  // Query current state
  isActive(): boolean {
    return this.state === 'active';
  }
  
  // Atomic transition with pre-conditions
  start(): boolean {
    if (this.state !== 'idle') return false;
    this.state = 'active';
    return true;
  }
  
  complete(): boolean {
    if (this.state !== 'active') return false;
    this.state = 'completed';
    return true;
  }
}

// Components query state directly
class UIController {
  update() {
    if (qteState.isActive()) {
      this.showQTE();
    } else {
      this.hideQTE();
    }
  }
}
\`\`\`

**Why This Works**:
- ✅ Single source of truth (no desync)
- ✅ Synchronous queries (always consistent)
- ✅ Atomic transitions (all-or-nothing)
- ✅ Pre-conditions enforced (can't complete if not active)

## When Event Listeners Might Work
Event listeners are still valid for:
- Non-critical state changes (analytics, logging)
- Async operations (API calls, file I/O)
- Fire-and-forget notifications
- Systems where eventual consistency is acceptable

**Do NOT use for**:
- Critical timing (QTE, combat, animation sync)
- State machines with pre-conditions
- Systems requiring immediate consistency

**Impact**: Switched QTE, combat, and dialogue to state machines; eliminated 20+ race conditions
```

---

#### Level 4: Edge Cases (L1 - Project Value)

**Definition**: Specific scenarios that need special handling in this project

**Characteristics**:
- Project-specific details
- Implementation-level handling
- Lower generalization (doesn't transfer to other projects)
- Project ROI (prevents specific bugs)

**Template**:
```markdown
# [Edge Case Name]

**Level**: L1 Edge Case  
**Project**: [Specific Project]  
**Tags**: [edge-case, component, specific-scenario]

## Scenario
[Specific edge case that occurs]

## Why It's Special
[What makes this case different from normal flow]

## Handling
\`\`\`typescript
[Specific code for handling this case]
\`\`\`

## Test Case
[How to reproduce and verify handling]

## Related
- [Link to L0 pattern this derives from, if any]
```

**Real Example**:
```markdown
# QTE Timeout During Component Unmount

**Level**: L1 Edge Case  
**Project**: Labyrinth Protocol  
**Tags**: [edge-case, qte-manager, lifecycle, react]

## Scenario
QTE timeout fires after the QTE component has been unmounted,
causing "Can't perform state update on unmounted component" error.

## Why It's Special
**React Lifecycle + Async Timing**

Normal flow:
1. QTE starts → setTimeout(30s)
2. User completes → component unmounts
3. Component gone ✓

Edge case:
1. QTE starts → setTimeout(30s)
2. User navigates away → component unmounts
3. 30s later → timeout fires → ERROR (component gone)

## Handling
\`\`\`typescript
class QTEManager extends React.Component {
  private timeoutId: NodeJS.Timeout | null = null;
  private mounted: boolean = false;
  
  componentDidMount() {
    this.mounted = true;
  }
  
  componentWillUnmount() {
    this.mounted = false;
    
    // Clean up timeout
    if (this.timeoutId) {
      clearTimeout(this.timeoutId);
      this.timeoutId = null;
    }
  }
  
  startQTE() {
    this.timeoutId = setTimeout(() => {
      // Check if still mounted before state update
      if (this.mounted) {
        this.handleTimeout();
      }
    }, 30000);
  }
  
  handleTimeout() {
    // Safe to update state - component is mounted
    this.setState({ timedOut: true });
    this.cancelQTE();
  }
}
\`\`\`

## Test Case
1. Start QTE
2. Wait 1 second (before timeout)
3. Navigate to different page (unmount component)
4. Wait 31 seconds (timeout would fire)
5. Verify: No error in console

## Related
- L0 Pattern: [QTE Systems Need Timeout Logic](qte-timeout-pattern.md)
- L1 Rule: QTE timeout implementation in WORKSPACE_RULES.md

**Impact**: Eliminated unmount errors in QTE system
```

---

## Documentation Workflow

### 1. Triage: Which Level?

```
Bug/Failure Discovered
         │
         ├─→ Generalizable across projects? → L0 Bug Pattern
         ├─→ Flawed design approach? → L0 Anti-Pattern  
         ├─→ Technical approach failed? → L0 Failed Approach
         └─→ Project-specific edge case? → L1 Edge Case
```

### Decision Tree

**Is it generalizable?**
- ✅ Yes → L0 (Bug Pattern, Anti-Pattern, or Failed Approach)
- ❌ No → L1 (Edge Case)

**L0 Distinction**:
- **Bug Pattern**: Recurring bug class (always-true conditions)
- **Anti-Pattern**: Flawed design pattern (auto-complete at 100%)
- **Failed Approach**: Technical strategy that didn't work (event listeners for state)

### 2. Document Immediately

**Don't wait to document failures!**

```
Bug Fixed → Document NOW → Save future time
    │
    └─→ Waiting risks forgetting details
```

**Capture while fresh**:
- What you tried
- Why it failed
- Root cause analysis
- What worked instead

### 3. Tag Appropriately

**L0 Tags**:
```yaml
# Bug Pattern
tags: [bug-pattern, domain, concept, error-type]

# Anti-Pattern  
tags: [anti-pattern, architecture, domain, design-issue]

# Failed Approach
tags: [failed-approach, domain, technical-area, constraint]
```

**L1 Tags**:
```yaml
# Edge Case
tags: [edge-case, component-name, scenario, project-name]
```

### 4. Link to Successes

**Failures illuminate successes**:
```markdown
# Success Document
... implementation that works ...

## Why This Works (Compared to Failed Approaches)
- Avoids [Failed Approach X] because [reason]
- Prevents [Bug Pattern Y] by [mechanism]
- Not [Anti-Pattern Z] because [distinction]
```

---

## Integration with Mind-Map Framework

### Failures Flow Through Levels

```
Failure Discovered
       │
       ├─→ L0 Failure Documentation
       │   ├─→ Bug Pattern (if generalizable bug)
       │   ├─→ Anti-Pattern (if design flaw)
       │   └─→ Failed Approach (if technical attempt)
       │
       ├─→ Natural Selection (2+ retrievals = validated)
       │
       └─→ L1 Edge Case (if project-specific)
              or
           L1 Prevention Rule (if concrete enforcement needed)
```

### Example Flow

1. **Bug**: QTE soft-lock when progress=100 on init
2. **L0 Anti-Pattern**: "Progress Systems With Auto-Complete at 100%"
3. **Validation**: Retrieved during 2 similar progress bugs
4. **L1 Rule**: "Validate progress ≠ 100 before enabling"
5. **Enforcement**: AI checks pre-conditions in all progress systems

---

## Success Metrics

### Quantitative

| Metric | Target | Meaning |
|--------|--------|---------|
| **Bug pattern captures** | 1 per 10 bugs | Generalization working |
| **Anti-patterns documented** | 1 per 3 redesigns | Design lessons captured |
| **Failed approaches tracked** | 1 per major attempt | Constraint discovery recorded |
| **Edge cases handled** | 100% | Project-specific coverage |
| **Prevention rate** | 3-10 bugs per pattern | ROI of documentation |

### Qualitative

- ✅ Similar bugs recognized before implementation
- ✅ Design decisions guided by anti-patterns
- ✅ Failed approaches not re-tried
- ✅ Edge cases handled proactively
- ✅ Team knowledge preserved (not in heads)

---

## Common Pitfalls

### ❌ Only Documenting Successes

**Problem**: No constraint information captured
```
Bad:  "QTE timeout works with 30s delay" (1 bit: true)
Good: "Event listeners for QTE state failed due to race conditions;
       state machines with direct queries work" (N bits: why, how, when)
```

### ❌ Vague Failure Descriptions

**Problem**: Future you doesn't understand
```
Bad:  "Event listeners didn't work"
Good: "Event listeners caused race conditions because QTE state
       transitions require synchronous consistency and atomic updates,
       which fire-and-forget events can't guarantee"
```

### ❌ Not Linking to Context

**Problem**: Isolated knowledge, no connection to successes
```
Bad:  Document failure standalone
Good: Link failure to successful alternative with comparative analysis
```

### ❌ Missing Root Cause

**Problem**: Symptom documented, but not the why
```
Bad:  "Progress bar filled instantly (bug)"
Good: "Progress initialized to 100 (terminal state) with no pre-condition
       validation, causing immediate completion on mount"
```

---

## Templates

### Quick Bug Pattern Template

```markdown
# [Name]
**Level**: L0 Bug Pattern
**Tags**: [bug-pattern, ...]

## Pattern
[What goes wrong]

## Why
[Root cause]

## Fix
[How to avoid]

## Examples
- [Project]: [Instance]

## Prevented
[Count of similar bugs caught]
```

### Quick Anti-Pattern Template

```markdown
# [Name]
**Level**: L0 Anti-Pattern
**Tags**: [anti-pattern, ...]

## Pattern
[Design that seems right]

## Failure
[Why it breaks]

## Correct
[Alternative approach]

## Migration
[How to refactor]
```

### Quick Failed Approach Template

```markdown
# [Name]
**Level**: L0 Failed Approach
**Tags**: [failed-approach, ...]

## Tried
[What we attempted]

## Failed
[What went wrong]

## Root Cause
[Why fundamentally flawed]

## Worked
[Successful alternative]
```

---

## Conclusion

Failures are your most valuable knowledge source:

- **10-100× information density** vs successes
- **Bug Patterns** eliminate entire error classes
- **Anti-Patterns** guide architectural decisions
- **Failed Approaches** narrow solution spaces
- **Edge Cases** prevent project-specific bugs

**Start documenting failures today** and watch your bug prevention rate skyrocket.

**Remember**: 
- Success says "do this" (1 bit)
- Failure says "don't do this, here's why, try this instead" (N bits)

The difference is ROI.

---

**See also**:
- [Mind-Map Framework](MIND_MAP_FRAMEWORK.md)
- [SCMS Whitepaper](../reference/WHITEPAPER.md#failure-documentation-as-first-principles)
- [Setup Guide](../../SETUP.md)
