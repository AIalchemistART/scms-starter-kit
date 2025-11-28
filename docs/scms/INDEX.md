# SCMS Knowledge Graph Index

**Purpose**: Central hub for cross-referencing SCMS layers.  
**Maintenance**: Updated automatically during session closure.  
**Project**: [Project Name]

---

## 🏷️ Topic Index (Cross-Reference by Theme)

*Tags are added as patterns emerge during development*

### Example Tag Structure

```markdown
### #[topic-name]
- See L0 Memories: [Related memory names]
- See L1 Patterns: [Related validated patterns]
- See L2 Failures: [Related failure entries]
```

---

## 📁 Layer Index (Files by SCMS Layer)

### L0: Active Memories (Auto/Manual)
- See [MEMORY_STATUS_DASHBOARD.md](MEMORY_STATUS_DASHBOARD.md) for active validation list
- Auto-generated memories from AI assistant sessions
- Manual memories created during development

### L1: Workspace Rules
- See [WORKSPACE_RULES.md](WORKSPACE_RULES.md) for validated mandatory patterns
- Patterns promoted from L0 after reaching use threshold

### L2: Failure Documentation
- [FAILURES.md](FAILURES.md) - Active failure log with 5-Whys analysis
- Templates: `docs/templates/FAILURE_LOG_TEMPLATE.md`

### L3: Case Studies
- Location: `docs/case-studies/` (create when needed)
- Templates: `docs/templates/CASE_STUDY_TEMPLATE.md`

### L4: Global Rules
- See `rules/GLOBAL_CODING_RULES.md` for universal constraints
- Templates: `docs/templates/GLOBAL_CODING_RULES_TEMPLATE.md`

### L5: Session Logs
- [SESSION_LOG_L5.md](SESSION_LOG_L5.md) - Latest audit
- Templates: `docs/templates/SESSION_CLOSURE_REPORT_TEMPLATE.md`

---

## 🔗 Semantic Connections (Failure → Prevention Pattern Map)

*Populated when failures are documented and prevention patterns emerge*

### Template:

```markdown
### **FAIL-YYYYMMDD-XXX**: [Brief Description]
**Prevention**: [Pattern or rule that prevents recurrence]
**Pattern**: [L1 pattern name if promoted]
**Category**: #[tag]
```

---

## 📊 Growth Trajectory

| Date | L0 Active | L1 Patterns | L2 Failures | L3 Cases |
|------|-----------|-------------|-------------|----------|
| [Start Date] | 0 | 0 | 0 | 0 |

*Updated during session closure*

---

## 🧭 Quick Navigation

- **Need a pattern?** → Check L1 (WORKSPACE_RULES.md)
- **Hit a bug?** → Document in L2 (FAILURES.md)
- **Want examples?** → Browse L3 (case-studies/)
- **Session ending?** → Run L5 closure protocol

---

## 📝 Maintenance Notes

**Update This File When**:
- New topic tag emerges (add to Topic Index)
- Pattern promoted to L1 (update Layer Index)
- Failure documented (add to Semantic Connections)
- Session closes (update Growth Trajectory)

**Last Updated**: [Date]
