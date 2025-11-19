# WORKSPACE_RULES.md - L1 Validated Patterns

**Purpose:** MANDATORY quality gates validated through 2+ uses. These are enforced patterns, not optional suggestions.

**Version:** 1.0  
**Last Updated:** November 17, 2025

---

## 🎯 L1 VALIDATED PATTERNS

### **Multi-Edit Batch Operations Pattern**

**Status:** ✅ L1 Validated (3+ uses, production-proven)  
**Promotion Date:** November 17, 2025  
**Last Validation:** November 17, 2025 (Dashboard improvements)  
**Validation:** Used for whitepaper terminology + dashboard tracking + system health tab

---

#### **When to Use:**
- Multiple related changes to the same file
- Sequential edits with dependencies between them
- Batch terminology updates across sections
- Feature additions requiring coordinated CSS + HTML + JavaScript changes
- Any scenario where changes must be atomic (all succeed or all fail)

---

#### **When NOT to Use:**
- Single isolated change (use regular `edit` tool)
- Changes to multiple different files (make separate tool calls)
- Edits where order doesn't matter (can use parallel edits)
- Exploratory changes (use incremental approach)

---

#### **Implementation Pattern:**

```javascript
multi_edit({
  file_path: "/absolute/path/to/file.ext",
  explanation: "Brief description of all changes being made",
  edits: [
    {
      old_string: "exact text to find (CSS section)",
      new_string: "replacement text (updated CSS)",
      replace_all: false  // or true for global replace
    },
    {
      old_string: "exact text to find (HTML section)",
      new_string: "replacement text (updated HTML)",
      replace_all: false
    },
    {
      old_string: "exact text to find (JavaScript section)",
      new_string: "replacement text (updated JavaScript)",
      replace_all: false
    }
  ]
});
```

---

#### **Critical Requirements:**

1. **Exact Matching:** `old_string` must match file contents EXACTLY (including whitespace)
2. **Sequential Execution:** Each edit operates on the result of the previous edit
3. **Atomic Operation:** All edits succeed or all fail (no partial updates)
4. **Logical Ordering:** Plan edits in dependency order (CSS → HTML → JS is common)
5. **Unique Strings:** Each `old_string` must be unique unless `replace_all: true`

---

#### **Code Example (Real Usage):**

**Use Case 1: Whitepaper Terminology Updates**
```javascript
multi_edit({
  file_path: "/path/to/whitepaper.md",
  explanation: "Update Session Closure terminology to Validation Commit Layer",
  edits: [
    {
      old_string: "## Session Closure Process",
      new_string: "## Validation Commit Layer (Session Closure)",
      replace_all: false
    },
    {
      old_string: "closes the session",
      new_string: "commits validation",
      replace_all: true  // Replace all occurrences
    }
  ]
});
```

**Use Case 2: Dashboard Feature Addition (7 edits)**
```javascript
multi_edit({
  file_path: "/path/to/scms-dashboard.html",
  explanation: "Add data staleness detection system",
  edits: [
    // 1. Add CSS for warning banner
    { old_string: "/* End of styles */", new_string: "/* Warning styles */\n.data-warning { ... }\n/* End of styles */" },
    
    // 2. Add HTML warning banner
    { old_string: "<div class=\"controls\">", new_string: "<div id=\"dataWarning\" class=\"data-warning\"></div>\n<div class=\"controls\">" },
    
    // 3. Add session counter HTML
    { old_string: "</div>\n        </div>", new_string: "</div>\n            <div class=\"metric-card\">...</div>\n        </div>" },
    
    // 4. Add validation function
    { old_string: "function startSession() {", new_string: "function validateDataFreshness() { ... }\n\nfunction startSession() {" },
    
    // 5. Add warning display function
    { old_string: "function exportData() {", new_string: "function displayWarning() { ... }\n\nfunction exportData() {" },
    
    // 6. Update event listener
    { old_string: "document.addEventListener('load', () => {", new_string: "document.addEventListener('load', () => {\n    validateDataFreshness();" },
    
    // 7. Enhance export with metadata
    { old_string: "const data = getData();", new_string: "const data = getData();\ndata.exportDate = new Date().toISOString();" }
  ]
});
```

---

#### **Benefits:**

✅ **Efficiency:** Reduces tool call overhead (1 call vs 7+ calls)  
✅ **Atomicity:** All changes succeed together or fail together  
✅ **Clarity:** Logical grouping of related changes  
✅ **Speed:** Faster than sequential individual edits  
✅ **Safety:** No partial updates that break the system  
✅ **Maintainability:** Clear change history in single commit

