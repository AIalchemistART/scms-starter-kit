# SCMS Pattern Index

**Project:** [Your Project Name]  
**Last Updated:** [Auto-updated during session closure]  
**Active Patterns:** 0  
**Promoted to L1:** 0

---

## 🎯 Purpose

This index tracks all L0 patterns (active testing) with tags, cross-references, and usage counts. It serves as the **organizational framing** for pattern discovery and validation.

**Key Principles:**
- This is NOT a visual mind-map diagram
- This IS tags, cross-references, and semantic coherence
- Maintains clear L0/L1/Dashboard boundaries
- Updated during session closure (not real-time)

---

## 📊 Pattern Status Overview

| Status | Count | Description |
|--------|-------|-------------|
| **L0 Active** | 0 | Under testing (< promotion threshold) |
| **Promoted to L1** | 0 | Validated in WORKSPACE_RULES.md |
| **L2 SOPs** | 0 | Detailed procedures (5+ uses) |
| **L3 Case Studies** | 0 | Complete examples |
| **Total Patterns** | 0 | All tracked patterns |

---

## 📚 L0 Patterns (Active Testing)

<!-- Add patterns here as they emerge during development -->
<!-- Format: ### Pattern Name (n=X uses, tags: tag1, tag2) -->

### Example: API Error Handling Pattern (n=2 uses, tags: error-handling, api, resilience)

**Description:** Retry logic with exponential backoff for API calls

**Status:** L0 (Testing - needs 1 more use for L1 promotion at n=3)

**Files:**
- `src/utils/apiClient.js` - Implementation
- `tests/apiClient.test.js` - Test coverage

**Related Patterns:**
- See: Logging Strategy (cross-cutting concern)
- See: Timeout Configuration (complementary)

**Validation History:**
- 2025-11-17: Initial implementation (Feature A)
- 2025-11-18: Reused in Feature B (n=2)

**Notes:**
- Works well for transient network errors
- May need adjustment for rate limiting scenarios

---

<!-- Add more L0 patterns here as discovered -->

---

## 🏆 L1 Patterns (Validated & Enforced)

Patterns promoted to L1 are moved to `WORKSPACE_RULES.md` but listed here for reference.

<!-- Auto-updated during promotion -->

### Example: Multi-Edit Batch Operations (L1 - 5 uses)

**Location:** `WORKSPACE_RULES.md` (Lines 10-50)

**Tags:** multi-file, atomic-changes, coordination

**Promotion Date:** 2025-11-17

**Use Count:** 5 (exceeded threshold of 3)

**Cross-References:**
- Used by: Setup Script Integration
- Related: Git Commit Strategy
- Documented in: docs/patterns/multi-edit.md (if exists)

---

## 🔗 Cross-Reference Map

### By Technology
- **Frontend:** (none yet)
- **Backend:** (none yet)
- **Database:** (none yet)
- **Testing:** (none yet)

### By Concern
- **Error Handling:** API Error Handling (L0, n=2)
- **Performance:** (none yet)
- **Security:** (none yet)
- **UI/UX:** (none yet)

### By File
<!-- Links patterns to specific files for quick lookup -->
- `src/utils/apiClient.js`: API Error Handling (L0)
- (more entries added during session closure)

---

## 📊 Usage Statistics

### Retrieval Ratio
- **Current Session:** 0% (calculated during session closure)
- **Project Average:** 0% (updated after each session)
- **Target:** 30-50% (retrieval over generation)

### Pattern Lifecycle
- **Patterns Created:** 0
- **Patterns Promoted (L0→L1):** 0
- **Patterns Documented (L1→L2):** 0
- **Patterns Archived:** 0

---

## 🎯 Promotion Candidates

<!-- Patterns approaching promotion threshold -->

### Near L1 Promotion (n ≥ threshold - 1)
- (none yet)

### Near L2 Documentation (n ≥ 4)
- (none yet)

---

## 🗑️ Archived Patterns

<!-- Patterns that didn't validate or became obsolete -->

### Example: Initial Caching Strategy (archived 2025-11-15)
- **Reason:** Replaced by better approach
- **Learning:** Don't cache at component level, use global state
- **Documented in:** Failures section of session notes

---

## 🔄 Update Log

<!-- Auto-populated during session closure -->

- **2025-11-17:** Index initialized (greenfield project)
- (session closure updates added here)

---

## 📝 Usage Instructions

### During Development
- **DON'T** update this file manually during work
- **DO** note patterns you discover for session closure
- **DO** reference existing patterns via "Retrieved [pattern] (n=X)"

### During Session Closure
1. Add new L0 patterns discovered
2. Increment usage counts for reused patterns
3. Promote patterns at threshold (default: n=3)
4. Update cross-references
5. Calculate retrieval ratio
6. Move promoted patterns to WORKSPACE_RULES.md

### Finding Patterns
- Search by tag: `Ctrl+F` + `tags: [your-tag]`
- Search by file: Check "By File" section
- Search by concern: Check "By Concern" section

---

## 🎓 Pattern Tagging Guide

**Good tags:**
- Technology: `react`, `nodejs`, `postgresql`
- Concern: `error-handling`, `performance`, `security`
- Scope: `api`, `ui`, `database`, `testing`
- Type: `pattern`, `anti-pattern`, `edge-case`

**Avoid:**
- Vague tags: `misc`, `utils`, `general`
- Too specific: `button-click-handler-for-login-page`
- Duplicates: `error` vs `error-handling`

---

## 🚀 Quick Reference

**Check patterns before coding:**
```
You (to AI): "Check INDEX.md for [technology/concern] patterns"
AI: Searches and cites relevant patterns
```

**Report pattern usage:**
```
You (to AI): "Using API Error Handling pattern (n=2→3)"
AI: Notes for session closure update
```

**Promote pattern:**
```
AI: "PROMOTED: [Pattern] to WORKSPACE_RULES.md (validated at n=3)"
AI: Updates INDEX.md and WORKSPACE_RULES.md
```

---

## 📚 Related Files

- **L1 Patterns:** `WORKSPACE_RULES.md`
- **L2 SOPs:** `docs/sops/` (when created)
- **L3 Case Studies:** `docs/case-studies/` (when created)
- **L4 Global Rules:** `rules/GLOBAL_CODING_RULES.md` (if exists)
- **Session Status:** `SESSION_STATUS.txt`
- **Memory Dashboard:** `MEMORY_STATUS_DASHBOARD.md`

---

**Remember:** This index is organizational framing, not a visual diagram. It maintains semantic coherence through tags and cross-references, enabling efficient pattern retrieval and validation tracking.
