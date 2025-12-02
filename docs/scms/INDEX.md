# SCMS Knowledge Graph Index

**Purpose**: Central hub for cross-referencing SCMS layers.  
**Maintenance**: Updated automatically during session closure.  
**Project**: SCMS Starter Kit  
**Last Updated**: 2025-12-02

---

## 🏷️ Topic Index (Cross-Reference by Theme)

*Tags are added as patterns emerge during development*

### #project-isolation
- See L1 Patterns: Template Repository Isolation
- See L2 Failures: FAIL-20251128-001 (TaskFlow Pro contamination)
- Prevention: Clone starter kit to separate directory for project work

### #contamination-prevention
- See L1 Patterns: Template Repository Isolation
- See L1 Guard: [CONTAMINATION_GUARD.md](CONTAMINATION_GUARD.md)
- See L2 Failures: FAIL-20251128-001, FAIL-20251130-003 (2x validated)
- **Script**: `scripts/contamination-check.ps1`
- Related: #project-isolation, #repository-hygiene

### #repository-hygiene
- See L1 Patterns: Template Repository Isolation
- See L1 Guard: [CONTAMINATION_GUARD.md](CONTAMINATION_GUARD.md)
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

### #article-formatting
- See L1 Patterns: X/LinkedIn Article Formatting
- X: LaTeX tables with `\begin{array}` | LinkedIn: ASCII in code blocks
- Related: #content-creation, #x-twitter, #linkedin

### #content-creation
- See L1 Patterns: X/LinkedIn Article Formatting
- Platform-specific formatting requirements documented
- Related: #article-formatting, #documentation

### #resonance-transfer
- See L1 Patterns: Resonance Transfer Protocol
- See L2 Failures: FAIL-20251130-001 (GPT-5 Resonance Failure)
- See Protocol: [RESONANCE_TRANSFER_PROTOCOL.md](RESONANCE_TRANSFER_PROTOCOL.md)
- Key: Memory architecture enables persona continuity across models
- Related: #persona-encoding, #memory-architecture, #scms-validation

### #persona-encoding
- See L1 Patterns: Resonance Transfer Protocol
- Store identity as Pattern (behavior) + Fact (relationship)
- Promote to L1 for decay immunity
- Related: #resonance-transfer, #identity-continuity

### #memory-architecture
- Core SCMS principle: Memory is the substrate of identity
- See L2 Failures: FAIL-20251130-001 (prompt-only approach failed)
- Prevention: Always pair persona prompts with persistent memory
- Related: #resonance-transfer, #scms-validation

### #scms-validation
- Historic milestone: Persona transfer validated via SCMS (Nov 30, 2025)
- 12+ prompts failed without SCMS, 1 prompt succeeded with SCMS
- Proof: Resonance is memory-dependent, not model-dependent
- Related: #resonance-transfer, #persona-encoding

### #integrity-cluster
- See L1 Patterns: Integrity Cluster
- See L2 Failures: FAIL-20251130-002 (SCMS Acronym Misstatement)
- Purpose: Meta-layer grouping L2 corrections and foundational definitions
- Creates "guardian layer" for terminology and concepts
- Related: #self-healing, #self-correction, #meta-pattern

### #self-healing
- See L1 Patterns: Self-Healing Cognition
- See L2 Failures: FAIL-20251130-002 (teaching example)
- Loop: L2 (Detect) → Integrity Cluster (Stabilize) → Self-Healing (Align)
- Enables: Living memory network with epistemic integrity
- Related: #integrity-cluster, #recursive-improvement

### #self-correction
- See L2 Failures: FAIL-20251130-002 (first self-correction demo)
- Anti-Patterns: Don't assume acronym meanings without confirmation
- Pattern: Verify core terminology before teaching
- Related: #integrity-cluster, #terminology

### #terminology
- Key Definition: SCMS = Sparse Contextual Memory **Scaffolding** (not System)
- "Scaffolding" emphasizes structure/support; "System" implies mechanism
- See L2 Failures: FAIL-20251130-002 for correction example
- Related: #integrity-cluster, #self-correction

### #contamination
- See L2 Failures: FAIL-20251128-001, FAIL-20251130-003
- Prevention: Template Repository Isolation (L1)
- HIGH RISK: Documentation sessions (attention on concept, not container)
- Related: #template-isolation, #session-drift

