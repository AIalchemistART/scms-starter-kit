# Workspace Rules: [Your Project Name]
## L1 Stable Validation Layer - Mandatory Quality Gates

**Project**: [Project Name]  
**Type**: [Project Type - Web App, API, Game, Mobile App, etc.]  
**Tech Stack**: [Primary Language/Framework]  
**SCMS Role**: **L1 Stable Validation** (deterministic enforcement layer)  
**Last Updated**: [Date]

**Purpose**: This file contains **VALIDATED patterns** that AI assistants MUST check before generating code. These aren't suggestions—they're enforced quality gates that passed L0 destructive validation (≥2 natural uses).

**How patterns arrive here**: L0 (Auto-memories/manual) → Natural reuse (≥2x) → Promotes to L1 (this file) → Becomes mandatory check

**For AI Assistants**: You MUST read this file at the start of each session and explicitly acknowledge relevant patterns when implementing code in those areas.

---

## 🎯 Core Architecture Principles

### [Your Primary Architecture Pattern]

**Pattern Description**:
[Describe your core architectural approach - e.g., MVC, microservices, event-driven, etc.]

**Why This Pattern**:
- [Reason 1]
- [Reason 2]
- [Reason 3]

**Example**:
```[language]
// Show your architecture in code
// This helps AI understand your patterns
```

---

## 📝 Validated Patterns (L1)

*This section auto-populates as patterns reach use_count ≥2*

### Pattern Template (Remove this when you add real patterns)

```markdown
### [Pattern Name] (Validated Pattern - Use Count: X)

**When to Use**: [Brief description of applicability]

**Pattern**:
```language
// Code example from actual implementations
```

**Known Edge Cases**:
- [List discovered during validation]

**Common Pitfalls**:
- [Issues encountered and solved]

**Related**: See [L2 SOP link] for detailed procedure
```

---

## 🎨 Code Style & Conventions

### Naming Conventions

**Files**:
- [e.g., kebab-case for files: `user-profile.js`]
- [e.g., PascalCase for components: `UserProfile.jsx`]

**Variables**:
- [e.g., camelCase for variables: `userName`]
- [e.g., UPPER_CASE for constants: `MAX_RETRY_COUNT`]

**Functions**:
- [e.g., camelCase for functions: `getUserProfile()`]
- [e.g., Descriptive verb-noun: `calculateTotal()`, `fetchUserData()`]

**Classes**:
- [e.g., PascalCase: `UserManager`]
- [e.g., Noun-based: `EmailService`, `DataValidator`]

### Import Organization

```[language]
// Example import order
// 1. External dependencies
import React from 'react';
import axios from 'axios';

// 2. Internal utilities
import { formatDate } from '@/utils';

// 3. Local components
import UserCard from './UserCard';

// 4. Styles
import styles from './App.module.css';
```

---

## 🧪 Testing Standards

### Test Coverage Requirements

**Minimum Coverage**:
- Unit tests: [e.g., 80%]
- Integration tests: [e.g., Required for API endpoints]
- E2E tests: [e.g., Critical user flows only]

### Test File Naming

```
src/
├── components/
│   ├── UserCard.jsx
│   └── UserCard.test.jsx  ← Test alongside component
├── utils/
│   ├── formatDate.js
│   └── formatDate.test.js  ← Test alongside utility
```

### Test Structure

```[language]
describe('[Component/Function Name]', () => {
  // Setup
  beforeEach(() => {
    // Common setup
  });
  
  // Happy path tests
  test('should [expected behavior]', () => {
    // Test implementation
  });
  
  // Edge cases
  test('should handle [edge case]', () => {
    // Test implementation
  });
  
  // Error cases
  test('should throw error when [invalid input]', () => {
    // Test implementation
  });
});
```

---

## 🗂️ Project Structure

```
project-root/
├── src/                   # Source code
│   ├── components/        # Reusable components
│   ├── pages/             # Page components (if applicable)
│   ├── utils/             # Utility functions
│   ├── services/          # API/service layer
│   ├── hooks/             # Custom hooks (React)
│   └── styles/            # Global styles
├── tests/                 # Test files (if separate)
├── docs/                  # Documentation (SCMS lives here)
│   ├── WORKSPACE_RULES.md # This file
│   ├── memories/          # L0 active memories
│   ├── sops/              # L2 detailed procedures
│   └── case-studies/      # L3 complete examples
├── public/                # Static assets
└── [config files]         # package.json, tsconfig, etc.
```

---

## ⚡ Performance Guidelines

### Critical Paths

**[Identify your critical paths]**:
- [e.g., Initial page load: <2s]
- [e.g., API response time: <200ms]
- [e.g., Search results: <500ms]

### Optimization Patterns

```[language]
// Example: Memoization pattern
const ExpensiveComponent = React.memo(({ data }) => {
  // Component implementation
});

// Example: Lazy loading
const HeavyComponent = lazy(() => import('./HeavyComponent'));
```

---

## 🔒 Security Considerations

### Authentication/Authorization

**Pattern**:
- [Describe your auth approach]
- [e.g., JWT tokens, session-based, OAuth, etc.]

### Input Validation

```[language]
// Always validate user input
function processUserInput(input) {
  // 1. Sanitize
  const sanitized = sanitizeInput(input);
  
  // 2. Validate
  if (!isValid(sanitized)) {
    throw new ValidationError('Invalid input');
  }
  
  // 3. Process
  return doSomething(sanitized);
}
```

