# SCMS Knowledge Graph Index

**Purpose**: Central hub for cross-referencing SCMS layers.
**Maintenance**: Updated automatically during session closure.

---

## 🏷️ Topic Index (Cross-Reference by Theme)

### #rendering
- See L0 Memories: Canvas Renderer, Sprite System, Camera Follow

### #physics
- See L0 Memories: Newtonian Physics, Collision Detection

### #architecture
- See L0 Memories: Entity Component Pattern

### #tooling
- See L2 Failures: Tool Safety Constraints, Edit Context Errors, File Manipulation Anti-Patterns

### #workflow
- See L2 Failures: Blind Edits Anti-Pattern
- See L1 Patterns: Natural Flow Principle, Consistent Principle Application

### #analysis
- See L1 Patterns: Comparative Economic Tracking, Multi-Dimensional Quality Assessment
- See L1 Patterns: Hypothesis Refinement Pattern
- See L2 Failures: Screenshot Misassignment (FAIL-20251119-001)

### #methodology
- See L1 Patterns: "Natural Flow > Absolute Uniformity" (Core Principle)
- See L1 Patterns: Consistent Principle Application Pattern
- See L2 Failures: Methodology Recommendation Error (FAIL-20251119-002)

### #testing_philosophy
- See L1 Patterns: Natural Flow Principle (asymmetric inputs are valid)
- See SESSION_LOG_L5.md: P8, P11 Natural Flow decision points

### #data_verification
- See L1 Patterns: Cross-Reference Visual and Textual Data Pattern
- See L2 Failures: Screenshot data misassignment prevention

### #economic_analysis
- See L1 Patterns: Break-Even and ROI Tracking Pattern
- See L1 Patterns: Comparative Economic Tracking Pattern
- Related: TaskFlow Pro comparison study (+48% cost premium stable through P20)

### #scope_definition
- See L1 Patterns: Full Project Scope Analysis Pattern
- See L2 Failures: Analysis scope error (FAIL-20251121-001)
- Prevention: Start broad (full project scan), narrow down

### #measurement
- See L2 Failures: 15x undercount error (documentation gap)
- Prevention: Full Project Scope Analysis Pattern (L1)

### #scientific_rigor
- See SESSION_LOG_L5.md: User's methodological corrections
- See L1 Patterns: Preliminary Status Framing for Mid-Experiment Analysis (Pattern #9)
- Examples: Confounding variable identification, test validity improvement

### #experiment_analysis
- See L1 Patterns: Preliminary Status Framing for Mid-Experiment Analysis (Pattern #9)
- Application: Maintain scientific rigor during mid-experiment reporting
- Key: Status labels ("PROMISING" not "VALIDATED"), progress fractions, uncertainty lists

---

## 📁 Layer Index (Files by SCMS Layer)

## L0: Active Memories (Auto/Manual)
- See [MEMORY_STATUS_DASHBOARD.md](MEMORY_STATUS_DASHBOARD.md) for active validation list

## L1: Workspace Rules
- See [WORKSPACE_RULES.md](WORKSPACE_RULES.md) for validated mandatory patterns

## L2: SOPs (Standard Operating Procedures)
- [SCMS Operations Manual](../guides/SCMS_OPERATIONS_MANUAL.md)
- [Failure Log](FAILURES.md) (Active L2 Log)

## L3: Case Studies
- (Populate when Case Studies are created in docs/scms/case-studies/)

## L5: Session Logs
- [Session Log L5](SESSION_LOG_L5.md) (Latest Audit)

## L4: Global Rules
- See ../../rules/GLOBAL_CODING_RULES.md for universal constraints

---

## 🔗 Semantic Connections (Failure → Prevention Pattern Map)

### **FAIL-20251118-001**: File manipulation tool error
**Prevention**: Always use `edit` for existing files, never `rm` + `write_to_file`
**Pattern**: File Update Anti-Pattern (L2)
**Category**: #tooling

### **FAIL-20251119-001**: Screenshot data misassignment
**Prevention**: Cross-Reference Visual and Textual Data Pattern (L1)
**Pattern**: Always verify image assignments against user's explicit statements
**Related**: #data_verification, #analysis
**Impact**: Minor (caught and corrected quickly)

### **FAIL-20251119-002**: Methodology recommendation error
**Prevention**: Consistent Principle Application Pattern (L1)
**Promoted Principle**: "Natural Flow > Absolute Uniformity" (L1)
**Pattern**: Review established principles before making methodology decisions
**Related**: #methodology, #testing_philosophy
**Impact**: HIGH POSITIVE (user correction led to better scientific approach)

### **FAIL-20251121-001**: Analysis scope error (documentation gap 15x undercount)
**Prevention**: Full Project Scope Analysis Pattern (L1)
**Pattern**: When user references "file system" or "project structure," assume FULL PROJECT SCOPE first, then narrow down
**Rule**: Start broad (full scan), narrow down - NOT start narrow, expand up
**Key Insight**: In SCMS, "documentation" = entire taskflow-pro ecosystem (whitepapers, guides, templates, tools, workflows, rules), not just docs/scms/
**Related**: #scope_definition, #measurement, #data_accuracy, #analysis
**Impact**: Major - 15x magnitude error (reported 68 KB, reality 1,043 KB), quickly corrected
**Cross-Ref**: See L1 Patterns and L2 Failures for prevention strategies

---

## 📊 Knowledge Base Statistics

**Last Updated**: 2025-11-23

### **By Layer**:
- L0 Memories: Multiple (see dashboard)
- L1 Patterns: 9 validated patterns (Latest: Preliminary Status Framing)
- L2 Failures: 4 documented failures (all resolved)
- L3 Case Studies: 0 (pending)
- L4 Global Rules: 1 (coding rules)
- L5 Session Logs: Multiple sessions

### **By Topic**:
- #tooling: 2 failures
- #workflow: 1 failure, 2 patterns
- #analysis: 4 patterns, 2 failures
- #methodology: 2 patterns, 1 failure
- #testing_philosophy: 1 pattern, 2 decision points
- #data_verification: 1 pattern, 1 failure
- #economic_analysis: 2 patterns
- #scope_definition: 1 pattern, 1 failure
- #measurement: 1 failure
- #scientific_rigor: 1 pattern (Preliminary Status Framing), multiple examples
- #experiment_analysis: 1 pattern
- #rendering: Multiple memories
- #physics: Multiple memories
- #architecture: Multiple memories

### **Growth Trajectory**:
- Session 1 (2025-11-18): 1 failure, setup updates
- Session 2 (2025-11-19): 2 failures, 8 patterns promoted, 1 core principle established
- Session 3 (2025-11-21): 1 failure, 1 pattern promoted
- Additional sessions: Pattern validation, dashboard improvements, workflow refinements

**Total Knowledge Artifacts**: 13 (4 failures + 9 patterns)

---

## 🎯 Quick Navigation

**For Pattern Lookup**: See [WORKSPACE_RULES.md](WORKSPACE_RULES.md)  
**For Failure Prevention**: See [FAILURES.md](FAILURES.md)  
**For Session History**: See [SESSION_LOG_L5.md](SESSION_LOG_L5.md)  
**For Templates**: See `../templates/`

---

**Index Maintenance**: Updated during each session closure (V3.2 Protocol Step 5)

