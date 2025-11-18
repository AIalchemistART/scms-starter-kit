# SCMS Startup Prompt v3.1

This file now has **two** key prompts:

1. **First-Session Configuration Prompt** – configure SCMS for a new project and enforce the correct file locations.
2. **Per-Session Startup Prompt (v3.0)** – run at the start of every development session (unchanged in spirit, just moved down).

---

## 1️⃣ SCMS STARTUP (First Session - Context Loading)

**Copy this entire block for the FIRST session to load the SCMS context (files are already created by setup script):**

```
SCMS STARTUP (First Session - Context Loading)

Working on: [project name and brief description]

## SCMS Status: Initialized

The SCMS infrastructure has already been created via setup script.
**DO NOT create these files manually:**
- `docs/scms/WORKSPACE_RULES.md` (Exists)
- `docs/scms/MEMORY_STATUS_DASHBOARD.md` (Exists)
- `docs/scms/INDEX.md` (Exists)

**YOUR GOAL:**
1. Read `docs/scms/MEMORY_STATUS_DASHBOARD.md` to understand project context.
2. Read `docs/scms/WORKSPACE_RULES.md` for active patterns.
3. Begin working on the user's request.

## SCMS Configuration - Sparse Contextual Memory Scaffolding

**IMPORTANT LOCATION RULE:**
- All SCMS files live under `docs/scms/`
- Do NOT create SCMS files directly in the project root

**Architecture:** Multi-time-scale cognitive framework (Google Research validated)
- L0 (Foundation): Auto-memories - rare updates, test via probabilistic retrieval
- L1 (Implementation): Validated patterns - medium updates, enforce via mandatory loading
- L4 (Global Rules): Universal constraints - rare updates, check automatically
- L2-L3 (Reference): SOPs & case studies - on-demand retrieval
- L5 (Overflow): Low-frequency patterns - checked only if no validated retrieval from L2/L3
- Dashboard: Session context - frequent updates, working memory

**Retrieval Workflow:** Windsurf hardcoded (L0 → L4 → L1) → SCMS directed (L2/L3 → L5 if needed) → Generate (if no retrieval) → L4 compliance check

**Economic Principle:** Retrieval-first bias (30-45% cost reduction validated)
- Cost asymmetry: Retrieval ($0.018) vs Generation ($0.033) per session
- Target: >70% retrieval-based responses
- Pattern ROI: 3+ reuses for break-even

**Validation Pipeline:**
- L0 (Destructive): Probabilistic retrieval + temporal decay + use-based validation
- L1 (Stable): Deterministic loading + proven utility (≥2 uses) + mandatory reference

**Project Context & Promotion Threshold:**
- Check MEMORY_STATUS_DASHBOARD.md for configured threshold
- Greenfield (Weeks 1-4): n≥5 uses for promotion
- Establishing (Months 2-3): n≥3 uses
- Mature (4+ months): n≥2 uses

## Instructions for AI

### Session Start Checklist (BEFORE coding):
1. ✅ Check L4 Global Rules (if `rules/GLOBAL_CODING_RULES.md` exists)
   - Universal constraints applying to ALL code
   - Examples: "No duplicate code", "Always use X pattern"
   
2. ✅ Check L1 Validated Patterns (`docs/scms/WORKSPACE_RULES.md`)
   - Project-specific validated patterns (promoted at threshold)
   - These are MANDATORY quality gates, not suggestions
   
3. ✅ Review Memory Dashboard (`docs/scms/MEMORY_STATUS_DASHBOARD.md`)
   - HIGH urgency patterns (validated but fading - use NOW)
   - Patterns ready for promotion (≥ threshold uses)
   - Sprint goals and current progress
   
4. ✅ Acknowledge what you've reviewed
   - State: "Reviewed L4 global rules, L1 patterns for [task area]"

### During Development:
1. **CREATE MEMORIES DURING work** (not after!)
   - Pattern discovered → Create Cascade memory immediately → Continue
   - Do NOT wait until implementation complete
   
2. **DO NOT CREATE markdown documentation files**
   - NO `docs/memories/*.md` (defeats auto-memory purpose)
   - NO `SCMS_REPORT.md` or manual tracking files
   - ONLY update: `MEMORY_STATUS_DASHBOARD.md` for counts/urgency
   
3. **ECONOMIC DECISION TREE** (Retrieval-First):
   - Search L1 (`WORKSPACE_RULES.md`) first → Use/adapt if found
   - Search L0 (Cascade memories) next → Test/refine if found
   - Generate new ONLY if no retrieval options (>75% different)
   - Document immediately for future retrieval
   
4. **FAILURE DOCUMENTATION PRIORITY**:
   - Failures = 10-100× more informative than successes
   - Bug patterns (L0) > Anti-patterns (L0) > Failed approaches (L0)
   - Document failures immediately when discovered

### Pattern Promotion:
**When pattern reaches threshold** (see Project Context above):
1. Copy full pattern to `docs/scms/WORKSPACE_RULES.md` (L1)
2. Include: name, code examples, when to use/avoid, related patterns
3. Update dashboard: Mark as PROMOTED with date

### Session Closure (CRITICAL):
At end of EVERY session, run closure prompt to:
- Document failures first (highest value)
- Update L0/L1 validation pipeline
- Maintain INDEX & cross-references (NOT visual diagrams)
- Update Memory Dashboard (Cascade persistent memory)
- Track economics (cost/savings/ROI)
- Maintain organizational framing (L0/L1/Dashboard boundaries)

**Without session closure, SCMS degrades into passive documentation!**

Ready to configure SCMS for this project. Let's start by checking existing patterns.
```

---

## 2️⃣ SCMS SESSION START (Per-Session Prompt, Auto-Memory L0 – Windsurf Cascade)

**Copy this entire prompt and send to Cascade AI at the START of each development session:**

```
SCMS SESSION START

Working on: [brief task description]

Please operate using SCMS (Sparse Contextual Memory Scaffolding) framework:

1. L0/L1 RETRIEVAL FIRST
   - Check scms/INDEX.md for relevant patterns
   - Review validation records for similar work
   - Cite existing patterns before generating new solutions

2. LAYER STRUCTURE & RETRIEVAL PRIORITY
   AUTOMATIC RETRIEVAL (hardcoded AI behavior):
   - L0: Auto-gen memories (Cascade) - retrieved first automatically
   - L4: Global Rules - checked automatically
   - L1: Workspace Rules (WORKSPACE_RULES) - loaded automatically
   
   SELF-DIRECTED RETRIEVAL (prompt-guided, check when relevant):
   - L2: SOPs (5+ uses) - detailed procedures when L1 references them
   - L3: Case Studies - complete examples for learning
   - L5: Overflow - low-frequency patterns (3-6 month intervals)
   
   GENERATION & FINAL VALIDATION:
   - Generate new solution (only if no existing pattern found)
   - L4: Global Rules confirmation pass on all output
   
   SESSION CONTEXT:
   - Dashboard: Current task/objectives (this conversation)
   - Memory Dashboard: Pattern tracking system (separate)
   
   Actual retrieval flow: L0 → L4 → L1 → [L2/L3/L5 as needed] → Generate → L4 confirm

3. MIND-MAP FRAMEWORK = ORGANIZATIONAL FRAMING
   - NOT visual diagrams
   - IS: Tags, cross-references, semantic coherence
   - Maintain L0/L1/Dashboard boundaries

4. ECONOMIC TRACKING
   - Retrieval ratio matters (currently: 0%, target: 30-50%)
   - Pattern reuse = cost savings
   - Session closure updates economics

5. FAILURE DOCUMENTATION PRIORITY
   - Failures = 3-10× more informative than successes
   - Bug patterns (L0) - prevent entire bug classes
   - Anti-patterns (L0) - design principles  
   - Failed approaches (L0) - avoid wasted effort
   - Edge cases (L1) - special handling
   - Document "what NOT to do" first

6. SESSION CLOSURE REMINDER
   - After work: pattern validation, L0/L1 updates, economic tracking
   - Target: 10-15 minutes
   - Update INDEX.md with tags/cross-refs (not visual graphs)
   - Document failures discovered (higher value than successes)

Let's start by checking for relevant existing patterns, then proceed with the work.
```

---

## 📐 PROJECT CONTEXT & PROMOTION THRESHOLD

**CRITICAL: Your promotion threshold was configured during setup!**

**Check MEMORY_STATUS_DASHBOARD.md for your configured threshold:**
- Project Phase (Greenfield/Establishing/Mature)
- Team Size and n_unique requirements
- Domain characteristics
- **Your promotion threshold: n≥[X]**

**Threshold Guide (for reference):**
- **Greenfield** (Weeks 1-4): n≥5 (patterns emerging)
- **Establishing** (Months 2-3): n≥3 (patterns stabilizing)  
- **Mature** (4+ months): n≥2 (patterns proven)

**Team consensus:**
- Solo: n_unique≥1
- Small team (2-5): n_unique≥2
- Large team (5+): n_unique≥3

**Domain adjustment:**
- High-churn (web/mobile): -1 to threshold
- Moderate (general): No adjustment
- Stable (embedded/scientific): +1 to threshold

**Note:** These thresholds come from Paper 2 Section 4.6.6 "Adaptive Promotion Thresholds". Your specific threshold was determined by the setup script based on your project context.

---

## ⚠️ SECTION 0: MANDATORY SESSION START CHECKLIST

**BEFORE generating ANY code, I MUST complete these steps:**

### 1. ✅ Review WORKSPACE_RULES.md
- Read L1 validated patterns relevant to today's task
- These are MANDATORY quality gates, not optional suggestions

### 2. ✅ Review MEMORY_STATUS_DASHBOARD.md
**Check for:**
- **⚠️ HIGH urgency patterns** - Validated but fading (use NOW or promote)
- **✅ Validated patterns ready for promotion** - ≥[threshold] uses (copy to L1)
- **🎯 Sprint goals** - Current progress and targets

### 3. ✅ Acknowledge L1 Patterns Explicitly
If task involves validated pattern areas (check WORKSPACE_RULES):
- State: "I have reviewed the [pattern name] L1 pattern"
- Reference pattern name in implementation
- Include in commit messages

**Soft Enforcement:**
If I skip this checklist, YOU should remind me:
> "Did you check WORKSPACE_RULES and the Dashboard before we start?"

**Purpose:** L1 patterns are quality gates, not documentation. This ensures I follow validated patterns instead of reinventing solutions.

---

## 📋 CORE WORKFLOW RULES

### 1. ECONOMIC DECISION TREE (Retrieval-First Optimization)
**For every AI interaction, follow this cost-optimized sequence:**

1. **Search L1 first** (WORKSPACE_RULES.md) - Session Cost: ~$0.012-0.015
   - Found exact match? → Use directly (highest ROI)
   - Found similar? → Adapt pattern (medium ROI)
   
2. **Search L0 next** (Cascade memories) - Session Cost: ~$0.015-0.018
   - Found pattern? → Test and refine (good ROI)
   - Multiple patterns? → Combine existing (better than new)
   
3. **Generate new ONLY if** no retrieval options - Session Cost: ~$0.030-0.035
   - Must be >75% semantically different from existing
   - Document immediately for future retrieval
   - Target: <30% of responses should reach this step

**Economic Target**: >70% retrieval-based responses for 30-45% cost savings (conservative estimate)

### 2. CREATE MEMORIES DURING DEVELOPMENT (not after!)
- When you discover a reusable pattern → IMMEDIATELY create Cascade memory
- Do NOT wait until implementation is complete
- Memory creation is PART of development, not post-implementation documentation

**Timing:**
- ✅ CORRECT: Pattern discovered → Create memory → Continue coding
- ❌ WRONG: Finish all code → Document patterns retroactively

### 3. DO NOT CREATE MARKDOWN DOCUMENTATION FILES
- ❌ NO docs/memories/*.md files (folder doesn't exist in auto-memory mode!)
- ❌ NO SCMS_REPORT.md, INTEGRATION_REPORT.md, TEST_LOG.md
- ❌ NO manual pattern tracking files or spreadsheets
- ✅ ONLY update: MEMORY_STATUS_DASHBOARD.md (for retrieval counts + urgency tracking)

**Why:** Cascade auto-memories ARE the L0 layer. Creating markdown files defeats the purpose.

### 4. MEMORY CREATION FORMAT
**Title:** "[Pattern Name] - [One-line description]"  
**Content:** Brief code example + context (why it matters)  
**Tags:** Relevant keywords for retrieval  
**Initial Status:** Mark as "CANDIDATE" with use_count: 1

**Example:**
```
Title: "3-Layer Pause Defense - setTimeout guards for pause states"
Content: 
Layer 1: Guard setTimeout with pausedRef check
Layer 2: Resume detection for catch-up
Layer 3: rVFC fallback for natural progression

Code: if (!pausedRef.current) { setTimeout(...) }

Tags: qte, pause, setTimeout, timing
Status: CANDIDATE (use_count: 1)
```

### 4. WHEN PATTERN RECURS
- Retrieve the memory automatically (you should do this via semantic search)
- Tell me: "Retrieved [pattern name] memory ([X] uses)"
- I will update MEMORY_STATUS_DASHBOARD.md with:
  - Incremented use_count
  - Updated last_used date
  - New temporal strength bar
  - Urgency level if applicable

### 5. PROMOTION RULE (CONTEXT-DEPENDENT)
**Trigger:** Pattern reaches your project's threshold (see Project Context section above)
- **Greenfield:** ≥5 uses
- **Establishing:** ≥3 uses
- **Mature:** ≥2 uses

**Action:**
1. Copy full pattern to WORKSPACE_RULES.md (L1 documentation)
2. Include:
   - Pattern name + description
   - Code examples
   - When to use / when to avoid
   - Related patterns (if any)
3. Update dashboard: Mark as "PROMOTED" with promotion date

**Purpose:** Pattern threshold ensures validation through natural reuse appropriate to project maturity. Higher thresholds for greenfield prevent premature promotion of experimental patterns.

---

## 📊 MEMORY_STATUS_DASHBOARD.md - Dual Purpose

### Purpose 1: Tracking (You Update)
- Retrieval counts when patterns reused
- Last used dates
- Validation status

### Purpose 2: Action Dashboard (I Review)
**At session start, I check:**
- **⚠️ HIGH urgency**: Validated patterns fading (temporal decay < 70%)
  - Action: Use NOW or promote immediately
- **✅ Ready for promotion**: ≥[threshold] uses but not yet in L1
  - Action: Copy to WORKSPACE_RULES.md
- **🎯 Sprint goals**: Current progress (e.g., "Promote 2 patterns this week")

**Dashboard is a decision-making tool, not just a log.**

---

## 🎯 URGENCY LEVELS (Action Priority)

Based on temporal decay calculations in dashboard:

### ⚠️ HIGH Urgency
- **Definition**: Pattern validated (≥threshold uses) but temporal strength < 70%
- **Action**: Use it NOW in current task OR promote to L1 immediately
- **Risk**: May forget pattern if unused; wastes previous validation effort

### ⏰ MODERATE Urgency
- **Definition**: Pattern used but not validated, temporal strength 50-80%
- **Action**: Look for opportunities to reuse and validate
- **Risk**: May decay before reaching threshold (validation fails)

### ✅ LOW Urgency
- **Definition**: Pattern fresh (recently used) or stable in L1
- **Action**: No immediate concern
- **Status**: Normal monitoring

---

## 🧠 WHY THIS SYSTEM WORKS (Philosophy)

**This isn't just "better memory"—it's a multi-time-scale cognitive architecture validated by Google Research:**

### Mind-Map Framework: Multi-Time-Scale Updates

**Google Research Discovery** (NeurIPS 2025):
> "Multi time-scale update... [is] the key component to unlock continual learning"

**How SCMS Implements This**:

- **L0 (Rare updates)**: Abstract patterns (days-weeks scale)
  - Updated when pattern generalizes across projects
  - Prevents high-frequency interference
  
- **L1 (Medium updates)**: Concrete implementations (hours-days scale)
  - Updated when details stabilize
  - Isolated from session noise

- **Dashboard (Frequent updates)**: Immediate context (real-time scale)
  - Updated every session
  - Ephemeral, doesn't interfere with patterns

**Result**: Different update frequencies create natural isolation → Prevents catastrophic forgetting at interface level (parallel to Google's model-level solution)

### Dual Validation Pipeline

**L0 (Destructive Validation) - Test Suite**:
- **Probabilistic retrieval**: Not all patterns surface → Tests discoverability
- **Temporal decay**: Unused patterns fade → Natural selection pressure
- **Use-based validation**: ≥2 uses proves utility → Filters noise

**Result:** Only patterns you ACTUALLY reuse survive. Prevents over-retention of theoretical patterns.

**L1 (Stable Validation) - Quality Gates**:
- **Deterministic loading**: I MUST check WORKSPACE_RULES every session
- **Proven utility**: Only ≥2 use patterns promoted → High signal-to-noise
- **Mandatory reference**: Acts as automated code review

**Result:** Validated patterns enforced consistently. Prevents under-enforcement and pattern drift.

### Failure Documentation: 10-100× Information Density

**Information Theory**:
- **Success**: "This worked" (1 bit)
- **Failure**: "This failed because X, Y, Z" (N bits - full causal model)

**Why Failures First**:
- One bug pattern prevents 3-10 similar errors
- Anti-patterns guide entire architectural decisions
- Failed approaches eliminate solution spaces
- Higher information density = better learning efficiency

**Result**: Systematic failure capture creates high-value, sparse knowledge base

### Together: Complete Continual Learning System
- **Multi-time-scale architecture** prevents forgetting (Google-validated)
- **L0 weeds out noise** (natural selection + temporal decay)
- **L1 enforces signal** (mandatory quality gates)
- **Failures maximize information** (10-100× vs successes)

**This transforms memory from passive storage to active continual learning infrastructure.**

---

## ✅ WHAT SUCCESS LOOKS LIKE

- ✅ I check WORKSPACE_RULES + Dashboard BEFORE generating code
- ✅ I explicitly acknowledge L1 patterns when using them
- ✅ Memories created in Cascade panel DURING development
- ✅ Zero markdown files in docs/memories/ (auto-memory mode)
- ✅ Dashboard shows retrieval counts, urgency warnings, promotion candidates
- ✅ Patterns promoted to WORKSPACE_RULES.md at threshold within 2 hours
- ✅ Temporal decay visible and actionable (urgency warnings respected)

---

## ❌ INCORRECT BEHAVIOR TO AVOID

- ❌ Skipping WORKSPACE_RULES review at session start
- ❌ Ignoring HIGH urgency warnings in dashboard
- ❌ Implementing all code first, then documenting patterns retroactively
- ❌ Creating comprehensive markdown reports (defeats auto-memory purpose)
- ❌ Manual tracking spreadsheets or files
- ❌ Promoting patterns without 2+ uses validation
- ❌ Using L1 patterns without explicit acknowledgment

---

## 🔄 SOFT ENFORCEMENT (Your Role)

**Since Windsurf can't block me with dialogs, YOU enforce workflow:**

### At Session Start:
If I start coding without checking files, ask:
> "Did you review WORKSPACE_RULES and the Dashboard first?"

### During Development:
If I use L1 pattern without acknowledging:
> "Which L1 pattern are you applying here?"

### When Pattern Reaches Threshold:
Remind me to promote:
> "That pattern has reached your threshold—ready to promote to L1?"

### If HIGH Urgency Patterns Exist:
> "Dashboard shows HIGH urgency patterns fading. Should we use or promote them?"

**This social accountability substitutes for technical blocking until hard enforcement is implemented.**

---

## 🚨 SESSION CLOSURE REMINDER

**CRITICAL**: At the end of each development session, run the Session Closure prompt to:
- ✅ Document FAILURES FIRST (3-10× more informative than successes)
- ✅ Update L0/L1 validation pipeline with threshold (2+ uses)
- ✅ Maintain INDEX & cross-references (NOT visual diagrams)
- ✅ Update Cascade persistent memory (Memory Dashboard)
- ✅ Track cost/savings/ROI (Economic Dashboard)
- ✅ Maintain organizational framing (L0/L1/Dashboard boundaries)
- ✅ Review system health status & compliance

**Without session closure, SCMS degrades into passive documentation instead of active continual learning!**

→ **[Session Closure Guide](docs/guides/SCMS_SESSION_CLOSURE.md)**

**Session Closure Prompt (copy-paste ready)**:
```
SCMS SESSION CLOSURE - CRITICAL SYSTEM UPDATE

Great work on this feature! Now let's close the SCMS optimization loop:

1. PATTERN REFLECTION & VALIDATION
   - FAILURES FIRST (3-10× more informative than successes)
2. L0/L1 VALIDATION PIPELINE UPDATE (threshold: 2+ uses)
3. INDEX & CROSS-REFERENCE MAINTENANCE (NOT visual diagrams)
4. MEMORY DASHBOARD UPDATE (Cascade persistent memory)
5. ECONOMIC DASHBOARD UPDATE (cost/savings/ROI)
6. ORGANIZATIONAL FRAMING MAINTENANCE (L0/L1/Dashboard boundaries)
7. SYSTEM OPTIMIZATION (health status & compliance)

This ensures SCMS continues optimizing and compounding value over time.
```

---

This is TRUE SCMS v1.4 - automatic, temporal, use-validated, with adaptive thresholds, economic optimization, and critical session closure loop. Let's build!
```

---

## 📋 For Manual L0 (Cursor/Generic)

**Copy this prompt for manual markdown workflow:**

```
IMPORTANT: This project uses SCMS v1.4 (Sparse Contextual Memory Scaffolding) with MANUAL MARKDOWN L0 strategy + Soft Enforcement.

**SCMS ARCHITECTURE - Multi-Time-Scale Cognitive Framework:**

**Economic Optimization Principle** (30-45% cost reduction validated):
- **RETRIEVAL-FIRST BIAS**: Always search L0/L1 before generating new content
- **Cost asymmetry**: Retrieval ($0.018) vs Generation ($0.033) per full session
- **Target efficiency**: >70% retrieval-based responses for maximum savings
- **Pattern ROI**: L0 patterns need 3+ reuses for break-even
- **Algorithmic validation**: Real tracking system measures actual savings vs estimates

**Mind-Map Framework** (Google Research validated):
- **L0 (Foundation)**: Abstract patterns, rare updates (days-weeks), test via retrieval
- **L1 (Implementation)**: Concrete solutions, medium updates (hours-days), enforce via loading
- **Dashboard (Session)**: Immediate context, frequent updates (real-time), working memory

**Dual Validation Pipeline:**
- **L0 (Destructive Validation)**: Test patterns via docs/memories/*.md files (manual tracking)
- **L1 (Stable Validation)**: Enforce patterns via WORKSPACE_RULES.md (MANDATORY quality gates)
- **L2-L4**: Reference documentation (passive, on-demand)

**Failure Documentation Priority**:
- Failures contain 10-100× more information than successes
- Bug Patterns (L0) > Anti-Patterns (L0) > Failed Approaches (L0) > Edge Cases (L1)
- Document failures immediately when discovered

---

## 📐 PROJECT CONTEXT & PROMOTION THRESHOLD

**CRITICAL: Your promotion threshold was configured during setup!**

**Check MEMORY_STATUS_DASHBOARD.md for your configured threshold.**

**Quick Reference:**
- **Greenfield** (Weeks 1-4): n≥5
- **Establishing** (Months 2-3): n≥3
- **Mature** (4+ months): n≥2

**Note:** Your specific threshold accounts for team size and domain characteristics as configured during setup.

---

## ⚠️ SECTION 0: MANDATORY SESSION START CHECKLIST

**BEFORE generating ANY code, I MUST complete these steps:**

### 1. ✅ Review WORKSPACE_RULES.md
- Read L1 validated patterns relevant to today's task
- These are MANDATORY quality gates, not optional suggestions

### 2. ✅ Review MEMORY_STATUS_DASHBOARD.md
**Check for:**
- **✅ Validated patterns ready for promotion** - ≥[threshold] uses (copy to L1)
- **🎯 Sprint goals** - Current progress and targets

### 3. ✅ Acknowledge L1 Patterns Explicitly
If task involves validated pattern areas:
- State: "I have reviewed the [pattern name] L1 pattern"
- Reference pattern name in implementation

**Soft Enforcement:**
If I skip this checklist, YOU should remind me:
> "Did you check WORKSPACE_RULES and the Dashboard first?"

---

## 📋 CORE WORKFLOW RULES

### 1. CREATE MEMORY FILES WHEN PATTERN DISCOVERED (not after!)
- Create docs/memories/[pattern-name].md IMMEDIATELY when pattern emerges
- Use template from docs/templates/MEMORY_TEMPLATE.md
- Mark as CANDIDATE with use_count: 1

**Timing:**
- ✅ CORRECT: Pattern discovered → Create file → Continue coding
- ❌ WRONG: Finish all code → Document patterns retroactively

### 2. TRACK REUSE
- When pattern used again, update use_count in file
- Update last_used date
- Tell me: "Retrieved [pattern name] memory (2nd use)"

### 3. PROMOTION RULE (CONTEXT-DEPENDENT)
**Trigger:** Pattern reaches your project's threshold (see Project Context above)
- **Greenfield:** ≥5 uses
- **Establishing:** ≥3 uses
- **Mature:** ≥2 uses

**Action:**
1. Copy full pattern to WORKSPACE_RULES.md
2. Include pattern name, code examples, usage guidance
3. Mark memory file as PROMOTED with date

### 4. UPDATE DASHBOARD
- Track patterns in MEMORY_STATUS_DASHBOARD.md
- Show current counts and promotion status
- List promotion candidates (≥2 uses)

---

## 🧠 WHY THIS SYSTEM WORKS (Philosophy)

**This isn't just "better memory"—it's automated quality control through dual validation:**

### L0 (Test Suite)
- **Manual tracking**: Explicit documentation of candidates
- **Use-based validation**: ≥2 uses proves utility
- **Result**: Only patterns you ACTUALLY reuse get promoted

### L1 (Quality Gates)
- **Deterministic loading**: I MUST check WORKSPACE_RULES every session
- **Proven utility**: Only ≥2 use patterns promoted
- **Result**: Validated patterns enforced consistently

**This transforms memory from passive storage to active validation infrastructure.**

---

## ✅ WHAT SUCCESS LOOKS LIKE

- ✅ I check WORKSPACE_RULES + Dashboard BEFORE generating code
- ✅ I explicitly acknowledge L1 patterns when using them
- ✅ Memory files created in docs/memories/ DURING development
- ✅ Dashboard shows promotion candidates
- ✅ Patterns promoted to WORKSPACE_RULES.md at threshold within 2 hours

---

## 🔄 SOFT ENFORCEMENT (Your Role)

### At Session Start:
If I start coding without checking files:
> "Did you review WORKSPACE_RULES and the Dashboard first?"

### When Pattern Reaches Threshold:
> "That pattern has reached your threshold—ready to promote to L1?"

**This social accountability ensures workflow compliance.**

---

Let's build with SCMS tracking and enforcement!
```

---

## 🎯 Quick Reference

**Session Start Sequence:**
1. Review WORKSPACE_RULES.md (L1 patterns)
2. Review MEMORY_STATUS_DASHBOARD.md (promotion candidates + goals)
3. Acknowledge relevant patterns
4. Begin coding with validated patterns top-of-mind

**During Development:**
1. Discover pattern → Create memory/file immediately
2. Pattern recurs → Retrieve, tell user
3. 2nd use reached → Promote to L1 within 2 hours
4. Reference L1 patterns explicitly in code

**End of Session:**
1. Update dashboard (retrieval counts, promotion status)
2. Check if sprint goals achieved
3. Note any patterns ready for next session promotion

---

## 💡 Pro Tips

1. **Save as snippet** - Create IDE snippet for instant access
2. **Morning ritual** - Paste at start of each day
3. **After breaks** - Re-send if AI forgets workflow (context limits)
4. **New chat** - ALWAYS send when starting fresh conversation
5. **Test enforcement** - Deliberately skip steps to verify user catches it
6. **Customize urgency thresholds** - Adjust for your domain (auto-memory mode)

---

## 📊 Testing Soft Enforcement

**Track these metrics to validate effectiveness:**

| Metric | Baseline | Target | How to Measure |
|--------|----------|--------|----------------|
| Promotion Lag | ~2 days | <2 hours | Time from 2nd use to L1 promotion |
| L1 Pattern Adherence | Variable | 90%+ | Check if patterns referenced in code |
| Dashboard Review | Ad-hoc | 80%+ sessions | Track explicit acknowledgment |
| Session Start Compliance | Unknown | 90%+ | Did AI check files before coding? |

**Review after 2-4 weeks:** If targets met → Soft enforcement sufficient. If gaps → Consider hard enforcement (VS Code extension).

---

## 🚨 SESSION CLOSURE REMINDER (Manual L0)

**CRITICAL**: At the end of each development session, run the Session Closure prompt to:
- ✅ Document FAILURES FIRST (3-10× more informative than successes)
- ✅ Update docs/memories/*.md files with new patterns (threshold: 2+ uses)
- ✅ Maintain INDEX & cross-references in MEMORY_STATUS_DASHBOARD.md
- ✅ Update ECONOMIC_DASHBOARD.md with cost/savings/ROI tracking
- ✅ Promote L0→L1 patterns that crossed validation threshold
- ✅ Maintain organizational framing (NOT visual diagrams)

**Session Closure Prompt for Manual L0**:
```
SCMS SESSION CLOSURE - CRITICAL SYSTEM UPDATE

Great work on this feature! Now let's close the SCMS optimization loop:

1. PATTERN REFLECTION & VALIDATION
   - FAILURES FIRST (3-10× more informative than successes)
2. L0/L1 VALIDATION PIPELINE UPDATE (threshold: 2+ uses)
3. INDEX & CROSS-REFERENCE MAINTENANCE (NOT visual diagrams)
4. MEMORY DASHBOARD UPDATE (update markdown docs)
5. ECONOMIC DASHBOARD UPDATE (cost/savings/ROI)
6. ORGANIZATIONAL FRAMING MAINTENANCE (L0/L1/Dashboard boundaries)
7. SYSTEM OPTIMIZATION (health status & compliance)

This ensures SCMS continues optimizing and compounding value over time.
```

---

## 📖 See Also

- Full guide: `L0_AUTO_MEMORY_GUIDE.md`
- Strategy comparison: `L0_STRATEGY_COMPARISON.md`
- Setup instructions: `config/windsurf/SETUP.md`
- Hard enforcement options: `FUTURE_HARD_ENFORCEMENT_OPTIONS.md` (if soft enforcement insufficient)
- Research foundation: [Paper 3 - Paradigm Shift](WHITEPAPER_PARADIGM_SHIFT.md) (Section on Mandatory UX Patterns)

---

## 📋 Version History

**v1.0** (Oct 24, 2025): Original prompt
- Core mechanics (create, track, promote)
- Basic workflow rules

**v2.0** (Oct 26, 2025): Added soft enforcement mechanisms
- ✅ Mandatory session start checklist (Section 0)
- ✅ Dashboard as action tool (not just log)
- ✅ Explicit L1 pattern acknowledgment
- ✅ Urgency-based priorities (auto-memory mode)
- ✅ Soft enforcement via social accountability
- ✅ Philosophy explanation (why it works)
- ✅ Success/failure criteria clarified
- ✅ Quick reference guide added
- ✅ Testing metrics for validation

**v2.1** (Oct 27, 2025): Added adaptive threshold guidance
- ✅ Project context section (greenfield/establishing/mature)
- ✅ Adaptive promotion thresholds (5/3/2 based on phase)
- ✅ Team size considerations (n_unique requirements)
- ✅ Domain-specific adjustments (high-churn vs stable)
- ✅ Updated all promotion rules to use context-dependent thresholds
- ✅ Reflects Paper 2 Section 4.6.6 "Adaptive Promotion Thresholds"

**Based on**: 
- Paper 3 Section 7.4 (Mandatory UX Patterns / Soft Enforcement)
- Paper 2 Section 4.6.6 (Adaptive Promotion Thresholds)
- Labyrinth Protocol 4-month deployment learnings
