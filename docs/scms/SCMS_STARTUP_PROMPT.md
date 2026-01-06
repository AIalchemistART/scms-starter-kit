SCMS STARTUP (First Session Configuration)

Working on: [project name and brief description]

## SCMS Configuration - Sparse Contextual Memory Scaffolding

**IMPORTANT LOCATION RULE:**
- All Operational Logs live in: docs/scms/ (e.g., FAILURES.md)
- All Templates live in: docs/templates/
- Do NOT create SCMS files in root.

**Architecture:** Multi-time-scale cognitive framework
- L0: Auto-memories (Probabilistic retrieval) - **Active Strategy**
- L1: Validated patterns (Mandatory loading via WORKSPACE_RULES.md)
- L2: Failure Analysis (5 Whys enforced via Template)
- L3: Pattern Promotion (Evidence-based validation)
- L5: Session Audit (Closure verification)
- Dashboard: Economic & Context tracking

**Retrieval Workflow:** Windsurf hardcoded (L0 â†’ L4 â†’ L1) â†’ SCMS directed (L2/L3 â†’ L5 if needed) â†’ Generate (if no retrieval) â†’ L4 compliance check

**Promotion Thresholds:**
- Greenfield (Weeks 1-4): n>5 uses (Current Target)
- Establishing (Months 2-3): n>3 uses 
- Mature (4+ months): n>=2 uses 

## Instructions for AI

### 1. ZERO-STATE INITIALIZATION (Greenfield/Integration)
**IF docs/scms/ DOES NOT EXIST:**

**A. Create Directory Structure:**
1. docs/scms/ (Operational Logs)
2. docs/templates/ (Standardization)
3. docs/guides/ (Manuals)

**B. Initialize Templates (The "Gold Standard"):**
1. Create docs/templates/FAILURE_LOG_TEMPLATE.md
2. Create docs/templates/PATTERN_PROMOTION_TEMPLATE.md
3. Create docs/templates/SESSION_CLOSURE_REPORT_TEMPLATE.md

**C. Initialize Operational Files:**
1. docs/scms/INDEX.md (Central Hub skeleton)
2. docs/scms/MEMORY_STATUS_DASHBOARD.md (Greenfield config)
3. docs/scms/FAILURES.md (Empty log)
4. docs/scms/WORKSPACE_RULES.md (Empty L1)
5. economics-dashboard-data.json OR scms-metrics.json (Initialize with session: [] array)

### 2. SESSION START CHECKLIST (Before Coding)
1. **Environment Check**:
   - Verify package.json scripts.
   - **Template Verification**: Do docs/templates/ exist?
   
2. **Greenfield Project Validation** âš ï¸:
   - IF this is the FIRST session on a NEW project:
     - WORKSPACE_RULES.md should contain ONLY scaffolding (no promoted patterns)
     - L1 section should be EMPTY or show "Pattern Template (Remove this when you add real patterns)"
     - DO NOT pre-populate with invented patterns
     - Patterns will be discovered and promoted DURING development
   - IF patterns exist in L1: VERIFY they have legitimate use counts from THIS project
   
3. **Review L4 Global Rules**:
   - Check rules/GLOBAL_CODING_RULES.md.
   
4. **Review Memory Dashboard**:
   - Check docs/scms/MEMORY_STATUS_DASHBOARD.md for Active Patterns.

### 3. DURING DEVELOPMENT (The Workflow)
1. **CREATE MEMORIES (L0)**: 
   - Pattern discovered -> Create Cascade memory.
   
2. **FAILURE DOCUMENTATION (L2 - Priority)**:
   - **Trigger**: Any mock failure, tool error, or regression.
   - **Action**: Update docs/scms/FAILURES.md.
   - **Constraint**: MUST uses docs/templates/FAILURE_LOG_TEMPLATE.md (5 Whys required).
   
3. **PATTERN PROMOTION (L3)**:
   - **Trigger**: L0 Pattern used n>=5 times.
   - **Action**: Fill docs/templates/PATTERN_PROMOTION_TEMPLATE.md to request L1 status.

### 4. SESSION CLOSURE (L5 - Critical)
At end of EVERY session, run closure protocol:
1. **Audit**: Generate docs/scms/SESSION_LOG_L5.md using docs/templates/SESSION_CLOSURE_REPORT_TEMPLATE.md.
2. **Export**: Run Dashboard Export to capture checkpoints/checkpoint-[ID].txt.
3. **Update**: INDEX.md and Dashboards.

Ready to configure SCMS. Let's start by initializing the directory structure and templates.
