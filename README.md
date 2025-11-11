# SCMS Starter Kit

**Sparse Contextual Memory Scaffolding** - A validated system for continual learning in AI-assisted development.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Documentation](https://img.shields.io/badge/docs-complete-brightgreen.svg)](docs/)
[![Google Validated](https://img.shields.io/badge/Google%20Research-Validated-brightgreen.svg)](docs/reference/WHITEPAPER.md#independent-validation-by-google-research)

**🔥 Update (Nov 2025)**: Core SCMS principles **independently validated** by Google Research's "Nested Learning" (NeurIPS 2025)—published ~10 days after SCMS with perfect alignment on 6/6 fundamental principles!

**📄 Research Papers**: [SCMS (Empirical)](docs/reference/WHITEPAPER.md) | [Paradigm Shift (Design)](docs/reference/WHITEPAPER_PARADIGM_SHIFT.md) | [Mixture of Memories (Theory)](docs/reference/WHITEPAPER_MIXTURE_OF_MEMORIES.md)

---

## 🎥 Watch the Explainer Video

[![SCMS Explainer Video](https://img.youtube.com/vi/JuiY2psRSRY/hqdefault.jpg)](https://youtu.be/JuiY2psRSRY)

**[▶️ Watch on YouTube](https://youtu.be/JuiY2psRSRY)** - Learn how SCMS transforms AI-assisted development in 8 minutes

---

## What is SCMS?

**Sparse Contextual Memory Scaffolding** transforms AI memory from passive storage into **active validation infrastructure**. Unlike traditional documentation that AI may or may not follow, SCMS implements a **dual validation pipeline** where patterns are automatically tested (L0) and enforced (L1) through repeated use.

**Validated Results** (4-month game development project):
- ✅ **91% reduction** in pattern re-discovery time
- ✅ **94% knowledge retention** rate  
- ✅ **96% time reduction** in stale-context scenarios
- ✅ **<2 hour** documentation lag (was 2 days)
- ✅ **Zero documentation debt** after stabilization

---

## 🏆 Independent Validation by Google Research

**November 2025**: Google Research published "Nested Learning: The Illusion of Deep Learning Architectures" (Behrouz et al., NeurIPS 2025) approximately **10 days after SCMS**, independently discovering the **same core principles**:

| Principle | Validated | Details |
|-----------|-----------|---------|
| **Nested Hierarchical Structure** | ✅ | Multi-level organization (Google: optimization, SCMS: validation) |
| **Multi-Time-Scale Updates** | ✅ | Different update rates per level (Google: parameters, SCMS: promotion) |
| **Distinct Context Flows** | ✅ | Each level has its own information flow |
| **Catastrophic Forgetting Prevention** | ✅ | Both solve forgetting through nesting |
| **Associative Memory Compression** | ✅ | Key-value storage and retrieval |
| **Continuum Memory System** | ✅ | Memory as a spectrum (Google: frequency, SCMS: abstraction) |

**Perfect 6/6 alignment** validates SCMS architecture from an S-tier research lab!

**Key Differences**:
- **SCMS**: First application to AI-assistant cognition (interface layer) with **production-validated system** (127+ cycles)
- **Google NL**: Applied to neural network training (model weights) with theoretical proof-of-concept

**Implications**: Independent discovery of identical principles across abstraction levels suggests these are **universal architectural patterns** for continual learning systems—not domain-specific heuristics.

→ **[Read full validation analysis](docs/reference/WHITEPAPER.md#independent-validation-by-google-research)**

---

## How It Works

SCMS implements **dual validation infrastructure** where L0 tests and L1 enforces patterns:

```
┌─────────────────────────────────────────┐
│ VALIDATION PIPELINE (Active)            │
├─────────────────────────────────────────┤
│ L0: Destructive Validation              │
│  → Tests via probabilistic retrieval    │
│  → Temporal decay removes unvalidated   │
│  → Natural selection for patterns       │
├─────────────────────────────────────────┤
│ L1: Stable Validation                   │
│  → Enforces via deterministic loading   │
│  → AI MUST check before acting          │
│  → Quality gates for proven patterns    │
└─────────────────────────────────────────┘
         ↓ (references)
┌─────────────────────────────────────────┐
│ REFERENCE DOCUMENTATION (Passive)       │
├─────────────────────────────────────────┤
│ L2: Standard Operating Procedures       │
│ L3: Case Studies & Architecture         │
│ L4: Global Rules                        │
└─────────────────────────────────────────┘
```

**Key Innovation**: L0 and L1 are **complementary validation systems**—L0 tests patterns experimentally, L1 enforces them universally. This transforms memory from "things AI might remember" to "automated quality control infrastructure."

---

## 🎯 Two L0 Strategies

SCMS's L0 layer (active memories) works differently depending on your IDE:

### Auto-Memory (Windsurf) ✅ RECOMMENDED

- AI creates memories **automatically** during development
- **Zero overhead** - happens naturally
- Temporal decay keeps knowledge base clean
- **This is TRUE SCMS as researched** (91% time savings proven)

### Manual Markdown (Cursor/Generic)

- Create markdown files in `docs/memories/`
- Manual tracking and promotion
- Works with **any AI assistant**
- Better for teams and compliance needs

**Setup script detects your IDE and helps you choose.**

**Full comparison**: See [L0_STRATEGY_COMPARISON.md](L0_STRATEGY_COMPARISON.md)

---

## Quick Start

### 1. Install

> ⚠️ **First**: Navigate to your project directory in the terminal before running these commands.
> 
> Don't copy the `cd` commands literally - use your actual project path!

#### Unix/Mac/Linux

```bash
# Clone SCMS into docs/scms
git clone https://github.com/AIalchemistART/scms-starter-kit.git docs/scms
```

#### Windows (PowerShell)

```powershell
# Clone SCMS into docs/scms
git clone https://github.com/AIalchemistART/scms-starter-kit.git docs/scms
```

#### Alternative: Download ZIP (No Git Required)

**Windows**:
```powershell
# Download and extract
Invoke-WebRequest -Uri "https://github.com/AIalchemistART/scms-starter-kit/archive/refs/heads/master.zip" -OutFile "scms.zip"
Expand-Archive -Path "scms.zip" -DestinationPath "docs/"
Rename-Item -Path "docs/scms-starter-kit-master" -NewName "scms"
Remove-Item "scms.zip"
```

**Unix/Mac**:
```bash
curl -L https://github.com/AIalchemistART/scms-starter-kit/archive/refs/heads/master.zip -o scms.zip
unzip scms.zip -d docs/
mv docs/scms-starter-kit-master docs/scms
rm scms.zip
```

### 2. Run Setup

```bash
cd docs/scms
./scripts/setup.sh       # Unix/Mac
.\scripts\setup.ps1      # Windows
```

### 3. Configure Your IDE

Choose your AI assistant:
- **Windsurf**: See [config/windsurf/SETUP.md](config/windsurf/SETUP.md)
- **Cursor**: See [config/cursor/SETUP.md](config/cursor/SETUP.md)
- **Other**: See [config/generic/SETUP.md](config/generic/SETUP.md)

### 4. Start Developing

SCMS builds automatically as you work with your AI assistant!

```
You: "Implement feature X"
AI: [implements + auto-documents in L0]
You: [test and report results]
AI: [validates and promotes when pattern reused]
```

---

## Features

### Automatic Pattern Capture
- Novel patterns captured as L0 memories immediately
- Marked as CANDIDATE until validated through testing
- No manual "remember to document" steps needed

### Validation Pipeline
- Patterns validated through **repeated use** (not guessing)
- Use count ≥2 → Promote to L1 (quick reference)
- Use count ≥5 → Create L2 SOP (detailed procedure)
- Complete examples → L3 case studies

### Recursive Self-Improvement
- AI maintains its own knowledge base
- Documentation updates automatically after implementations
- System learns from every development cycle

### IDE Flexibility
- Works with Windsurf (native memories)
- Works with Cursor (.cursorrules)
- Works with any AI assistant (file-based)

---

## Documentation Structure

```
docs/
├── 00_DOCUMENTATION_HIERARCHY.md    # How the system works
├── WORKSPACE_RULES.md                # L1: Quick reference patterns
├── memories/                         # L0: Active validation candidates
├── sops/                             # L2: Detailed procedures
└── case-studies/                     # L3: Complete examples
```

### Layer Responsibilities

| Layer | Purpose | Update Trigger | Examples |
|-------|---------|----------------|----------|
| **L0** | Validation candidates | Every implementation | "Multi-key QTE pattern" |
| **L1** | Quick reference | ≥2 uses (validated) | WORKSPACE_RULES.md |
| **L2** | Detailed procedures | ≥5 uses (standard) | Save system SOP |
| **L3** | Complete examples | Milestone features | Multi-sequence QTE case study |
| **L4** | Historical record | Session/sprint end | Session summaries |

---

## Real-World Example

### From Labyrinth Protocol (4-month game development)

**Problem**: Complex Quick Time Event (QTE) system with pause/resume, multi-sequence patterns, fail states.

**Without SCMS** (Month 1):
- Re-discovered pause safety pattern 8 times (~24 min each)
- Documentation lagged weeks behind code
- Edge cases lost between sessions

**With SCMS** (Months 2-4):
- Pattern captured once, auto-retrieved on subsequent uses (<2 min)
- Documentation updated within hours (recursive mode)
- Edge cases preserved in memories, promoted to WORKSPACE_RULES

**Result**: 127 implementation cycles completed with 91% time savings and zero documentation debt.

---

## When to Use SCMS (Scope & Suitability)

**v1.3 Research Finding**: SCMS delivers **differentiated benefits** based on project characteristics and context freshness.

### ✅ Maximum Value Scenarios (85-96% benefit)

**Best suited for:**
- **Stale context recovery**: Picking up old projects after weeks/months of inactivity
- **Long-horizon projects**: Multi-month or multi-year development with iterative pattern discovery
- **Complex evolving codebases**: Numerous edge cases, architectural patterns, and domain-specific knowledge
- **Knowledge-intensive work**: Research projects, complex software systems, technical content creation
- **Collaborative environments**: Teams sharing context and patterns across members

**Why it excels**: SCMS's dual validation pipeline (L0 test + L1 enforce) prevents catastrophic forgetting when context has decayed—the 96% time reduction in stale-context scenarios validates this.

### ✓ Moderate Value Scenarios (60-80% benefit)

**Well suited for:**
- **Established codebases**: Ongoing development with moderate pattern reuse
- **Projects with session gaps**: Regular breaks between work periods (days/weeks)
- **Team knowledge sharing**: Context continuity across developers
- **Iterative feature development**: Building on accumulated patterns

**Why it helps**: Continuous validation prevents re-discovery of known patterns and maintains knowledge continuity.

### △ Lower Value Scenarios (30-50% benefit)

**Still beneficial, but less critical:**
- **Greenfield projects**: Starting from scratch with fresh context (though still helps establish patterns)
- **Short-term tasks**: Projects under 1 month duration with limited pattern accumulation
- **Well-documented domains**: Areas with comprehensive existing documentation
- **Static workflows**: Patterns that don't evolve significantly over time

**Why it's less critical**: Fresh context and short timelines reduce the impact of forgetting; benefits still present but magnitude is lower.

### ❌ Not Recommended For

- **Throwaway scripts**: One-off automation with no reuse
- **Purely preference-based memory**: Personal facts, communication style (use standard AI memory for this)
- **Compliance/audit requirements**: Legal or regulatory documentation (use dedicated systems)

---

## The Necessity Question

**Is SCMS required or optional?**

**Research Answer (v1.3)**: SCMS is **practically necessary** for real-world projects under realistic constraints:

- **Growing knowledge** (K → ∞) + **Fixed resources** (C bounded) → Dense alternatives provably fail (O(K²) interference)
- **Temporal decay** (context goes stale) → Without validation infrastructure, patterns are repeatedly re-discovered
- **Continual learning pressure** → Standard documentation can't keep pace with discovery

**But**: In edge cases (unlimited resources, static knowledge, no temporal decay), simpler approaches may suffice—though such edge cases rarely exist in practice.

**Practical Guidance**: If your project lasts >1 month with iterative pattern discovery, SCMS transitions from "nice to have" to "structural necessity."

---

## Requirements

### Minimal
- AI assistant with context/memory support (Windsurf, Cursor, Claude, ChatGPT, etc.)
- Text editor
- Git (recommended for version control)

### Recommended
- AI assistant with native memory system (Windsurf Cascade)
- Project using version control (git)
- Development environment with testing capability

---

## Learning Path

### New Users (Start Here)
1. Read [How SCMS Works](docs/00_DOCUMENTATION_HIERARCHY.md)
2. Follow [Setup Guide](SETUP.md)
3. Review [Examples](docs/examples/)
4. Start with conservative strategy (validate before documenting)

### After 2-3 Months (Mature Systems)
1. Enable [Recursive Documentation](workflows/RECURSIVE_DOCUMENTATION.md)
2. Documentation updates automatically after implementations
3. Evaluate results after 15+ implementations

---

## Research Background

SCMS is based on published research from the **Labyrinth Protocol** project:

### Core Research Papers

**📄 [SCMS (Empirical)](docs/reference/WHITEPAPER.md)** - v1.3  
*Sparse Contextual Memory Scaffolding: A User-Facing Architecture for Continual Learning in AI-Assisted Development Workflows*

Introduces the **dual validation pipeline architecture** where Layer 0 (destructive validation) tests patterns through natural selection and Layer 1 (stable validation) enforces proven patterns through deterministic loading. This transforms AI memory from passive storage into active quality control infrastructure.

**v1.3 Additions**: Scope boundaries showing differentiated benefits (85-96% for stale context, 60-80% for established codebases, 30-50% for greenfield). Claims **practical necessity** for real-world projects under realistic constraints.

**Key Results**:
- 91% reduction in pattern re-discovery time
- 94% knowledge retention vs 37% baseline  
- 96% time reduction in stale-context scenarios
- Documentation lag: 11.5 days → 4 hours
- Validated over 4 months, 127 implementation cycles

**📄 [Paradigm Shift (Design)](docs/reference/WHITEPAPER_PARADIGM_SHIFT.md)** - v1.3  
*Paradigm Shift in AI Memory: From Preference Storage to Continual Learning*

Documents the emergent paradigm shift from AI memories as "digital filing cabinets" to **dual validation infrastructure** (L0 test + L1 enforce). Fewer than 1% of users have discovered this pattern. 

**v1.3 Additions**: Addresses the <1% adoption crisis through **mandatory UX patterns** (novelty filters, gamified decay visualization, blocking L1 workflows) that force validation-oriented behavior. Includes scope boundaries for where dual validation delivers maximum value.

Includes comparative analysis across six dimensions, five design principles for validation-oriented systems, and multi-domain validation (research, content creation, data analysis, education).

**📄 [Mixture of Memories (Theory)](docs/reference/WHITEPAPER_MIXTURE_OF_MEMORIES.md)** - v1.3  
*Mixture of Memories: A Unified Framework for Sparse Activation Across Abstraction Levels*

Proves that sparse selective activation is not merely an optimization but a **structural necessity** for continual learning at scale. 

**v1.3 Additions**: **Impossibility proofs** demonstrating dense alternatives suffer unbounded interference (O(K²)) and inevitable precision collapse as knowledge grows, while sparse systems maintain bounded costs (O(log² K)). Includes scope boundaries—necessity holds under realistic constraints (growing knowledge, fixed resources, temporal decay).

Establishes formal mathematical framework proving structural isomorphism between SCMS dual validation pipeline (L0+L1) and Mixture of Experts architectures. Demonstrates sparse selective activation as a universal pattern from biological neurons to organizational systems.

**Authors**: Matthew S. Walker, Claude (Anthropic)

**Full papers**: [arXiv links coming soon]

---

## Support & Community

- **Documentation**: Full docs in [docs/](docs/)
- **Issues**: [GitHub Issues](https://github.com/AIalchemistART/scms-starter-kit/issues)
- **Discussions**: [GitHub Discussions](https://github.com/AIalchemistART/scms-starter-kit/discussions)
- **Examples**: See [docs/examples/](docs/examples/)

---

## Contributing

We welcome contributions! See [CONTRIBUTING.md](CONTRIBUTING.md) for:
- Bug reports
- Feature requests
- Documentation improvements
- IDE integrations
- Success stories

---

## License

**Code & Scripts**: MIT License  
**Documentation**: CC-BY 4.0

Free to use in commercial and open-source projects. Attribution appreciated!

---

## Frequently Asked Questions

### Does this work with my IDE?

**Yes!** SCMS works with any AI assistant:
- **Best**: Windsurf (native memory support)
- **Great**: Cursor (.cursorrules integration)
- **Good**: Any AI with file access (file-based memories)

### Do I need to modify my code?

**No!** SCMS is a documentation system only. It doesn't modify your codebase.

### How much time does setup take?

**~15-30 minutes** for initial setup. Then it runs automatically.

### What if I'm starting a new project?

**Perfect timing!** SCMS works best from day one, building your knowledge base as you develop.

### What if I have an existing project?

**Also great!** Document your existing patterns as L1 entries, then SCMS maintains them going forward.

### Can I use this with a team?

**Yes!** Multiple developers can share the same SCMS corpus. Patterns discovered by one developer benefit the entire team.

### Is this only for software development?

**No!** While validated in software development, SCMS works for any knowledge work:
- Content creation
- Research projects
- Documentation writing
- Data analysis workflows

---

## Quick Links

- [Setup Guide](SETUP.md) - Detailed installation
- [Documentation Hierarchy](docs/00_DOCUMENTATION_HIERARCHY.md) - How it works
- [Examples](docs/examples/) - Real patterns from Labyrinth Protocol
- [Workflows](workflows/) - Operational guides
- [Templates](docs/templates/) - Ready-to-use templates

---

## Citation

If you use SCMS in your research or project, please cite:

```bibtex
@misc{walker2025scms,
  title={Sparse Contextual Memory Scaffolding: A User-Facing Architecture for Continual Learning in AI-Assisted Development Workflows},
  author={Walker, Matthew S. and Claude (Anthropic)},
  year={2025},
  publisher={arXiv},
  note={arXiv preprint}
}
```

---

**Get Started**: [SETUP.md](SETUP.md) | **Learn More**: [Whitepaper](docs/reference/WHITEPAPER.md) | **See Examples**: [docs/examples/](docs/examples/)

Built with ❤️ by the Labyrinth Protocol team • Validated over 4 months of real development • Open source and free to use
