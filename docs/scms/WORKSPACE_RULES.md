# Workspace Rules (L1) - [Project Name]

**Last Updated**: 2025-11-30  
**Project**: SCMS Starter Kit - Template Distribution Repository  
**Tech Stack**: [Primary Language/Framework]  
**SCMS Role**: **L1 Stable Validation** (deterministic enforcement layer)

---

## 🎯 Project Configuration

### Tech Stack
- **Frontend**: [e.g., React, Next.js, Vue]
- **Backend**: [e.g., Node.js, Python, Go]
- **Database**: [e.g., PostgreSQL, SQLite, MongoDB]
- **Other**: [e.g., APIs, services, tools]

### Naming Conventions
- **Variables/Functions**: [e.g., camelCase]
- **Components/Classes**: [e.g., PascalCase]
- **Files**: [e.g., kebab-case]
- **Constants**: [e.g., UPPER_SNAKE_CASE]

### Architecture Notes
[Document key architectural decisions and patterns for this project]

---

## 📝 L1 Validated Patterns

> ⚠️ **GREENFIELD PROJECTS:** This section should be EMPTY at project start!  
> Patterns are discovered and promoted DURING development, not pre-populated.  
> **Promotion Threshold:** See MEMORY_STATUS_DASHBOARD.md for current threshold

*This section auto-populates as patterns reach the promotion threshold through natural reuse*

---

### Template Repository Isolation (Validated - Use Count: 2)

**Context**: Maintaining clean template repositories  
**Tags**: #project-isolation #contamination-prevention #repository-hygiene

**Pattern**:
```
Template/starter kit repositories must NEVER be used as working project instances.
Clone to a separate location for actual project work.
```

**When to Apply**:
- Setting up SCMS for a new project
- Testing SCMS features with real work
- Any scenario where project-specific content would be generated

**Known Edge Cases**:
- `examples/dogfood/` is the designated location for example content within the starter kit
- Test projects should live in entirely separate directories

**Related Failures**: FAIL-20251128-001 (TaskFlow Pro contamination)

---

### X/LinkedIn Article Formatting (Validated - Use Count: 2)

**Context**: Creating articles with tables and structured content for social platforms  
**Tags**: #article-formatting #x-twitter #linkedin #latex #ascii-tables #content-creation

**Pattern**:
```
PLATFORM-SPECIFIC TABLE FORMATS:

1. X (Twitter) Articles → Use LaTeX
   \begin{array}{|l|l|l|}
   \hline
   \textbf{Col1} & \textbf{Col2} & \textbf{Col3} \\
   \hline
   \text{Data} & \text{Data} & \text{Data} \\
   \hline
   \end{array}

2. LinkedIn Articles → Use ASCII in code block (</>)
   Column 1           | Column 2             | Column 3
   -------------------|----------------------|------------------
   Data               | Data                 | Data

BOTH PLATFORMS:
- Dividers must be added manually via UI (paste doesn't preserve)
- Plan structure before pasting to minimize manual formatting
```

**When to Apply**:
- Creating long-form articles on X or LinkedIn
- Any content requiring tables or structured data
- Cross-posting articles to multiple platforms

**Known Edge Cases**:
- Box-drawing characters (┌─┐) may not render on all devices in LinkedIn
- Mobile readers benefit from formatted lists over tables
- Neither platform preserves markdown dividers on paste

**What Doesn't Work (Failure Documentation)**:
- Markdown tables → Render as jumbled text on both platforms
- LaTeX on LinkedIn → Not supported
- Pasted dividers (---) → Must add manually via UI on both

---

### Pattern Template (Copy when adding validated patterns)

```markdown
### [Pattern Name] (Validated - Use Count: X)

**Context**: [When this pattern applies]
**Tags**: #[topic] #[category]

**Pattern**:
```language
// Code example from actual implementations
```

**When to Apply**:
- [Situation 1]
- [Situation 2]

**Known Edge Cases**:
- [List discovered during validation]

**Related Failures**: [FAIL-ID if applicable]
```

---

## ⚠️ Common Pitfalls

*This section populated as issues are discovered*

---

## 🔗 Related Documentation

- **INDEX.md**: Central cross-reference hub
- **FAILURES.md**: L2 failure documentation with 5-Whys
- **MEMORY_STATUS_DASHBOARD.md**: Pattern status and thresholds (READ-ONLY)
- **docs/templates/**: All templates for SCMS documentation

---

## 🎯 Summary

**Total L1 Patterns**: 2  
**Promotion Threshold**: See MEMORY_STATUS_DASHBOARD.md

**Next Session Reminders**:
1. Apply any discovered patterns from L0 memories
2. Document failures immediately (highest ROI!)
3. Promote patterns that reach threshold

---

**Last Updated**: 2025-11-30  
**Version**: 1.2  
**Status**: ✅ Active
