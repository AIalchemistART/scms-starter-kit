# Global Coding Rules (L4)

**Purpose**: Universal constraints that apply across ALL projects and code  
**SCMS Layer**: L4 - Passive reference (checked before task completion)  
**Last Updated**: [Date]

---

## ⚠️ When These Rules Apply

These are **FINAL QUALITY GATES** checked BEFORE marking tasks complete:
- ✅ Checked AFTER implementation (not before starting)
- ✅ AI validates compliance automatically
- ✅ Violations are fixed before completion
- ❌ NOT upfront constraints that block creativity

---

## 🚨 SCMS Core Protocol (Mandatory)

### 1. Log All Failures (L2)
**Rule**: If a tool fails or a bug is found, STOP and log it in `docs/scms/FAILURES.md` (using Template).
**Why**: Silent fixes destroy learning opportunities.
**Check**: Did I encounter an error? Did I log it?

### 2. Read Before Write (Safety)
**Rule**: Never use `edit_file` or `write_to_file` without first reading the target (or confirming it doesn't exist).
**Why**: Prevents tool errors and destructive overwrites.
**Check**: Did I read the file before editing?

### 3. Update Documentation with Code (No Ghost Files)
**Rule**: When creating/deleting files, immediately update `docs/scms/INDEX.md` or the project README.
**Why**: Code without context becomes legacy debt instantly.
**Check**: Is the new file linked in INDEX.md?

### 4. Retrieval-First Development (Economic)
**Rule**: Check `docs/scms/WORKSPACE_RULES.md` before generating new patterns.
**Why**: Reduces token cost and ensures architectural consistency.
**Check**: Did I check L1 rules before coding?

---

## 🎯 Universal Best Practices

### 5. Avoid Duplicate Code (DRY)
**Rule**: Reuse existing functionality wherever possible  
**Why**: Prevents technical debt and promotes long-term maintainability  
**Check**: Before completion, scan for duplicated logic

### 6. Write Thorough Tests
**Rule**: Ensure tests cover all major functionality  
**Why**: Testing builds confidence and supports AI-assisted workflows  
**Check**: Tests exist for new/modified code

### 7. Avoid Unnecessary Refactors
**Rule**: Do not change patterns or architecture of working features unless explicitly directed  
**Why**: Major refactors create risk and regression bugs  
**Check**: Only refactor if requested or clearly beneficial

### 8. Mock Data Only for Testing
**Rule**: Mock data should NEVER enter dev or production environments  
**Why**: Protects data integrity and runtime safety  
**Check**: No test data in non-test code

### 9. Keep the Codebase Clean & Organized
**Rule**: Essential for readability, collaboration, and AI tool effectiveness  
**Why**: Clean code is maintainable code  
**Check**: Follows project conventions, no dead code

### 10. Stay Task-Focused
**Rule**: Only modify code relevant to the task at hand  
**Why**: Reduces scope creep and risk  
**Check**: Changes align with task requirements

---

## 🔒 Security & Safety

### Never Overwrite `.env` Without Approval
**Rule**: Protect sensitive environment configurations  
**Why**: Prevents accidental exposure of secrets

### Use Existing Solutions First
**Rule**: Exhaust existing patterns or tech before introducing new ones  
**Why**: Consistency and reduced maintenance burden

---

## 📋 Pre-Completion Checklist

Before marking ANY task complete, verify:

- [ ] **Failure Logged?** (If any errors occurred)
- [ ] **Index Updated?** (If files created/deleted)
- [ ] **Read Before Write?** (Verified file state)
- [ ] No duplicate code introduced
- [ ] Tests written/updated for changes
- [ ] No unnecessary refactoring performed
- [ ] No mock data in non-test code
- [ ] Code is clean and organized
- [ ] Changes are task-focused only

---

## 🤖 For AI Assistants

**When to Check This File**: BEFORE marking task complete (Step 7 in your workflow)

**If Compliant**: Report "✅ VERIFIED L4 COMPLIANCE: All global rules followed"

**If Violations Found**: 
1. Report "⚠️ WARNING L4 VIOLATION: [rule] - [specific issue]"
2. Fix automatically
3. Re-verify
4. THEN mark complete

**Remember**: L4 is a FINAL GATE, not an upfront constraint. Implement freely using L1 patterns, then validate here before completion.

---

**Version**: 1.1 (SCMS Enhanced)  
**Status**: ✅ Active  
**Scope**: Universal (applies to all code)
