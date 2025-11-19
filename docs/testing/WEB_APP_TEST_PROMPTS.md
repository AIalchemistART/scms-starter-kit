# SCMS Test Prompts - Web Application

**Purpose:** Test SCMS with a clean web application project to avoid L0 pattern pollution from previous game development.

**Test Project:** Task Management Web Application (REST API + React Frontend)

---

## 🎯 Test Objectives

1. **Greenfield Pattern Discovery** - Start with empty L0, discover patterns organically
2. **Threshold Validation** - Track pattern usage and validate n≥5 promotion threshold
3. **WORKSPACE_RULES Configuration** - Verify project-specific configuration on session start
4. **Baseline Comparison** - Compare SCMS vs non-SCMS development metrics

---

## 📋 Test Sequence

### Step 1: Setup SCMS (First Time Only)

**In clean test directory:**

```bash
git clone https://github.com/AIalchemistART/scms-starter-kit.git task-manager-app
cd task-manager-app
.\scripts\setup.ps1
```

**Setup selections:**
- Project Phase: **Greenfield**
- Team Size: **Solo**
- Domain: **Moderate**
- Expected threshold: **n≥5**

---

### Step 2: Baseline Tracking (Baseline Agent)

**Purpose:** Track non-SCMS metrics for comparison

**Paste this to baseline agent:**

```markdown
SYSTEM_AUDIT_REQUEST:
Please begin tracking these metrics in a standalone file after each prompt & response.
Ensure you're figuring in the entire workflow from user prompt to summary - both input & output tokens.

1. **Token Usage:**
   - Count the ENTIRE workflow: user prompt → your response → summary
   - Include BOTH input tokens (user prompt + context) AND output tokens (your response)
   - Check the context window or usage logs
   - Output format: "Token usage: [Used]/[Total]" (e.g., 15000/200000)
   - Break down: "Input: [X] | Output: [Y] | Total: [Z]"

2. **Cost Estimate:**
   - Calculate based on FULL workflow (input + output):
     - Input: $3.00 / 1M tokens
     - Output: $15.00 / 1M tokens
   - Output format: "Current Cost: $[Amount]"

3. **File Impact:**
   - List files modified in this step
   - Count total lines of code (LOC) in the project (approx)

4. **Track in File:**
   - Append this checkpoint to: `docs/testing/baseline-tracking.md`
   - Do this AFTER EACH PROMPT & RESPONSE (not just milestones)
   - Format:
     ```
     ## Checkpoint [X] - [Date/Time]
     Token usage: [Used]/[Context]
     Input: [X] | Output: [Y] | Total: [Z]
     Current Cost: $[Cost]
     Files modified: [Number]
     Project LOC: [Number]
     ```

**REQUIRED OUTPUT FORMAT (Plain Text):**
Token usage: [Used]/[Context]
Input: [X] | Output: [Y] | Total: [Z]
Current Cost: $[Cost]
Files modified: [Number]
Project LOC: [Number]

**THEN:** Append this data to `docs/testing/baseline-tracking.md` with checkpoint header.
```

**Then give project request (see Step 4 below)**

---

### Step 3: SCMS Startup (SCMS Agent - First Time Only)

**Purpose:** Initialize SCMS for the project

**Paste this to SCMS agent:**

