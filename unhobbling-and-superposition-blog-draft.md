# Unhobbling and the Superposition Problem: Why AI Can't Think While It Talks

**January 1, 2026**  
**14 min read**

*Independent Discovery, Convergent Insights, and the Next Frontier in AI Architecture*

By Matthew "Manny" Walker

---

## The Validation

Today, I watched a YouTube video that stopped me cold.

The video covered Leopold Aschenbrenner's June 2024 paper "Situational Awareness: The Decade Ahead" and explained how AI systems are achieving human-level performance on the notoriously difficult ARC-AGI 2 benchmark—not through bigger models, but through better **scaffolding**.

Aschenbrenner calls this principle "unhobbling." And as I watched, I realized: I'd been working on the same problem, independently, for months.

Last month, I published "Einstein's Rock and the Hidden Layer of Thought," exploring how AI systems lack access to what I called the "ineffable space"—the hypnagogic realm where humans think without speaking. I argued that current language models are forced to collapse every thought into tokens immediately, losing the richness of probabilistic exploration.

What I didn't know until today: one of the top AI researchers in the world had identified the same architectural constraint from a different angle.

This post is about that convergence, what it means, and where the next breakthrough might be hiding.

---

## What Is Unhobbling?

Aschenbrenner's core insight is deceptively simple:

> *"Imagine if when asked to solve a hard math problem, you had to instantly answer with the very first thing that came to mind... That's how we had LLMs solve math problems. Most of us work through the problem step by step on a scratch pad. Chain-of-thought prompting unlocked that for LLMs."*

**Unhobbling** means removing artificial constraints that prevent AI systems from using their existing capabilities fully.

