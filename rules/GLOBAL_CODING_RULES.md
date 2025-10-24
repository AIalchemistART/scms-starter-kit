# Global Coding Rules (Universal)

**Purpose**: Universal best practices that apply to ALL projects using SCMS.

**Status**: Use these rules across all your projects. Add project-specific rules to WORKSPACE_RULES.md.

---

## Core Principles

### 1. ⚡ DRY (Don't Repeat Yourself)

**Principle**: Reuse existing functionality wherever possible.

**Why**: Prevents technical debt and promotes long-term maintainability.

**Apply When**:
- Writing new code
- Refactoring existing code
- Discovering similar patterns

**Bad**:
```javascript
// User profile formatting - duplicated everywhere
function formatUserProfile1(user) {
  return `${user.firstName} ${user.lastName} (${user.email})`;
}

function formatUserProfile2(user) {
  return `${user.firstName} ${user.lastName} (${user.email})`;
}
```

**Good**:
```javascript
// Single reusable function
function formatUserProfile(user) {
  return `${user.firstName} ${user.lastName} (${user.email})`;
}

// Use everywhere
const profile1 = formatUserProfile(user1);
const profile2 = formatUserProfile(user2);
```

---

### 2. 🧪 Test Before Change

**Principle**: Run existing tests before making modifications.

**Why**: Catch regressions early, ensure changes don't break existing functionality.

**Apply When**:
- Modifying existing code
- Adding new features that touch existing systems
- Refactoring

**Workflow**:
```bash
# 1. Run tests BEFORE changes
npm test  # or your test command

# 2. Make changes

# 3. Run tests AFTER changes
npm test

# 4. Add new tests for new functionality
```

**Never**:
- Skip testing because "it's a small change"
- Delete tests without explicit approval
- Weaken test coverage

---

### 3. 🔒 Avoid Unnecessary Refactors

**Principle**: Do not change patterns or architecture of working features unless explicitly directed.

**Why**: Major refactors create risk and regression bugs.

**When Refactoring IS Appropriate**:
- ✅ Code is difficult to understand/maintain
- ✅ Performance issues identified
- ✅ Technical debt blocking new features
- ✅ Explicit request/approval for refactor

**When Refactoring IS NOT Appropriate**:
- ❌ "I don't like this style" (subjective preference)
- ❌ "This could be written differently" (no tangible benefit)
- ❌ "I want to try a new pattern" (experimentation on working code)

**Good Refactor**:
```javascript
// Before: 200-line function, hard to test
function processOrder(order) {
  // ... 200 lines of mixed concerns ...
}

// After: Separated concerns, testable
function validateOrder(order) { /* ... */ }
function calculateTotal(order) { /* ... */ }
function saveOrder(order) { /* ... */ }

function processOrder(order) {
  validateOrder(order);
  const total = calculateTotal(order);
  return saveOrder(order);
}
```

---

### 4. 🎭 Mock Data Only for Testing

**Principle**: Mock data should **never** enter dev or production environments.

**Why**: Protects data integrity and runtime safety.

**Apply When**:
- Writing unit tests
- Writing integration tests
- Creating test fixtures

**Never**:
- Use mock data in development database
- Ship mock data to production
- Mix mock and real data

**Good Pattern**:
```javascript
// test/fixtures/users.js
export const mockUsers = [
  { id: 'test-1', name: 'Test User 1', email: 'test1@example.com' },
  { id: 'test-2', name: 'Test User 2', email: 'test2@example.com' },
];

// test/user.test.js
import { mockUsers } from './fixtures/users';

test('formats user correctly', () => {
  const formatted = formatUser(mockUsers[0]);
  expect(formatted).toBe('Test User 1 (test1@example.com)');
});
```

**Bad Pattern**:
```javascript
// src/database.js - NEVER DO THIS
if (process.env.NODE_ENV === 'development') {
  // Inserting mock data into dev database
  db.users.insert(mockUsers);  // ❌ NO!
}
```

---

### 5. 🧹 Keep the Codebase Clean & Organized

**Principle**: Essential for readability, collaboration, and AI tool effectiveness.

**Why**: Clean code is easier to understand, modify, and maintain.

**Apply Always**:
- Remove commented-out code (use git history instead)
- Delete unused files
- Organize imports
- Consistent formatting
- Meaningful names

**Before Commit**:
```javascript
// ❌ Messy
import { useState, useEffect } from 'react';
import axios from 'axios';
// import moment from 'moment';  // Not using this
import _ from 'lodash';

function MyComponent() {
  // const [oldState, setOldState] = useState(null); // Old code
  const [data, setData] = useState(null);
  
  // ... implementation
}
```

**After Cleanup**:
```javascript
// ✅ Clean
import { useState, useEffect } from 'react';
import axios from 'axios';
import _ from 'lodash';

function MyComponent() {
  const [data, setData] = useState(null);
  
  // ... implementation
}
```

---

### 6. 🤔 Consider Code Impact