### Sensitive Data

**Never**:
- ❌ Hardcode API keys, passwords, tokens
- ❌ Log sensitive user data
- ❌ Commit secrets to version control

**Always**:
- ✅ Use environment variables
- ✅ Redact sensitive data in logs
- ✅ Use .gitignore for secret files

---

## ⚠️ Common Pitfalls

*This section populated as issues are discovered*

### Pitfall Template (Remove when you add real pitfalls)

```markdown
### [Pitfall Name]

**Problem**: [What goes wrong]

**Symptom**: [How you know it's happening]

**Bad Example**:
```language
// Code that causes the problem
```

**Good Solution**:
```language
// Correct approach
```

**Why It Happens**: [Root cause explanation]
```

---

## 🔄 State Management

### [Your State Management Approach]

**Tool**: [e.g., Redux, Zustand, Context API, MobX, Vuex, etc.]

**Pattern**:
```[language]
// Example state management pattern
// Show how you handle state in your project
```

**When to Use Global State**:
- [Criterion 1]
- [Criterion 2]

**When to Use Local State**:
- [Criterion 1]
- [Criterion 2]

---

## 📡 API Patterns

### Request/Response Format

```[language]
// Standard API call pattern
async function fetchData(endpoint) {
  try {
    const response = await api.get(endpoint);
    return response.data;
  } catch (error) {
    handleError(error);
    throw error;
  }
}
```

### Error Handling

```[language]
// Consistent error handling
function handleAPIError(error) {
  if (error.response) {
    // Server responded with error
    console.error('API Error:', error.response.status);
  } else if (error.request) {
    // Request made but no response
    console.error('Network Error:', error.message);
  } else {
    // Something else went wrong
    console.error('Error:', error.message);
  }
}
```

---

## 🎯 Code Review Checklist

Before submitting PR/commit:

- [ ] Tests pass (`npm test` or equivalent)
- [ ] Code follows style guide
- [ ] No console.logs in production code
- [ ] Comments explain "why", not "what"
- [ ] Error handling in place
- [ ] No hardcoded values (use constants/config)
- [ ] Imports organized correctly
- [ ] No unused imports/variables
- [ ] Performance considerations addressed
- [ ] Security implications considered

---

## 🔗 Related Documentation

**INDEX.md (Knowledge Graph Hub)**: `docs/scms/INDEX.md` - **Central cross-reference source of truth**
- Groups patterns by topic tags (e.g., `#rendering`, `#api`, `#testing`)
- Links related patterns across layers (L0/L1/L2/L3)
- Updated during session closure (L5 audit)

**L0 Memories**: `docs/memories/` - Active pattern validation candidates

**L2 SOPs**: `docs/sops/` - Detailed implementation procedures

**L3 Case Studies**: `docs/case-studies/` - Complete examples

**Global Rules**: `rules/GLOBAL_CODING_RULES.md` - Universal best practices

---

## 🏷️ Tagging System

**All patterns in this file should include topic tags for cross-referencing:**

```markdown
### [Pattern Name] (Validated Pattern - Use Count: X)
**Tags:** #[topic] #[category]

[Pattern details...]
```

**Example Tags:**
- **Technology**: `#react` `#nodejs` `#postgresql` `#graphql`
- **Domain**: `#api` `#ui` `#database` `#auth` `#testing`
- **Type**: `#architecture` `#performance` `#security` `#workflow`

**Why Tags Matter:**
- Enables fast pattern retrieval in `INDEX.md` by theme
- Creates semantic connections between related patterns
- Supports AI retrieval during development

---

## 📊 SCMS Integration

This file is **Layer 1** (L1) in the SCMS hierarchy:

**Auto-Updated By**:
- AI assistant when pattern reaches use_count ≥2
- Manual addition when explicitly requested

**Promotion From**: L0 memories (docs/memories/)

**Promotes To**: L2 SOPs (docs/sops/) when pattern hits 5+ uses

**Review Frequency**: Weekly (check for patterns ready to promote)

---

## 🚀 Getting Started (For New Team Members)

1. **Read Global Rules**: Start with `rules/GLOBAL_CODING_RULES.md`
2. **Understand Architecture**: Review "Core Architecture Principles" above
3. **Setup Environment**: Follow project README
4. **Review Patterns**: Scan "Validated Patterns" section
5. **Check SOPs**: Browse `docs/sops/` for detailed procedures
6. **Ask Questions**: When in doubt, check memories or ask team

---

## 📝 Maintenance

**Update This File When**:
- Pattern validated (≥2 uses)
- New pitfall discovered
- Architecture decision made
- Convention changes

**Owner**: [Team/Person responsible]

**Review Schedule**: [e.g., Weekly, Monthly, Per Sprint]

---

**Last Updated**: [Date]  
**Version**: 1.0  
**Status**: ✅ Active

---

## Template Instructions (Remove This Section)

**To Use This Template**:

1. **Replace placeholders** in square brackets [like this]
2. **Fill in your project details** (name, tech stack, architecture)
3. **Add your coding conventions** (naming, imports, testing)
4. **Define your project structure**
5. **Remove this "Template Instructions" section**
6. **Start documenting patterns** as they're validated (≥2 uses)

**This file will grow** as your project develops and SCMS captures validated patterns.

**Remember**: This is Layer 1 (quick reference). For detailed procedures, create L2 SOPs in `docs/sops/`.
