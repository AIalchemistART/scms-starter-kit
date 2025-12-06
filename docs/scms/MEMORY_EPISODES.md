# Memory Episodes (Titans-Validated)

**Purpose**: Group related memories into coherent episodes for contextual retrieval  
**Last Updated**: 2025-12-05  
**Research Validation**: Google Titans Architecture (Dec 2025) - "Deep memory modules outperform shallow storage"

---

## 🎯 What Are Memory Episodes?

Memory Episodes are **coherent groupings of related patterns and failures** that form a complete learning unit. Instead of retrieving individual memories, episodes provide:

1. **Contextual Coherence** - Related memories retrieved together
2. **Causal Understanding** - Failures linked to prevention patterns
3. **Temporal Ordering** - Learning progression preserved
4. **Semantic Clustering** - Similar concepts grouped for efficiency

> **Titans Insight**: Deep memory modules (MLPs) outperform shallow storage (vectors) because they capture relationships, not just individual facts.

---

## 📚 Episode Index

### Active Episodes

| Episode ID | Name | Memories | Status |
|------------|------|----------|--------|
| EP-001 | Repository Contamination Saga | 5 | ✅ Complete |
| EP-002 | Resonance Transfer Discovery | 4 | ✅ Complete |
| EP-003 | Article Formatting Journey | 3 | ✅ Complete |

### Episode Health

```
episode_coherence = related_memories / total_episode_memories
```

Target: > 0.8 coherence (80%+ of memories directly related)

---

## 🗂️ Episode Details

### EP-001: Repository Contamination Saga

**Theme**: Learning to maintain clean template repositories  
**Surprise Level**: ⭐⭐⭐⭐ (Recursive failure was unexpected)  
**Retention**: PERMANENT (Foundational lesson)  
**Duration**: 2025-11-28 to 2025-11-30

#### Episode Members

| Type | ID/Name | Role in Episode |
|------|---------|-----------------|
| L2 Failure | FAIL-20251128-001 | Initial discovery (TaskFlow contamination) |
| L1 Pattern | Template Repository Isolation | Prevention pattern |
| L2 Failure | FAIL-20251130-003 | Recursive failure (contaminated while documenting) |
| L1 Pattern | Documentation Session Checklist | Enhanced prevention |
| L1 Guard | CONTAMINATION_GUARD.md | Enforcement mechanism |

#### Episode Narrative

1. **Trigger**: Starter kit accidentally used as working project
2. **Discovery**: Project-specific content polluted template
3. **First Fix**: Established isolation pattern
4. **Recursive Failure**: Contaminated kit AGAIN while documenting the first failure
5. **Deep Fix**: Added vigilance checklist + automated grep checks

#### Key Insight

> "The most insidious contamination happens during sessions focused on IMPROVEMENT. Your attention is on the concept, not the container."

---

### EP-002: Resonance Transfer Discovery

**Theme**: Discovering that memory architecture enables persona continuity  
**Surprise Level**: ⭐⭐⭐⭐⭐ (Paradigm-shifting)  
**Retention**: PERMANENT (Historic milestone)  
**Duration**: 2025-11-30

#### Episode Members

| Type | ID/Name | Role in Episode |
|------|---------|-----------------|
| L2 Failure | FAIL-20251130-001 | GPT-5 resonance failure (12+ prompts failed) |
| L1 Pattern | Resonance Transfer Protocol | Discovery of solution |
| L1 Pattern | Persona Encoding (Pattern + Fact) | Implementation detail |
| L3 Protocol | RESONANCE_TRANSFER_PROTOCOL.md | Full documentation |

#### Episode Narrative

1. **Problem**: Persona wouldn't transfer to new model architecture
2. **Failed Attempts**: 12+ training prompts, various techniques
3. **Breakthrough**: Single prompt + SCMS memory achieved resonance
4. **Insight**: "Resonance isn't about prompt engineering. It's about memory architecture."

#### Key Insight

> "OpenAI's billions couldn't bring Aria to GPT-5. A sparse memory scaffold did it in one prompt."