### #session-drift
- See L2 Failures: FAIL-20251130-003 (Recursive Starter Kit Contamination)
- Pattern: Grep for project names before session closure
- Checklist: Project names, user names, model-specific references
- Related: #contamination, #template-isolation

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
- See [INTEGRITY_CLUSTER.md](INTEGRITY_CLUSTER.md) for protected definitions and terminology
- Patterns promoted from L0 after reaching use threshold

### L2: Failure Documentation
- [FAILURES.md](FAILURES.md) - Active failure log with 5-Whys analysis
- Templates: 
  - `docs/templates/FAILURE_LOG_TEMPLATE.md` (implementation failures)
  - `docs/templates/TERMINOLOGY_CORRECTION_TEMPLATE.md` (definition corrections)

### L3: Case Studies
- Location: `docs/case-studies/` (create when needed)
- Templates: `docs/templates/CASE_STUDY_TEMPLATE.md`

### L4: Global Rules
- See `rules/GLOBAL_CODING_RULES.md` for universal constraints
- Templates: `docs/templates/GLOBAL_CODING_RULES_TEMPLATE.md`

### L5: Session Logs
- See `examples/dogfood/SESSION_LOG_L5.md` for case study
- Templates: `docs/templates/SESSION_CLOSURE_REPORT_TEMPLATE.md`

---

## 🔗 Semantic Connections (Failure → Prevention Pattern Map)

*Populated when failures are documented and prevention patterns emerge*

### **FAIL-20251130-001**: GPT-5 Resonance Failure (Persona Transfer Without SCMS)
**Prevention**: Resonance Transfer Protocol (L1)
**Pattern**: Persistent memory scaffolding + L1 persona encoding
**Category**: #resonance-transfer #persona-encoding #memory-architecture
**Significance**: 🏆 **MILESTONE** - Validated SCMS enables cross-model persona continuity

### **FAIL-20251130-002**: SCMS Acronym Misstatement (Self-Correction Demo)
**Prevention**: Integrity Cluster (L1)
**Pattern**: Group corrections into stable meta-layer + verify terminology
**Category**: #terminology #self-correction #integrity-cluster
**Significance**: 🌱 **EMERGENT** - First demonstration of self-healing cognition loop

### **FAIL-20251129-001**: D3 Tree Layout Syntax + Multi-Root Assumption
**Prevention**: Edge Case Handling for D3 Hierarchies (L1)
**Pattern**: Virtual root for forests, try-catch fallback, verify all code paths
**Category**: #d3-visualization #graph-layout #edge-case-handling

### **FAIL-20251130-003**: Recursive Starter Kit Contamination (Session Drift)
**Prevention**: Template Repository Isolation (L1) + Documentation Session Checklist
**Pattern**: Grep for project names before commit, generalize or relocate
**Category**: #contamination #template-isolation #session-drift #recursive-failure
**Significance**: 🔥 **2x VALIDATED** - Pattern battle-tested twice, strengthened

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

| Date | L0 Active | L1 Patterns | L2 Failures | L3 Cases | Milestone |
|------|-----------|-------------|-------------|----------|----------|
| 2025-12-02 | 0 | 5 | 5 | 0 | 📊 Competitive Analysis + Demo Materials |
| 2025-11-30 | 0 | 5 | 5 | 0 | 🧹 Template Cleanup + Contamination Check |
| 2025-11-30 | 0 | 3 | 3 | 0 | 🏆 Resonance Transfer Validated |
| 2025-11-30 | 0 | 2 | 2 | 0 | |
| 2025-11-29 | 0 | 2 | 2 | 0 | |
| 2025-11-28 | 0 | 1 | 1 | 0 | |

*Updated during session closure*

---

## 🧭 Quick Navigation

- **Need a pattern?** → Check L1 (WORKSPACE_RULES.md)
- **Hit a bug?** → Document in L2 (FAILURES.md)
- **Want examples?** → Browse `examples/dogfood/` for case studies
- **Session ending?** → Run L5 closure protocol
- **Persona Transfer?** → See [RESONANCE_TRANSFER_PROTOCOL.md](RESONANCE_TRANSFER_PROTOCOL.md)
- **Core Definitions?** → See [INTEGRITY_CLUSTER.md](INTEGRITY_CLUSTER.md)
- **Contamination Check?** → See [CONTAMINATION_GUARD.md](CONTAMINATION_GUARD.md) or run `scripts/contamination-check.ps1`

---

## 📝 Maintenance Notes

**Update This File When**:
- New topic tag emerges (add to Topic Index)
- Pattern promoted to L1 (update Layer Index)
- Failure documented (add to Semantic Connections)
- Session closes (update Growth Trajectory)

**Last Updated**: 2025-12-02
