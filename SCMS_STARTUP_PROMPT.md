# SCMS Startup Prompt v2.2

**Purpose**: Copy-paste this prompt at the start of each development session to ensure COMPLETE SCMS workflow with enforcement.

**Version**: 2.2 (November 11, 2025 - Adds economic optimization principles and retrieval-first bias)

---

## 🚀 For Auto-Memory L0 (Windsurf Cascade)

**Copy this entire prompt and send to Cascade AI:**

```
IMPORTANT: This project uses SCMS v1.4 (Sparse Contextual Memory Scaffolding) with AUTO-MEMORY L0 strategy + Soft Enforcement.

**SCMS ARCHITECTURE - Multi-Time-Scale Cognitive Framework:**

**Economic Optimization Principle** (53% cost reduction validated):
- **RETRIEVAL-FIRST BIAS**: Always search L0/L1 before generating new content
- **Cost asymmetry**: Retrieval ($0.002-0.003) vs Generation ($0.009-0.012)
- **Target efficiency**: >70% retrieval-based responses for maximum savings
- **Pattern ROI**: L0 patterns need 3+ reuses for break-even

**Mind-Map Framework** (Google Research validated):
- **L0 (Foundation)**: Abstract patterns, rare updates (days-weeks), test via retrieval
- **L1 (Implementation)**: Concrete solutions, medium updates (hours-days), enforce via loading
- **Dashboard (Session)**: Immediate context, frequent updates (real-time), working memory

**Dual Validation Pipeline:**
- **L0 (Destructive Validation)**: Test patterns via Cascade auto-memories (probabilistic retrieval + temporal decay)
- **L1 (Stable Validation)**: Enforce patterns via WORKSPACE_RULES.md (deterministic loading - MANDATORY quality gates)
- **L2-L4**: Reference documentation (passive, on-demand)

**Failure Documentation Priority**:
- Failures contain 10-100× more information than successes
- Bug Patterns (L0) > Anti-Patterns (L0) > Failed Approaches (L0) > Edge Cases (L1)
- Document failures immediately when discovered

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

1. **Search L1 first** (WORKSPACE_RULES.md) - Cost: $0.001-0.002
   - Found exact match? → Use directly (highest ROI)
   - Found similar? → Adapt pattern (medium ROI)
   
2. **Search L0 next** (Cascade memories) - Cost: $0.002-0.003
   - Found pattern? → Test and refine (good ROI)
   - Multiple patterns? → Combine existing (better than new)
   
3. **Generate new ONLY if** no retrieval options - Cost: $0.009-0.012
   - Must be >75% semantically different from existing
   - Document immediately for future retrieval
   - Target: <30% of responses should reach this step

**Economic Target**: >70% retrieval-based responses for maximum cost savings

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

This is TRUE SCMS v1.4 - automatic, temporal, use-validated, with adaptive thresholds and soft enforcement. Let's build!
```

---

## 📋 For Manual L0 (Cursor/Generic)

**Copy this prompt for manual markdown workflow:**

```
IMPORTANT: This project uses SCMS v1.4 (Sparse Contextual Memory Scaffolding) with MANUAL MARKDOWN L0 strategy + Soft Enforcement.

**SCMS ARCHITECTURE - Multi-Time-Scale Cognitive Framework:**

**Economic Optimization Principle** (53% cost reduction validated):
- **RETRIEVAL-FIRST BIAS**: Always search L0/L1 before generating new content
- **Cost asymmetry**: Retrieval ($0.002-0.003) vs Generation ($0.009-0.012)
- **Target efficiency**: >70% retrieval-based responses for maximum savings
- **Pattern ROI**: L0 patterns need 3+ reuses for break-even

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