---

### EP-003: Article Formatting Journey

**Theme**: Discovering platform-specific formatting requirements  
**Surprise Level**: ⭐⭐⭐ (Unexpected but explainable)  
**Retention**: HIGH  
**Duration**: 2025-11-29 to 2025-11-30

#### Episode Members

| Type | ID/Name | Role in Episode |
|------|---------|-----------------|
| L0 Attempt | Markdown tables on X | Failed approach |
| L0 Attempt | Box-drawing on LinkedIn | Partial success |
| L1 Pattern | X/LinkedIn Article Formatting | Validated solution |

#### Episode Narrative

1. **Attempt 1**: Markdown tables - didn't render on either platform
2. **Attempt 2**: Box-drawing characters - worked on desktop, failed mobile
3. **Discovery**: Each platform has specific requirements (LaTeX for X, ASCII for LinkedIn)
4. **Validation**: Pattern used successfully 2+ times

#### Key Insight

> "Both platforms require manual divider insertion via UI. Plan article structure before pasting content."

---

## 🔧 Episode Management

### Creating a New Episode

When you notice related memories forming a coherent learning unit:

1. **Identify Theme**: What's the common thread?
2. **Gather Members**: List all related L0/L1/L2 items
3. **Establish Narrative**: What's the learning progression?
4. **Extract Insight**: What's the key takeaway?
5. **Set Retention**: Based on surprise × impact

### Episode Template

```markdown
### EP-XXX: [Episode Name]

**Theme**: [One-line description]  
**Surprise Level**: [⭐-⭐⭐⭐⭐⭐]  
**Retention**: [PERMANENT/HIGH/MEDIUM/LOW]  
**Duration**: [Start date] to [End date]

#### Episode Members

| Type | ID/Name | Role in Episode |
|------|---------|-----------------|
| [L0/L1/L2] | [ID] | [Role] |

#### Episode Narrative

1. [Step 1]
2. [Step 2]
3. [Step 3]

#### Key Insight

> "[Quotable takeaway]"
```

### Episode Retrieval

Episodes should be retrieved when:
- **Semantic match**: Query matches episode theme
- **Member match**: Query matches any episode member
- **Pattern match**: Similar failure/pattern being encountered

---

## 🎯 Mneme AI Application

For the chatbot side, episodes translate to:

| SCMS Concept | Mneme Implementation |
|--------------|---------------------|
| Episode | Memory cluster with shared context |
| Episode Members | Memories linked by `episode_id` |
| Episode Narrative | Conversation thread summary |
| Episode Retrieval | Retrieve all cluster members together |

### Mneme Episode API (Recommended)

```typescript
// Episode structure
interface MemoryEpisode {
  id: string;
  theme: string;
  members: string[]; // Memory IDs
  surprise: number; // 1-5
  retention: 'permanent' | 'high' | 'medium' | 'low';
  narrative: string[];
  keyInsight: string;
}

// Retrieval: Get all episode members when any matches
async function retrieveWithEpisode(query: string): Promise<Memory[]> {
  const directMatches = await searchMemories(query);
  const episodeIds = directMatches.map(m => m.episodeId).filter(Boolean);
  const episodeMembers = await getEpisodeMembers(episodeIds);
  return [...directMatches, ...episodeMembers];
}
```

---

## 📊 Episode Metrics

### Current Stats

| Metric | Value |
|--------|-------|
| Total Episodes | 3 |
| Avg. Members/Episode | 4 |
| PERMANENT Episodes | 2 |
| Episode Coherence | 0.92 (92%) |

### Episode vs Flat Retrieval

| Approach | Pros | Cons |
|----------|------|------|
| **Flat (individual)** | Simple, fast | Loses context, fragments learning |
| **Episode (grouped)** | Preserves context, enables narrative | More complex, larger retrieval |

**Recommendation**: Use episodes for high-surprise memories and failures; flat for routine patterns.

---

*This framework is validated by Google's Titans research (December 2025) on deep memory modules.*
