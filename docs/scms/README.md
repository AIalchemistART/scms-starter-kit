# SCMS Operational Data

This directory contains the active operational data for the SCMS instance.

## 📁 Core Files

- **`INDEX.md`**: 🎯 **Central cross-reference hub** - The source of truth for all tagging and semantic connections
- **`MEMORY_STATUS_DASHBOARD.md`**: Tracks active L0 memories and L1 patterns
- **`FAILURES.md`**: Log of L2 failure analysis with topic tags
- **`WORKSPACE_RULES.md`**: L1 validated patterns (mandatory quality gates)
- **`SESSION_LOG_L5.md`**: Latest session closure audit report

---

## 🏷️ Tagging & Cross-Referencing System

### Purpose
**INDEX.md is the knowledge graph hub**. All SCMS files use topic-based tags to create semantic connections, enabling:
- Fast pattern retrieval by theme (e.g., `#rendering`, `#physics`, `#tooling`)
- Cross-referencing related patterns across layers (L0/L1/L2/L3)
- Organizational framing (NOT visual diagrams—tags and links)

### How Tags Work

**Every entry should include topic tags:**
```markdown
**Tags:** #[topic] #[category]
Examples: #rendering #physics #tooling #workflow #architecture
```

**INDEX.md groups patterns by topic:**
```markdown
### #rendering
- See L0 Memories: Canvas Renderer, Camera System
- See L2 Failures: GPU Context Loss
- See L1 Rules: Double Buffering Pattern
```

### When to Update INDEX.md

**During Session Closure (L5):**
1. Add new tags to L0/L2/L3 entries
2. Update INDEX.md Topic Index with new patterns
3. Cross-reference related patterns (link failures to preventive patterns)

**Reference:** See `docs/templates/SESSION_CLOSURE_REPORT_TEMPLATE.md` → "Index Maintenance" section

---

## 📝 Maintenance

*Do not manually edit these files during active development. The AI assistant updates them during session closure (L5 audit).*

**Exception**: You may correct AI errors or add missing tags if the system fails to maintain them properly.
