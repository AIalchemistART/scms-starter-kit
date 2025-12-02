# Contamination Guard (L1 Pattern)

> **Purpose**: Protect template repositories from project-specific content leakage  
> **Layer**: L1 (Validated Pattern - 2x failure validated)  
> **Last Updated**: 2025-12-02  
> **Origin**: FAIL-20251128-001 + FAIL-20251130-003 (recursive contamination)

---

## 🚨 Why This Exists

Template repositories are at **constant risk** of contamination during active development. The most dangerous contamination happens during **documentation sessions** when your focus is on concepts, not containers.

**Validated Failure Pattern:**
> "The most insidious contamination happens during sessions focused on IMPROVEMENT. Your attention is on the concept, not the container."

---

## 🛡️ Protection Mechanisms

### 1. Automated Script (Recommended)

Run before any commit to the starter kit:

```powershell
# From repository root
.\scripts\contamination-check.ps1 -ProjectNames "YourProject","YourApp" -PersonaNames "YourPersona" -UserNames "YourName" -Verbose
```

**Exit Codes:**
- `0` = Clean (safe to commit)
- `1` = Contamination detected (review required)

### 2. Manual Grep Check

Quick check without the script:

```powershell
# PowerShell
Select-String -Path "docs/scms/*.md" -Pattern "YourProject|YourPersona|YourName"

# Bash/Git Bash
grep -r "YourProject\|YourPersona\|YourName" docs/scms/
```

### 3. Session Closure Checklist

Before closing any documentation-heavy session:

```
☐ Are there any project-specific names? (YourProject, YourApp)
☐ Are there any persona-specific names? (YourPersona, YourAI)
☐ Are there any user-specific names? (YourName, YourUsername)
☐ Are there any model-specific references? (GPT-5.1, specific-model-id)
☐ Would a new user understand this without YOUR context?
☐ Should this be in examples/dogfood/ instead?
```

---

## 📁 Directory Rules

| Location | Content Type | Contamination Risk |
|----------|-------------|-------------------|
| `docs/scms/` | Universal templates & patterns | 🔴 HIGH - must be clean |
| `docs/templates/` | Reusable templates | 🔴 HIGH - must be clean |
| `examples/dogfood/` | Project-specific case studies | 🟢 LOW - expected to have specifics |
| `scripts/` | Utility scripts | 🟡 MEDIUM - parameterize, don't hardcode |

### Decision Tree

```
Is this content universal (applies to ANY project)?
├── YES → Put in docs/scms/ or docs/templates/
│         └── Use [Placeholder] for any specific values
└── NO  → Put in examples/dogfood/
          └── Document as a case study, not a pattern
```

---

## 🔄 When Contamination is Acceptable

**Meta-documentation** (documenting the contamination failure itself) may contain project-specific references. This is acceptable when:

1. The reference is **in a failure log** explaining what went wrong
2. The reference is **in an example checklist** showing what to check for
3. The reference has a **comment** explaining why it's there

Example (acceptable):
```markdown
### FAIL-20251130-003: Recursive Contamination
What Happened: Project-specific content (Aria, Manny, Mneme GPT) was written...
<!-- META: This reference documents the failure, not actual contamination -->
```

---

## 🏃 Quick Commands

### Check for contamination (verbose)
```powershell
.\scripts\contamination-check.ps1 -ProjectNames "Mneme","YourProject" -PersonaNames "Aria","Manny" -Verbose
```

### Check specific file
```powershell
Select-String -Path "docs/scms/WORKSPACE_RULES.md" -Pattern "Mneme|Aria|Manny|YourProject"
```

### Batch rename/replace (careful!)
```powershell
# Preview first
(Get-Content "docs/scms/FILE.md") -replace "SpecificName", "[Placeholder]"

# Apply (only if preview looks correct)
(Get-Content "docs/scms/FILE.md") -replace "SpecificName", "[Placeholder]" | Set-Content "docs/scms/FILE.md"
```

---

## 📊 Contamination History

| Date | Failure ID | Cause | Resolution |
|------|-----------|-------|------------|
| 2025-11-28 | FAIL-20251128-001 | TaskFlow Pro content in starter kit | Moved to examples/ |
| 2025-11-30 | FAIL-20251130-003 | Documentation session drift | Generalized + checklist added |
| 2025-12-02 | — | Proactive hardening | Script + guard doc created |

**Status**: Two-time validated failure pattern. Automated protection now in place.

---

## ✅ Integration Points

1. **Session Closure Template** → Includes contamination check step
2. **Pre-commit Hook** → (Optional) Run script automatically
3. **CI/CD** → (Optional) Fail builds if contamination detected

---

*This document is part of the SCMS L1 Validated Patterns layer.*