---

#### **Common Pitfalls (Avoid These):**

❌ **Whitespace Mismatch:**
```javascript
// WRONG - Will fail if file has tabs
old_string: "function test() {\n  return true;\n}"

// RIGHT - Match exact whitespace
old_string: "function test() {\n\treturn true;\n}"
```

❌ **Non-Unique Strings:**
```javascript
// WRONG - Multiple matches, will fail
old_string: "const value = 0;"

// RIGHT - Include surrounding context for uniqueness
old_string: "// Initialize counter\nconst value = 0;\n// Update display"
```

❌ **Wrong Order:**
```javascript
// WRONG - Later edits depend on earlier ones
edits: [
  { old_string: "// NEW MARKER", new_string: "..." },  // This marker doesn't exist yet!
  { old_string: "function old()", new_string: "function old()\n// NEW MARKER" }
]

// RIGHT - Dependencies in correct order
edits: [
  { old_string: "function old()", new_string: "function old()\n// NEW MARKER" },
  { old_string: "// NEW MARKER", new_string: "..." }
]
```

---

#### **Testing Checklist:**

Before using multi_edit:
- [ ] Read the file to verify exact `old_string` content
- [ ] Check whitespace (tabs vs spaces)
- [ ] Ensure each `old_string` is unique (or use `replace_all`)
- [ ] Plan edit order (later edits operate on earlier results)
- [ ] Group logically (CSS → HTML → JS is typical)
- [ ] Verify all edits are necessary (remove redundant ones)

---

#### **Validation History:**

**Use #1:** Whitepaper Terminology Updates (November 17, 2025)
- Updated "Session Closure" → "Validation Commit Layer"
- Updated multiple documentation files
- Result: ✅ Successful batch update across 6+ files

**Use #2:** Dashboard Tracking System (November 17, 2025)
- Added CSS for warning banner (40 lines)
- Added HTML for warning + session counter
- Added JavaScript validation functions (70+ lines)
- Result: ✅ All 7 edits applied atomically, production-ready

**Use #3:** Dashboard System Health Tab + UX Improvements (November 17, 2025)
- Added CSS for tabs, copy buttons, health metrics (200+ lines)
- Added HTML for tab navigation, system health tab, copy buttons (150+ lines)
- Added JavaScript for tab switching, data loading, auto-refresh (200+ lines)
- Removed vestigial mixed session functionality
- Result: ✅ All coordinated changes successful, 579 lines added atomically

**Promotion Criteria Met:** ≥2 uses (exceeded with 3 uses), production-validated, highly reusable

---

## 📋 Pattern Promotion Process

### **How Patterns Get to L1:**

1. **Discovery:** Pattern emerges during development
2. **L0 Creation:** Document in Cascade memory (first use)
3. **Validation:** Pattern reused successfully (2+ uses)
4. **Promotion:** Copy to WORKSPACE_RULES.md with full details
5. **Enforcement:** Pattern becomes mandatory quality gate

### **Promotion Threshold:**

- **Greenfield Projects:** ≥5 uses (patterns emerging)
- **Establishing Projects:** ≥3 uses (patterns stabilizing)
- **Mature Projects:** ≥2 uses (patterns proven) ✅ **Current threshold**

### **What Gets Promoted:**

✅ **Production-Proven Patterns:** Used successfully 2+ times  
✅ **Reusable Solutions:** Applicable across different contexts  
✅ **Quality Gates:** Prevent bugs or improve efficiency  
✅ **Team Consensus:** Validated by multiple uses

❌ **One-off Solutions:** Context-specific, not reusable  
❌ **Experimental Approaches:** Not yet validated  
❌ **Theoretical Patterns:** No real-world usage

---

## 🔄 Pattern Lifecycle

```
Discovery → L0 Memory (1 use) → Validation (2+ uses) → L1 Promotion → Enforcement
```

**Current L1 Patterns:** 1  
**L0 Candidates:** 4 patterns awaiting validation

---

## 📚 Related Documentation

- **SCMS Startup Prompt:** `SCMS_STARTUP_PROMPT.md`
- **Session Closure Guide:** `docs/guides/SCMS_SESSION_CLOSURE.md`
- **Memory Status Dashboard:** `MEMORY_STATUS_DASHBOARD.md` (if exists)
- **Pattern Index:** `scms/INDEX.md` (if exists)

---

**This is a living document. Patterns are added as they are validated through actual use (2+ times).**