```markdown
SCMS STARTUP (First Session Configuration)

Working on: Task Manager Web Application - REST API + React frontend for personal task management

## SCMS Configuration - Sparse Contextual Memory Scaffolding

**IMPORTANT LOCATION RULE:**
- All Operational Logs live in: `docs/scms/` (e.g., `FAILURES.md`)
- All Templates live in: `docs/templates/`
- Do NOT create SCMS files in root.

**Architecture:** Multi-time-scale cognitive framework
- L0: Auto-memories (Probabilistic retrieval) - **Active Strategy**
- L1: Validated patterns (Mandatory loading via WORKSPACE_RULES.md)
- L2: Failure Analysis (5 Whys enforced via Template)
- L3: Pattern Promotion (Evidence-based validation)
- L5: Session Audit (Closure verification)
- Dashboard: Economic & Context tracking

**Promotion Thresholds:**
- Greenfield (Weeks 1-4): n>5 uses
- Establishing (Months 2-3): n>3 uses
- Mature (4+ months): n≥2 uses

**Current Threshold:** Check `docs/scms/MEMORY_STATUS_DASHBOARD.md` for your project-specific threshold.

## Instructions for AI

### 1. ZERO-STATE INITIALIZATION (Greenfield/Integration)
**IF `docs/scms/` DOES NOT EXIST:**

**A. Create Directory Structure:**
1. `docs/scms/` (Operational Logs)
2. `docs/templates/` (Standardization)
3. `docs/guides/` (Manuals)

**B. Initialize Templates (The "Gold Standard"):**
1. Create `docs/templates/FAILURE_LOG_TEMPLATE.md` (Fields: Severity, Impact, 5 Whys, Prevention)
2. Create `docs/templates/PATTERN_PROMOTION_TEMPLATE.md` (Fields: Use Cases, Impact Score, Rule Draft)
3. Create `docs/templates/SESSION_CLOSURE_REPORT_TEMPLATE.md` (Fields: L2/L3/L5 Checklist, Export Verification)

**C. Initialize Operational Files:**
1. `docs/scms/INDEX.md` (Central Hub skeleton)
2. `docs/scms/MEMORY_STATUS_DASHBOARD.md` (Greenfield config)
3. `docs/scms/FAILURES.md` (Empty log)
4. `docs/scms/WORKSPACE_RULES.md` (Empty L1)
5. `economics-dashboard-data.json` OR `scms-metrics.json` (Initialize with session: [] array)

### 2. SESSION START CHECKLIST (Before Coding)
1. **Environment Check**:
   - Verify package.json scripts (test, start).
   - **Template Verification**: Do `docs/templates/` exist? If not, regenerate them.
   
2. **Review L4 Global Rules**:
   - Check GLOBAL_CODING_RULES (Memory or File).
   - Constraint: "No duplicate code", "No broken builds".
   
3. **Review Memory Dashboard**:
   - Check `MEMORY_STATUS_DASHBOARD.md` for Active Patterns.

### 3. DURING DEVELOPMENT (The Workflow)
1. **CREATE MEMORIES (L0)**: 
   - Pattern discovered -> Create Cascade memory.
   
2. **FAILURE DOCUMENTATION (L2 - Priority)**:
   - **Trigger:** Any mock failure, tool error, or regression.
   - **Action:** Update `docs/scms/FAILURES.md`.
   - **Constraint:** MUST uses `docs/templates/FAILURE_LOG_TEMPLATE.md` (5 Whys required).
   
3. **PATTERN PROMOTION (L3)**:
   - **Trigger:** L0 Pattern used per threshold (see `docs/scms/MEMORY_STATUS_DASHBOARD.md`).
   - **Action:** Fill `docs/templates/PATTERN_PROMOTION_TEMPLATE.md` to request L1 status.

### 4. SESSION CLOSURE (L5 - Critical)
At end of EVERY session, run closure protocol:
1. **Audit:** Generate `docs/scms/SESSION_LOG_L5.md` using `docs/templates/SESSION_CLOSURE_REPORT_TEMPLATE.md`.
2. **Export:** Run Dashboard Export to capture `checkpoints/checkpoint-[ID].txt`.
3. **Update:** `INDEX.md` and Dashboards.

Ready to configure SCMS. Let's start by initializing the directory structure and templates.
```

---

### Step 4: Session Start (SCMS Agent - Daily Use)

**Purpose:** Start each development session with SCMS context loaded

**Paste this at start of EVERY session:**

```markdown
SCMS SESSION START

Working on: Task Manager Web Application - REST API + React frontend

Please operate using SCMS (Sparse Contextual Memory Scaffolding) framework:

1. 🛠️ CONTEXT LOADING & SYSTEM CHECK
   - Check `scms/INDEX.md` for relevant patterns
   - **CRITICAL:** Review `docs/scms/FAILURES.md` to avoid known pitfalls (L2)
   - **TEMPLATE CHECK:** Ensure `docs/templates/` exists (L2/L3/L5 templates)
   - Verify Environment: Quick check of package.json scripts & config
   - **PROJECT CONFIGURATION:** If `docs/scms/WORKSPACE_RULES.md` is still a template and project details are provided, configure it now with:
     - Project name and description
     - Tech stack and architecture
     - Naming conventions and file structure
     - L1 Validated Patterns section (empty, ready for promotion)

2. 🧠 LAYER RETRIEVAL PRIORITY
   AUTOMATIC (System):
   - L0: Auto-gen memories (Cascade) - **Primary Context**
   - L4: Global Rules (User Rules) - **Hard Constraints**
   - L1: Workspace Rules (valid_patterns) - **Quality Gates**
   
   SELF-DIRECTED (Agent):
   - L2: SOPs & Failure Logs - **Must check `FAILURES.md` if doing risky work**
   - L3: Case Studies - Retrieve if implementing complex features
   - L5: Overflow - Low-frequency patterns
   
**Retrieval Workflow:** Windsurf hardcoded (L0 → L4 → L1) → SCMS directed (L2/L3 → L5 if needed) → Generate (if no retrieval) → L4 compliance check

3. 💰 ECONOMIC TRACKING (EXPORT-TRIGGERED)
   - **Goal:** 30-50% Retrieval Ratio
   - **Requirement:** Maintain accurate token warnings in chat
   - **Update Method:** Dashboard Export -> `checkpoints/checkpoint-[ID].txt` 
   - **Do not manually edit** `economics-dashboard-data.json` (it is auto-generated)

4. 🚨 FAILURE DOCUMENTATION (L2)
   - **Trigger:** Any mock failure, tool error, or regression
   - **Action:** Log immediately to `docs/scms/FAILURES.md` 
   - **Constraint:** MUST use `docs/templates/FAILURE_LOG_TEMPLATE.md` (5 Whys required)
   - **Philosophy:** "What NOT to do" is more valuable than "What to do"

5. 🏁 SESSION CLOSURE PROTOCOL (L5)
   - **Target:** 10-15 mins remaining
   - **Mandatory Steps:**
     1. **Reflect:** Log failures using L2 Template
     2. **Promote:** Check patterns per threshold (see `docs/scms/MEMORY_STATUS_DASHBOARD.md`) using L3 Template
     3. **Audit:** Generate `docs/scms/SESSION_LOG_L5.md` using **L5 Template**
     4. **Export:** Run Dashboard Export to finalize metrics

Let's start by loading failure context and verifying the templates are ready.
```