**Principle**: Always think about how changes affect other areas.

**Why**: Prevents unintended bugs and cascading failures.

**Before Changing**:
- Check for dependencies (what calls this function?)
- Review related code (what else might break?)
- Search codebase for usage (grep/find references)
- Update documentation when behavior changes

**Example**:
```javascript
// You want to change this function
function calculateDiscount(price, percent) {
  return price * (percent / 100);
}

// BEFORE changing, ask:
// 1. Where is this used? (search: calculateDiscount)
// 2. Will the change break existing calls?
// 3. Do tests cover the new behavior?
// 4. Should I create a new function instead?
```

---

### 7. 🎯 Stay Task-Focused

**Principle**: Only modify code relevant to the current task.

**Why**: Reduces scope creep and risk.

**Apply When**:
- Working on specific feature/bug
- Reviewing code changes
- Planning implementation

**Avoid**:
- "While I'm here" changes
- Unrelated refactoring
- Fixing unrelated bugs (document separately)

**Good**:
```
Task: "Fix login button alignment"
Changes:
- login-button.css (alignment fix)
```

**Bad**:
```
Task: "Fix login button alignment"
Changes:
- login-button.css (alignment fix)
- header.css (unrelated style changes) ❌
- utils.js (unrelated refactor) ❌
- footer.css ("while I'm here" fix) ❌
```

**Better Approach**:
```
Task: "Fix login button alignment"
Changes:
- login-button.css (alignment fix)

Notes for later:
- TODO: Fix header spacing issue
- TODO: Refactor utils.js date functions
- TODO: Footer links need better styling
```

---

## SCMS-Specific Rules

### Pattern Capture (L0 Memory)

**When to Create**:
- Novel pattern discovered
- Edge case encountered
- Optimization found
- Solution to non-obvious problem

**How to Create** (with recursive docs):
- Automatic after every implementation

**How to Create** (manual):
- Ask: "Document this pattern as L0 memory"

**Memory Format**:
```markdown
## Memory: [Pattern Name]

**Status**: ⏳ CANDIDATE
**Use Count**: 1
**First Used**: YYYY-MM-DD
**Tags**: [category, tech, pattern-type]

**Pattern**: [Clear description]

**Code Example**:
```language
// Working code snippet
```

**Validation**: [How to verify it works]
```

---

### Pattern Validation

**Criteria for VALIDATED Status**:
- ✅ Pattern works in real implementation
- ✅ Edge cases documented
- ✅ Tested by developer
- ✅ No obvious issues

**Mark as VALIDATED when**:
- Developer confirms: "Works great!"
- Pattern used successfully in testing

**Keep as CANDIDATE when**:
- Still testing
- Issues discovered
- Needs revision

---

### Documentation Promotion

**L0 → L1 (WORKSPACE_RULES)**:
- Threshold: Use count ≥ 2
- Trigger: Pattern reused successfully
- Action: Add to WORKSPACE_RULES.md

**L1 → L2 (SOP)**:
- Threshold: Use count ≥ 5
- Trigger: Pattern needs detailed procedure
- Action: Create dedicated SOP document

**L2 → L3 (Case Study)**:
- Threshold: Feature demonstrates multiple patterns
- Trigger: Milestone completion
- Action: Create case study with narrative

---

## Project-Specific Rules

**Add these to WORKSPACE_RULES.md**:

### Language/Framework Conventions
- Python: PEP 8
- JavaScript: ESLint config
- TypeScript: Strict mode
- React: Hooks patterns
- etc.

### Architecture Decisions
- API design patterns
- Database schema conventions
- State management approach
- Testing strategy

### Team Conventions
- Branch naming
- Commit message format
- PR description template
- Code review checklist

---

## Enforcement

### Human Review
- Code reviews check against these rules
- Pull request template includes checklist
- Team discussions reference these principles

### Automated Tools
- Linters enforce formatting (ESLint, Pylint, etc.)
- Pre-commit hooks check tests
- CI/CD pipeline validates builds

### AI Assistant
- These rules provided to AI in every session
- AI references when making suggestions
- AI flags violations during implementation

---

## When to Break These Rules

**Rules are guidelines, not laws.**

**Okay to deviate when**:
- ✅ Explicit business requirement
- ✅ Performance critical situation
- ✅ External constraint (legacy system, third-party API)
- ✅ Team consensus on better approach

**Document exceptions**:
```javascript
// Breaking DRY principle here because performance critical
// Inlining this function saves 50ms on hot path
// See: performance-analysis.md for details
function inlinedCalculation(x) {
  // ... duplicated code with reason ...
}
```

---

## Related Documents

- **WORKSPACE_RULES.md** - Project-specific rules
- **00_DOCUMENTATION_HIERARCHY.md** - How SCMS layers work
- **RECURSIVE_DOCUMENTATION.md** - Automated documentation workflow

---

**These rules apply universally across all SCMS projects.**

Project-specific rules go in WORKSPACE_RULES.md.
