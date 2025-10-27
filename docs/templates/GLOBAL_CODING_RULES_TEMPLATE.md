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

## 🎯 Universal Best Practices

### 1. Avoid Duplicate Code (DRY)
**Rule**: Reuse existing functionality wherever possible  
**Why**: Prevents technical debt and promotes long-term maintainability  
**Check**: Before completion, scan for duplicated logic

### 2. Write Thorough Tests
**Rule**: Ensure tests cover all major functionality  
**Why**: Testing builds confidence and supports AI-assisted workflows  
**Check**: Tests exist for new/modified code

### 3. Avoid Unnecessary Refactors
**Rule**: Do not change patterns or architecture of working features unless explicitly directed  
**Why**: Major refactors create risk and regression bugs  
**Check**: Only refactor if requested or clearly beneficial

### 4. Mock Data Only for Testing
**Rule**: Mock data should NEVER enter dev or production environments  
**Why**: Protects data integrity and runtime safety  
**Check**: No test data in non-test code

### 5. Keep the Codebase Clean & Organized
**Rule**: Essential for readability, collaboration, and AI tool effectiveness  
**Why**: Clean code is maintainable code  
**Check**: Follows project conventions, no dead code

### 6. Stay Task-Focused
**Rule**: Only modify code relevant to the task at hand  
**Why**: Reduces scope creep and risk  
**Check**: Changes align with task requirements

### 7. Consider Code Impact
**Rule**: Always think about how changes affect other areas  
**Why**: Prevents unintended side effects  
**Check**: Related systems considered and tested

### 8. Make Only Necessary, Well-Understood Changes
**Rule**: Think through changes before committing  
**Why**: Prevents bugs and technical debt  
**Check**: Can explain why each change is necessary

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

- [ ] No duplicate code introduced
- [ ] Tests written/updated for changes
- [ ] No unnecessary refactoring performed
- [ ] No mock data in non-test code
- [ ] Code is clean and organized
- [ ] Changes are task-focused only
- [ ] Impact on related code considered
- [ ] All changes are necessary and understood
- [ ] Environment files not overwritten
- [ ] Existing solutions used where applicable

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

**Version**: 1.0  
**Status**: ✅ Active  
**Scope**: Universal (applies to all code)
