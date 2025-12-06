# Mneme AI Integration Guide: Titans/MIRAS Features

**Purpose**: Map SCMS Titans/MIRAS enhancements to Mneme chatbot implementation  
**Last Updated**: 2025-12-05  
**For**: Nimi Agent / Mneme Development Team

---

## 🎯 Overview

This guide maps the SCMS framework enhancements (validated by Google Titans/MIRAS research) to concrete implementation recommendations for the Mneme AI chatbot.

| SCMS Concept | Mneme Implementation | Priority |
|--------------|---------------------|----------|
| Surprise Metric | Memory extraction confidence | HIGH |
| Confidence Indicators | User validation status | HIGH |
| Retention Gates | Memory lifecycle management | MEDIUM |
| Memory Episodes | Conversation thread clustering | MEDIUM |
| Decay Modes | Archive vs active memory | LOW |

---

## 1. Surprise Metric → Memory Extraction Confidence

### SCMS Concept
High-surprise information (unexpected, novel) deserves stronger retention than routine data.

### Mneme Implementation

#### A. Extraction Confidence Score

When extracting memories from conversations, assign a confidence score:

```typescript
interface ExtractedMemory {
  content: string;
  type: 'preference' | 'fact' | 'pattern' | 'correction';
  
  // NEW: Titans-validated fields
  extractionConfidence: number; // 0.0 - 1.0
  surpriseScore: number; // 1-5 (like SCMS ⭐ rating)
  retentionPriority: 'permanent' | 'high' | 'medium' | 'low';
}

function calculateSurprise(memory: ExtractedMemory, existingMemories: Memory[]): number {
  // Surprise = how different is this from existing knowledge?
  const semanticNovelty = calculateSemanticDistance(memory, existingMemories);
  const typeRarity = getTypeFrequency(memory.type, existingMemories);
  const contextUnexpectedness = wasThisExpected(memory, conversationContext);
  
  // Weighted combination
  return (semanticNovelty * 0.5) + (typeRarity * 0.3) + (contextUnexpectedness * 0.2);
}
```

#### B. Display in UI

Show surprise indicator in memory cards:

```tsx
// Memory card component
<MemoryCard>
  <SurpriseIndicator level={memory.surpriseScore} />
  {/* ⭐ = routine, ⭐⭐⭐⭐⭐ = novel insight */}
</MemoryCard>
```

#### C. Retrieval Boost

High-surprise memories get retrieval priority:

```typescript
function calculateRelevanceScore(memory: Memory, query: string): number {
  const baseScore = semanticSimilarity(memory.content, query);
  const surpriseBoost = 1.0 + (memory.surpriseScore * 0.1); // 1.0 - 1.5 range
  
  return baseScore * surpriseBoost;
}
```

---

## 2. Confidence Indicators → User Validation Status

### SCMS Concept
Confidence = validation strength. How certain are we this memory is correct?

### Mneme Implementation

#### A. Three-Tier Confidence System

```typescript
type ConfidenceLevel = 'high' | 'medium' | 'low';

interface Memory {
  // Existing fields...
  
  // NEW: Confidence tracking
  confidence: ConfidenceLevel;
  validationCount: number;
  lastValidated: Date | null;
  validationSource: 'user' | 'system' | 'inferred';
}

function determineConfidence(memory: Memory): ConfidenceLevel {
  if (memory.validationSource === 'user' && memory.validationCount >= 2) {
    return 'high'; // 🟢 User explicitly validated 2+ times
  }
  if (memory.validationCount >= 1 || memory.retrievalCount >= 3) {
    return 'medium'; // 🟡 Some validation signal
  }
  return 'low'; // 🔴 Unvalidated, may be incorrect
}
```

#### B. UI Indicators

```tsx
// Confidence badge component
const ConfidenceBadge = ({ level }: { level: ConfidenceLevel }) => {
  const colors = {
    high: 'bg-green-500',    // 🟢
    medium: 'bg-yellow-500', // 🟡
    low: 'bg-red-500'        // 🔴
  };
  
  return (
    <span className={`${colors[level]} rounded-full px-2 py-1`}>
      {level.toUpperCase()}
    </span>
  );
};
```