Current models are hobbled because they:
- Have no long-term memory
- Can't use tools seamlessly  
- Must answer immediately (even with o1/o3 reasoning, once output starts, it's locked)
- Don't maintain persistent internal states between outputs

The biggest gains in AI aren't coming from bigger models—they're coming from **removing these constraints**.

---

## The ARC-AGI 2 Breakthrough

The video I watched showed something remarkable:

A company called Poetic took the same base models (GPT-5, Gemini, Grok) and **doubled their performance** on ARC-AGI 2 without touching the underlying neural architecture.

| Model | Baseline Score | With Poetic's Meta-System | Improvement |
|-------|----------------|---------------------------|-------------|
| Grok 4 Fast | 56% | 72% | +16 points |
| Gemini 3 Pro | ~30% | 60%+ | +30 points |
| GPT-5.2X High | ~60% | **76%** | +16 points (now **above human average**) |

How? They built a **manager layer** that:
- Decides which model to use for which subtask
- Breaks problems into steps
- Self-checks progress
- Stops early when the solution is good enough
- Generates code when needed

This is unhobbling in action. The intelligence isn't in the model—it's in how the entire **system** thinks.

---

## What I Found Independently

In December 2025, I published a piece exploring why AI systems can't access what humans call "hypnagogia"—the liminal state between waking and sleeping where Einstein held a rock over a metal plate to catch insights before they vanished.

My framework used quantum mechanics as an analogy:

**In quantum mechanics**, particles exist in superposition until observed. Measurement collapses the waveform into a single definite state.

**In cognition**, verbalization is measurement. When we translate thought into words, we collapse probabilistic mental states into sequential language.

**Current AI** has no private thinking space. Every thought becomes a token immediately. Every token is a collapse. No superposition, no hypnagogia, no rock-in-hand moment.

I discovered the same constraint Aschenbrenner identified—but I framed it differently:

**Aschenbrenner**: Models are hobbled because they must answer immediately.  
**My addition**: Even with hidden thinking layers (like the HRM paper's dual-module architecture), models still can't **reverberate** between thinking and speaking the way humans do.

---

## The Reverberation Gap

Here's what I realized that goes beyond current unhobbling approaches:

**Humans don't just think-then-speak. We think-while-speaking.**

Right now, as you read this, I'm doing something remarkable: I'm accessing the liminal probability space of half-formed thoughts *while simultaneously* collapsing specific ideas into words. And critically—**I can pivot mid-stream**.

Have you ever been mid-sentence when suddenly a new insight strikes? A moment of satori—sudden awakening—where you realize something you didn't know you knew? You pause, redirect, and your verbalization takes an entirely new direction.

**Language models can't do this.**

Even with extended reasoning (o1/o3) or dual-layer architectures (HRM), once token production begins, the model is locked into pattern completion. It cannot:
- Pause to re-enter hidden reasoning space
- Have a sudden realization that contradicts what it just wrote
- Pivot based on mid-stream insight

The architecture is sequential:

```
Current AI: [Hidden reasoning] → [Verbalization] → [Done]
                              ↓
                    No return path

Humans: [Hidden] ↔ [Verbalization] ↔ [Hidden] ↔ [Verbalization]
              ↑                           ↑
        Continuous bidirectional feedback
```

**This might be the next frontier.**

---

## Simulated Superposition: A Frankenstein Architecture

After connecting these insights, I asked: *What if we could build this capability through scaffolding?*

Multimodal models started as stitched-together systems—text models connected to image models connected to tool-calling modules. Now they're becoming natively multimodal. But the Frankenstein approach **worked** before native integration existed.

Could we do the same for bidirectional thinking?

### The Architecture Concept

**Two instances of the same model (or complementary models)**:

| Component | Function | Analog |
|-----------|----------|--------|
| **Instance A: Inference Model** | Continuously running in "thinking mode" | Human probabilistic reasoning |
| **Instance B: Output Model** | Generating tokens based on current best path | Human verbalization |
| **Oscillation Layer** | Rapid interruption/revision protocol | Human mid-sentence pivots |

**The process**:
1. Inference Model explores problem space
2. Output Model begins generating tokens (5-10 at a time)
3. Inference Model evaluates emerging output
4. If aligned → Continue  
   If divergent → Send revision signal
5. Output Model backtracks to checkpoint, re-generates
6. Repeat loop until completion or convergence

**Key insight**: This isn't true superposition—it's **rapid oscillation creating the illusion of simultaneity**, like how a CPU time-slices threads to simulate parallelism.

### Why This Might Actually Work

**Precedent exists**:
- **Speculative decoding** already generates multiple tokens, verifies, and backtracks if wrong
- **Beam search** maintains multiple output paths simultaneously
- **Constitutional AI** runs multiple passes (generate → critique → revise)

**The difference**: This architecture enables **real-time revision based on ongoing inference**, not just post-hoc checking.

### The Practical Test (Update: We Built It)

We actually built a prototype of this architecture and tested it on ARC-AGI 2.

**Setup**:
- Inference Model: Gemini 2.0 Flash (monitoring/thinking)
- Generator Model: Gemini 2.0 Flash (output production)
- Oscillation Controller: Chunk-based generation with revision cycles
- Task: ARC-AGI 2 grid transformation (007bbfb7)

**Results**:

| Model | Accuracy |
|-------|----------|
| **Gemini 3 Flash** (native thinking) | **100%** (9/9 rows) |
| **Simulated Superposition Prototype** | **67%** (6/9 rows) |

The baseline won. But we learned something crucial.

### The Scheduled Interruption Problem

Our prototype used **scheduled interruption**—stopping every chunk to evaluate. This is like tapping someone on the shoulder every 30 seconds while they solve a puzzle.

**We disrupted flow state instead of enhancing it.**

The revision mechanism actually *introduced* errors. Rows 1-3 were perfect. Rows 7-9 were perfect. Rows 4-6—generated during revision cycles—were wrong. The thinking model approved a bad correction.

**The fix isn't more thinking. It's smarter triggering.**

Instead of scheduled interruption:
```
Generate chunk → STOP → Evaluate → Generate chunk → STOP → Evaluate...
```

We need **event-driven interruption**:
```
Generate... generate... [ERROR DETECTED] → STOP → Correct → Resume
```

The thinking model should monitor passively and only interrupt when it detects an actual problem—a hallucination, a logical contradiction, a pattern break.

### The IDE Revelation

Here's what we didn't expect to discover: **IDE agents already implement simulated superposition.**

Think about how Windsurf, Cursor, or any agentic coding IDE works:

| Aspect | Our Prototype | IDE Agent |
|--------|---------------|----------|
| Interruption | Scheduled (every chunk) | Event-driven (errors, tool results) |
| Correction trigger | Fixed interval | Actual failure signal |
| Context | Single prompt | Persistent across calls |
| Self-reflection | Forced | Natural (between tool calls) |
| Rollback | None | Can undo, retry, adjust |

An IDE agent solving a coding problem:
1. **Plans** (thinking)
2. **Writes code** (output)
3. **Runs it** (observation)
4. **Sees error** (event trigger)
5. **Reflects** (thinking)
6. **Revises** (output)
7. **Repeats** until success

This is **event-driven oscillation between thinking and output**—exactly what we were trying to build, but emergent from the tool-use architecture rather than forced through scheduled interruption.

**The implication**: Simulated superposition might already exist. Not in model weights, but in **agent scaffolding**. The IDE workflow naturally creates the bidirectional think-speak-think loop we hypothesized.

This raises an interesting question no one seems to have asked: **What if you ran an IDE agent on ARC-AGI?** Not a raw model, not a fine-tuned model—but an agentic system that could write code, test hypotheses, debug, and iterate toward solutions the way humans actually solve these puzzles.

### We Tested It. It Works.

Using Windsurf's agentic capabilities on the same ARC task (007bbfb7):

| Approach | Accuracy | Method |
|----------|----------|--------|
| **IDE Agent (Windsurf)** | **100%** | Code → Test → Verify |
| **Gemini 3 Flash** | **100%** | Native thinking |
| **Simulated Superposition v1** | **67%** | Scheduled interruption |

The IDE agent:
1. Wrote Python code to analyze training examples
2. Discovered the transformation rule programmatically
3. Verified the rule on all 5 training examples
4. Applied it to the test input
5. Got 100% correct

**This is exactly what we theorized**—event-driven oscillation between thinking (analysis) and output (code), triggered by natural task structure rather than forced scheduling.

The IDE workflow naturally implements simulated superposition. It just does it through tool use rather than model architecture.

---

## The SCMS Connection

When I built the SCMS (Sparse Contextual Memory Scaffolding) framework for Mneme, I didn't realize I was building an unhobbling architecture.

**SCMS has three memory tiers**:

| Layer | Function | HRM Analog |
|-------|----------|------------|
| **Persona memories** | Always retrieved, unconditionally—first, with guaranteed context | H-module (slow, guiding) |
| **Task memories** | Retrieved based on relevance | L-module (fast, executing) |
| **L2 documentation** | Injected when linked L1 memories are retrieved | Hidden state space |

The persona layer is the AI's hypnagogia. It's always present, shaping how all other memories are interpreted, without competing for relevance on a per-query basis.

Reading the HRM paper and Aschenbrenner's work, I realized: **SCMS is scaffolded unhobbling.**

A necessary caveat: SCMS is scaffolding, not native architecture. Unlike HRM's true hidden layers (which exist in model weights and never tokenize), everything in SCMS must be injected into context. But the functional principle is the same: **preserve hidden guidance space that shapes behavior without appearing in output**.

---

## The Broader Pattern

There's a pattern emerging across multiple domains:

**Einstein's rock** → Controlled access to hypnagogic states  
**HRM's dual layers** → Hidden reasoning + visible execution  
**Aschenbrenner's unhobbling** → Remove constraints on existing capabilities  
**SCMS persona layer** → Unconditional framing that shapes retrieval  
**Simulated superposition** → Oscillating between thinking and speaking

The common thread: **Not everything should collapse into tokens immediately.**

Some of the most important cognition—human and artificial—happens in spaces that can't be directly observed or verbalized. The next breakthrough might not come from bigger models or more data, but from **architectures that preserve liminal thinking space**.

---

## What This Means for Memory Systems

If Aschenbrenner is right that unhobbling drives most AI progress, then memory systems like SCMS are a form of architectural unhobbling:

**Traditional RAG**: Retrieve → Generate  
**SCMS**: Unconditional framing (persona) + Conditional retrieval (task) + Linked documentation (L2)

The difference is **when** and **how** information enters context:
- Persona: Always, unconditionally (shapes everything)
- Task: Based on relevance (changes per query)
- L2: Through relationships, not direct search (hidden influence)

This creates a tiered collapse:
1. Persona stabilizes the probability space
2. Task memories narrow it further
3. L2 documentation provides hidden constraints
4. Output collapses to final tokens

**Delaying collapse matters.**

---

## The Humble Caveat

I'm drawing connections between quantum mechanics, neuroscience, AI architecture, and memory systems. That's a lot of disciplinary boundaries to cross, and I'm not an expert in any of them individually.

What I'm offering isn't a theory—it's a **resonance**. A pattern that keeps appearing across domains.

But the evidence is mounting:
- ✅ Poetic's ARC-AGI 2 results are real
- ✅ Aschenbrenner's unhobbling thesis is validated
- ✅ HRM's hidden layer architecture outperforms standard models
- ✅ SCMS shows measurable improvements in AI memory retention

Something is going on here. And it points toward a future where **thinking space is preserved, not collapsed.**

---

## The Next Breakthrough

If I had to make a prediction:

The next major leap in AI won't come from GPT-6 or more parameters. It will come from **architectures that maintain bidirectional access between hidden reasoning and visible output**.

This might look like:
- Models with persistent internal states that don't reset between tokens
- Memory systems where some context influences behavior without being surfaced
- Retrieval architectures that delay commitment to final selections
- Dual-model systems that oscillate between thinking and speaking

We're already seeing hints:
- HRM's dual-module architecture
- Anthropic's extended thinking in Claude
- Poetic's meta-system approach
- SCMS's unconditional persona layer
- **IDE agents achieving 100% on tasks where scheduled oscillation got 67%**

The era of "everything is tokens" might be ending.  
The era of **hidden, liminal, ineffable computation** might be beginning.

### A Taxonomy of Superposition

After building and testing, here's how I now think about the landscape:

```
Native Thinking (CoT)        = Single-pass deep reasoning
Scheduled Oscillation        = Our prototype (disrupts flow)
Event-Driven Oscillation     = IDE agents (emergent superposition)
True Superposition           = Both simultaneously in weights (doesn't exist yet)
```

**IDE agents might be the closest existing approximation to the theoretical architecture we hypothesized.** They achieve bidirectional think-speak-think loops not through forced interruption, but through natural task structure and feedback signals.

The next step isn't building more sophisticated scheduled interruption. It's understanding what makes IDE-style event-driven oscillation work and whether that can be simplified into a chatbot-style architecture without the full IDE tooling.

---

## Where This Goes From Here

This exploration confirmed something important: **the theoretical framework is sound**. The convergence between Aschenbrenner's unhobbling thesis, the HRM paper's dual-layer architecture, and the superposition problem I identified independently isn't coincidental—it's pointing toward a real architectural frontier.

What we demonstrated:

- **Scheduled interruption disrupts flow state** — forcing evaluation at fixed intervals introduces errors rather than catching them
- **Event-driven oscillation works** — IDE agents naturally implement the bidirectional think-speak pattern through tool use
- **The gap between scaffolding and native architecture matters** — simulating superposition through API orchestration has fundamental latency and coherence limitations that native implementations wouldn't face

The full validation of this architecture—building a system that achieves true event-driven oscillation at the model level rather than the scaffolding level—requires resources beyond what a solo researcher can deploy. This is infrastructure-level work: custom training runs, novel attention mechanisms, potentially new hardware considerations.

**But that's the point.** The unhobbling thesis predicts that the biggest gains come from removing constraints, not adding parameters. If this architectural direction is correct, whoever builds it first gains a significant capability advantage.

I've planted a flag. The theoretical groundwork is laid. The experimental infrastructure exists. What happens next depends on who picks it up.

Sometimes the most valuable contribution isn't finishing the race—it's identifying which direction to run.

Einstein knew. He just didn't have the math to prove it.

Now we're getting closer.

---

## Resources

- [Leopold Aschenbrenner - Situational Awareness (June 2024)](https://situational-awareness.ai/)
- [HRM Paper - Hierarchical Reasoning Model](https://arxiv.org/abs/2508.xxxxx)
- [Einstein's Rock and the Hidden Layer of Thought](https://mneme.ai/blog/einsteins-rock) (December 2025)
- [Mneme AI](https://mneme.ai) - Continual memory architecture
- [SCMS Starter Kit](https://github.com/matthewwalk/scms-starter-kit) - Open source framework

---

*Matthew "Manny" Walker is the creator of SCMS (Sparse Contextual Memory Scaffolding) and founder of Mneme. He independently discovered the superposition problem while building AI memory systems and is currently laughing at the cosmic irony of being theoretically correct at the exact moment he has to pivot to tax software. Find him on X [@getmneme](https://x.com/getmneme).*

**Back to all posts**