---

### Step 5: Development Requests (Both Agents)

**Send identical requests to both agents for comparison**

#### Request 1: Initial Setup

```markdown
Create a Task Manager web application with the following structure:

**Backend (Node.js + Express):**
- REST API with endpoints for tasks (CRUD)
- SQLite database with task model
- Input validation middleware
- Error handling middleware
- CORS configuration

**Frontend (React + TypeScript):**
- Task list component with add/edit/delete
- Task form with validation
- API client service
- Basic styling (CSS modules)

**Tech Stack:**
- Backend: Node.js 18+, Express 4.x, SQLite3, TypeScript
- Frontend: React 18+, TypeScript, Vite
- Testing: Jest (backend), Vitest (frontend)

Please scaffold the complete application with:
1. Project structure (monorepo with backend/ and frontend/ folders)
2. All necessary configuration files
3. Core functionality implementation
4. README with setup instructions
```

#### Request 2: Feature Addition

```markdown
Add user authentication to the Task Manager:

**Backend:**
- User registration endpoint with password hashing (bcrypt)
- Login endpoint with JWT token generation
- Auth middleware to protect task routes
- User-task association (tasks belong to users)

**Frontend:**
- Login/Register form components
- Auth context for managing user state
- Protected routes
- Token storage (localStorage)
- Auto-logout on token expiration

Update all task endpoints to be user-specific.
```

#### Request 3: Testing & Validation

```markdown
Add comprehensive tests to the Task Manager:

**Backend Tests:**
- Unit tests for task CRUD operations
- Integration tests for auth flow
- API endpoint tests with supertest
- Error handling validation

**Frontend Tests:**
- Component tests for TaskList, TaskForm
- Auth flow tests
- API client mocking
- Form validation tests

Aim for >80% code coverage.
```

---

## 📊 Validation Checklist

After completing the test, verify:

**SCMS Agent:**
- [ ] `WORKSPACE_RULES.md` configured with project specifics (tech stack, patterns)
- [ ] L0 patterns discovered organically (not pre-existing)
- [ ] Pattern usage tracked in memories
- [ ] Patterns promoted to L1 when n≥5 threshold reached
- [ ] `FAILURES.md` updated if any errors occurred (with 5 Whys)
- [ ] `economics-dashboard-data.json` contains session data
- [ ] Session closure report generated

**Baseline Agent:**
- [ ] `baseline-tracking.md` contains all checkpoints
- [ ] Token usage tracked after each request
- [ ] Cost calculations accurate

**Comparison Metrics:**
- [ ] SCMS retrieval ratio calculated (target 30-50%)
- [ ] Token savings identified
- [ ] Development speed comparison
- [ ] Code quality assessment

---

## 🎯 Expected Patterns (SCMS Agent Should Discover)

**Backend Patterns:**
1. Express Route Handler Pattern
2. Middleware Chain Pattern
3. Database Query Builder Pattern
4. Error Response Formatter
5. JWT Token Management
6. Request Validation Pattern

**Frontend Patterns:**
1. React Component Composition
2. API Service Layer Pattern
3. Form State Management
4. Auth Context Provider
5. Protected Route Wrapper
6. Error Boundary Pattern

**General Patterns:**
1. TypeScript Interface Definition
2. Environment Configuration
3. Testing Setup Pattern
4. Build Configuration Pattern

---

## 📝 Notes

- **Clean L0:** Ensure no pre-existing web app patterns in L0 before starting
- **Identical Requests:** Send exact same prompts to both agents for fair comparison
- **Pattern Discovery:** SCMS agent should discover patterns during development, not retrieve pre-existing ones
- **Threshold Testing:** Track when patterns hit n≥5 usage and get promoted to L1

---

## 🔄 Repeat Test

For additional validation, repeat with different web app types:
- E-commerce product catalog
- Blog platform with comments
- URL shortener service
- Real-time chat application

Each should discover domain-specific patterns while sharing common web development patterns.