#### C. Promotion Rules

Only promote high-confidence memories to "permanent" status:

```typescript
function shouldPromote(memory: Memory): boolean {
  return (
    memory.confidence === 'high' &&
    memory.validationCount >= 2 &&
    !memory.hasRecentFailure
  );
}
```

---

## 3. Retention Gates → Memory Lifecycle Management

### SCMS Concept
Controlled forgetting prevents memory overflow and maintains system health.

### Mneme Implementation

#### A. Decay Calculation

```typescript
interface RetentionConfig {
  baseValue: number;        // 1.0 for unvalidated, 2.0 for validated
  surpriseFactor: number;   // 1.0 - 3.0 based on surprise score
  confidenceWeight: number; // 0.5 (low) - 1.5 (high)
  decayRate: number;        // 0.90 - 1.0 (1.0 = no decay)
}

function calculateRetentionScore(memory: Memory, config: RetentionConfig): number {
  const daysSinceUse = getDaysSince(memory.lastRetrieved);
  const recencyFactor = Math.pow(config.decayRate, daysSinceUse);
  
  return config.baseValue * config.surpriseFactor * config.confidenceWeight * recencyFactor;
}

// Decay thresholds
const DECAY_THRESHOLD = 1.0;  // Below this = candidate for archival
const ARCHIVE_THRESHOLD = 0.3; // Below this = auto-archive

function processMemoryDecay(memories: Memory[]): void {
  for (const memory of memories) {
    const score = calculateRetentionScore(memory, getConfig(memory));
    
    if (score < ARCHIVE_THRESHOLD) {
      archiveMemory(memory);
    } else if (score < DECAY_THRESHOLD) {
      flagForReview(memory);
    }
  }
}
```

#### B. Decay Override Rules

```typescript
function shouldNeverDecay(memory: Memory): boolean {
  return (
    memory.type === 'core_identity' ||           // User identity
    memory.type === 'critical_preference' ||     // Important preferences
    memory.surpriseScore === 5 ||                // Paradigm-shifting
    memory.validationSource === 'user' && memory.markedPermanent
  );
}
```

#### C. UI: Decay Indicators

Show memory "health" to users:

```tsx
<MemoryCard>
  <RetentionIndicator score={memory.retentionScore} />
  {/* Fading opacity or color as score decreases */}
  
  {memory.retentionScore < DECAY_THRESHOLD && (
    <FadingWarning>
      This memory is fading. Validate to strengthen retention.
    </FadingWarning>
  )}
</MemoryCard>
```

---

## 4. Memory Episodes → Conversation Thread Clustering

### SCMS Concept
Related memories should be grouped into coherent episodes for contextual retrieval.

### Mneme Implementation

#### A. Episode Data Structure

```typescript
interface MemoryEpisode {
  id: string;
  theme: string;
  members: string[]; // Memory IDs
  conversationId: string; // Source conversation
  
  // Metadata
  surpriseLevel: number; // Average of members
  retention: 'permanent' | 'high' | 'medium' | 'low';
  createdAt: Date;
  narrative: string; // AI-generated summary
}

// Auto-create episodes from conversations
async function createEpisodeFromConversation(
  conversationId: string,
  extractedMemories: Memory[]
): Promise<MemoryEpisode> {
  const theme = await generateTheme(extractedMemories);
  const narrative = await generateNarrative(extractedMemories);
  
  return {
    id: generateEpisodeId(),
    theme,
    members: extractedMemories.map(m => m.id),
    conversationId,
    surpriseLevel: average(extractedMemories.map(m => m.surpriseScore)),
    retention: determineEpisodeRetention(extractedMemories),
    createdAt: new Date(),
    narrative
  };
}
```

#### B. Episode-Aware Retrieval

When a query matches any episode member, retrieve the full episode:

```typescript
async function retrieveWithEpisodes(query: string): Promise<Memory[]> {
  // Step 1: Direct semantic search
  const directMatches = await semanticSearch(query);
  
  // Step 2: Find episodes containing matched memories
  const episodeIds = new Set<string>();
  for (const memory of directMatches) {
    if (memory.episodeId) {
      episodeIds.add(memory.episodeId);
    }
  }
  
  // Step 3: Retrieve all episode members
  const episodeMembers: Memory[] = [];
  for (const episodeId of episodeIds) {
    const episode = await getEpisode(episodeId);
    const members = await getMemoriesByIds(episode.members);
    episodeMembers.push(...members);
  }
  
  // Step 4: Deduplicate and return
  return deduplicateMemories([...directMatches, ...episodeMembers]);
}
```

#### C. UI: Episode View

```tsx
<EpisodeCard episode={episode}>
  <EpisodeHeader>
    <h3>{episode.theme}</h3>
    <SurpriseIndicator level={episode.surpriseLevel} />
  </EpisodeHeader>
  
  <EpisodeNarrative>{episode.narrative}</EpisodeNarrative>
  
  <EpisodeMembers>
    {episode.members.map(memberId => (
      <CompactMemoryCard key={memberId} memoryId={memberId} />
    ))}
  </EpisodeMembers>
</EpisodeCard>
```

---

## 5. API Recommendations

### New Endpoints

```typescript
// GET /api/memories/:id/retention
// Returns retention score and decay status
interface RetentionStatus {
  score: number;
  threshold: number;
  status: 'active' | 'fading' | 'archived';
  daysUntilDecay: number | null;
}

// POST /api/memories/:id/validate
// User validates a memory, boosting confidence
interface ValidationRequest {
  isCorrect: boolean;
  correction?: string; // If isCorrect = false
}

// GET /api/episodes
// List all memory episodes
interface EpisodeListResponse {
  episodes: MemoryEpisode[];
  totalCount: number;
}

// GET /api/episodes/:id/members
// Get all memories in an episode
interface EpisodeMembersResponse {
  episode: MemoryEpisode;
  members: Memory[];
}
```

### New Memory Fields

```typescript
// Add to existing Memory interface
interface Memory {
  // Existing fields...
  
  // Titans/MIRAS additions
  surpriseScore: number;        // 1-5
  confidence: ConfidenceLevel;  // 'high' | 'medium' | 'low'
  retentionScore: number;       // Calculated, 0.0 - 10.0+
  decayMode: DecayMode;         // 'permanent' | 'slow' | 'standard' | 'fast'
  episodeId: string | null;     // Link to episode
  validationCount: number;      // How many times validated
  lastValidated: Date | null;   // When last validated
}
```

---

## 6. Implementation Priority

### Phase 1 (HIGH Priority) - Week 1-2
1. **Surprise Score** - Add to memory extraction
2. **Confidence Indicators** - Add to memory display
3. **Validation Endpoint** - Let users validate memories

### Phase 2 (MEDIUM Priority) - Week 3-4
4. **Retention Calculation** - Add decay logic
5. **Decay UI** - Show fading memories
6. **Episode Creation** - Auto-group conversation memories

### Phase 3 (LOW Priority) - Week 5+
7. **Episode Retrieval** - Context-aware memory fetching
8. **Episode UI** - Display grouped memories
9. **Decay Automation** - Auto-archive faded memories

---

## 7. Competitive Differentiation

These features directly address the **architectural deficiency** that Google MIRAS identifies in flat vector databases:

| Competitor | Has Forgetting? | Has Confidence? | Has Episodes? |
|------------|-----------------|-----------------|---------------|
| Mem0 | ❌ No | ❌ No | ❌ No |
| OpenMemory | ❌ No | ❌ No | ❌ No |
| **Mneme** | ✅ Yes | ✅ Yes | ✅ Yes |

**Marketing Message**: 
> "Unlike flat vector databases that save everything forever, Mneme implements Google-validated memory architecture with intelligent forgetting, confidence tracking, and episodic grouping."

---

*This integration guide is based on SCMS 2.0 enhancements validated by Google Titans and MIRAS research (December 2025).*
