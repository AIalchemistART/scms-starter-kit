# SCMS Starter Kit

**Sparse Contextual Memory Scaffolding** - A validated system for continual learning in AI-assisted development.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Documentation](https://img.shields.io/badge/docs-complete-brightgreen.svg)](docs/)

**📄 Research Papers**: [SCMS (Empirical)](WHITEPAPER.md) | [Paradigm Shift (Design)](WHITEPAPER_PARADIGM_SHIFT.md) | [Mixture of Memories (Theory)](WHITEPAPER_MIXTURE_OF_MEMORIES.md)

---

## What is SCMS?

A **5-layer documentation system** that enables AI assistants to learn continuously from your development workflow, dramatically reducing pattern re-discovery time and documentation debt.

**Validated Results** (4-month game development project):
- ✅ **91% reduction** in pattern re-discovery time
- ✅ **94% knowledge retention** rate
- ✅ **<2 hour** documentation lag (was 2 days)
- ✅ **Zero documentation debt** after stabilization

---

## How It Works

SCMS creates an **automated validation pipeline** for knowledge:

```
Pattern Discovery → L0 Memory (CANDIDATE) → Validation through use → L1 Quick Reference (VALIDATED)
                                                                            ↓
                                                                  L2 Detailed SOP (≥5 uses)
                                                                            ↓
                                                                  L3 Case Studies (complete examples)
```

**Key Innovation**: Patterns must **prove utility through repeated use** before promoting to permanent documentation. This prevents documentation clutter while ensuring valuable patterns are captured.

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

**📄 [SCMS (Empirical)](WHITEPAPER.md)**  
*Sparse Contextual Memory Scaffolding: A User-Facing Architecture for Continual Learning in AI-Assisted Development Workflows*

**Key Results**:
- 91% reduction in pattern re-discovery time
- 94% knowledge retention vs 37% baseline
- Documentation lag: 11.5 days → 4 hours
- Validated over 4 months, 127 implementation cycles

**📄 [Paradigm Shift (Design)](WHITEPAPER_PARADIGM_SHIFT.md)**  
*Paradigm Shift in AI Memory: From Preference Storage to Continual Learning*

Documents the emergent paradigm shift from AI memories as "digital filing cabinets" to "automated validation pipelines". Includes comparative analysis of standard vs SCMS usage patterns, five design principles, and multi-domain validation (research, content creation, data analysis, education).

**📄 [Mixture of Memories (Theory)](WHITEPAPER_MIXTURE_OF_MEMORIES.md)**  
*Mixture of Memories: A Unified Framework for Sparse Activation Across Abstraction Levels*

Establishes formal mathematical framework proving structural isomorphism between SCMS routing and Mixture of Experts architectures. Demonstrates sparse selective activation as a universal pattern from biological neurons to organizational systems.

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

**Get Started**: [SETUP.md](SETUP.md) | **Learn More**: [Whitepaper](WHITEPAPER.md) | **See Examples**: [docs/examples/](docs/examples/)

Built with ❤️ by the Labyrinth Protocol team • Validated over 4 months of real development • Open source and free to use
