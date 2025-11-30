# SCMS Knowledge Graph Index

**Purpose**: Central hub for cross-referencing SCMS layers.  
**Maintenance**: Updated automatically during session closure.  
**Project**: SCMS Starter Kit

---

## 🏷️ Topic Index (Cross-Reference by Theme)

*Tags are added as patterns emerge during development*

### #project-isolation
- See L1 Patterns: Template Repository Isolation
- See L2 Failures: FAIL-20251128-001 (TaskFlow Pro contamination)
- Prevention: Clone starter kit to separate directory for project work

### #contamination-prevention
- See L1 Patterns: Template Repository Isolation
- Related: #project-isolation, #repository-hygiene

### #repository-hygiene
- See L1 Patterns: Template Repository Isolation
- Related: #project-isolation, #contamination-prevention

### #d3-visualization
- See L1 Patterns: Edge Case Handling for D3 Hierarchies
- See L2 Failures: FAIL-20251129-001 (Tree Layout Syntax + Multi-Root)
- Prevention: Virtual root for forests, try-catch fallback, verify all code paths

### #graph-layout
- See L1 Patterns: Edge Case Handling for D3 Hierarchies
- Related: #d3-visualization, #edge-case-handling

### #edge-case-handling
- See L2 Failures: FAIL-20251129-001 (D3 stratify assumptions)
- Prevention: Always handle disconnected/forest graphs with virtual roots
- Related: #d3-visualization, #graph-layout

### #mneme-ai-development
- See [MNEME_ENHANCEMENT_ROADMAP.md](MNEME_ENHANCEMENT_ROADMAP.md) for full roadmap
- Phases 1-5: ✅ Complete | Phase 6 (MCP): 🔜 Next Session
- Related: #scms-implementation, #memory-lifecycle

---

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

### **FAIL-20251129-001**: D3 Tree Layout Syntax + Multi-Root Assumption
**Prevention**: Edge Case Handling for D3 Hierarchies (L1)
**Pattern**: Virtual root for forests, try-catch fallback, verify all code paths
**Category**: #d3-visualization #graph-layout #edge-case-handling

### **FAIL-20251128-001**: TaskFlow Pro Contamination
**Prevention**: Template Repository Isolation (L1)
**Pattern**: Clone to separate directory for project work
**Category**: #project-isolation #contamination-prevention

---

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
| 2025-11-29 | 0 | 2 | 2 | 0 |
| 2025-11-28 | 0 | 1 | 1 | 0 |

*Updated during session closure*

---

## 🧭 Quick Navigation

- **Need a pattern?** → Check L1 (WORKSPACE_RULES.md)
- **Hit a bug?** → Document in L2 (FAILURES.md)
- **Want examples?** → Browse L3 (case-studies/)
- **Session ending?** → Run L5 closure protocol
- **Mneme AI Development?** → See [MNEME_ENHANCEMENT_ROADMAP.md](MNEME_ENHANCEMENT_ROADMAP.md)

---

## 📝 Maintenance Notes

**Update This File When**:
- New topic tag emerges (add to Topic Index)
- Pattern promoted to L1 (update Layer Index)
- Failure documented (add to Semantic Connections)
- Session closes (update Growth Trajectory)

**Last Updated**: 2025-11-29
