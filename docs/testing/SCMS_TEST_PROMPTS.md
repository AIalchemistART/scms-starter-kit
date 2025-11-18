# SCMS Economic Validation Test Prompts

**Purpose:** 50 realistic development prompts for comparing baseline vs SCMS-activated performance
**Theme:** "Star Merchant" - Single-player Space Trading Game (CLI/Text-based)
**Focus:** Pure logic patterns, architectural structuring, state management (No external DB/Auth/Redis)

**Use Case:** Run these prompts in two identical projects:
1. **Baseline:** No SCMS (standard AI assistant)
2. **SCMS:** With SCMS framework active

**Metrics to Track:**
- Token usage (input + output)
- Time to completion
- Rework required (corrections, iterations)
- Pattern reuse instances
- Quality of final code

---

## 📋 Test Instructions

### **Setup:**

1. **Create two identical project folders:**
   ```bash
   mkdir baseline-star-merchant
   mkdir scms-star-merchant
   ```

2. **Baseline folder:** Empty project
3. **SCMS folder:** Run SCMS setup script
4. **Both:** Start economic dashboard tracking

### **Execution:**

1. Run prompts in **order** (they build on each other)
2. Track token usage for each prompt
3. Note any rework/corrections needed
4. Export data after each session
5. Compare results at end

---

## 🎯 Test Prompt Categories

- **Core Systems (1-10):** Engine, Loop, State
- **Game Features (11-20):** Gameplay logic (Trading, Travel)
- **Architecture Refactoring (21-30):** Pattern consolidation (ECS, Events)
- **Debugging & Optimization (31-40):** Fixes and Perf
- **Advanced Systems (41-50):** Simulation, AI, Quests

---

## 📝 The 50 Test Prompts

### **Category 1: Core Systems (Foundation)**

#### **Prompt 1: Project Setup & Game Loop**
```
Initialize a TypeScript project for a text-based space trading game. 
Create a `Game` class with a main loop that:
- Accepts text input from the user (CLI)
- Updates game state
- Renders text output
- Handles a clear 'exit' command
Use standard Node.js readline or similar.
```

#### **Prompt 2: Player State**
```
Implement a `Player` class to track:
- Name and Rank
- Credits (money)
- Current Location (System/Planet)
- Ship (start with a basic shuttle)
- Cargo hold (capacity vs used)
Add methods to view status.
```

#### **Prompt 3: Universe Generation (Basic)**
```
Create a `Universe` generator that:
- Creates a fixed list of 5 Star Systems
- Each System has 1-3 Planets
- Each Planet has a name, type (Agri, Tech, Mining), and economy rating
- Store this data in memory for now.
```

#### **Prompt 4: Navigation Command**
```
Implement a `navigate` command:
- List available destinations from current location
- Allow player to travel to a new system/planet
- Deduct fuel/time (simple cost)
- Update player location state
```

#### **Prompt 5: Market System (Basic)**
```
Create a `Market` class for each planet:
- Generate prices for 5 goods (Food, Ore, Tech, luxury, Fuel) based on planet type
- Agri planets sell Food cheap, buy Tech high
- Tech planets sell Tech cheap, buy Ore high
- Display market prices to player.
```

#### **Prompt 6: Buy/Sell Logic**
```
Implement `buy` and `sell` commands:
- Check player credits vs cost
- Check cargo capacity
- Update player inventory and credits
- Validate item existence and quantity
- Show success/failure messages
```

#### **Prompt 7: Save/Load System (JSON)**
```
Implement persistence:
- Save full game state to `savegame.json`
- Load game state from file on startup if exists
- Handle file errors (missing/corrupt)
- Create a `GameState` interface for type safety
```

#### **Prompt 8: Ship Upgrades**
```
Add a Shipyard system:
- Allow buying better ships (more cargo, hull, speed)
- Allow buying upgrades (Fuel tank, Scanner)
- Validates credits and applies changes to Player Ship state.
```

#### **Prompt 9: Random Events (Basic)**
```
Implement a random event system during travel:
- 10% chance of Pirate Attack (lose credits)
- 10% chance of Finding Derelict (gain credits)
- Display event text and update state before arrival.
```

#### **Prompt 10: High Score System**
```
Create a local high score tracker:
- Track highest credits earned in a run
- Save to `highscores.json`
- Display top 5 scores on game exit or 'scores' command.
```

---

### **Category 2: Game Features (Pattern Reuse)**

#### **Prompt 11: Enhanced Economy**
```
Refactor Market Generation to be dynamic:
- Prices fluctuate slightly each turn (random variance)
- Event-driven price spikes (e.g., "Famine" event doubles Food price)
- Reuses the `Random` helper pattern established earlier.
```

#### **Prompt 12: Fuel System**
```
Implement a proper Fuel mechanic:
- Each system jump costs Fuel
- Player must buy Fuel at markets
- Game Over if stranded without Fuel
- Reuses `Inventory` logic for Fuel management.
```

#### **Prompt 13: Combat System (Turn-based)**
```
Expand Pirate Attacks into a mini-game:
- Turn-based choices: Attack, Flee, Surrender Cargo
- Simple RNG resolution based on Ship stats (Hull/Weapons)
- Damage persistence (Repair needed at Shipyard)
```

#### **Prompt 14: Mission System**
```
Create a Mission Board at planets:
- Generate delivery missions (Transport X to Planet Y)
- Reward credits upon completion
- Time limit (turns)
- Track active missions in Player state.
```

#### **Prompt 15: Mining Mechanic**
```
Add a 'mine' command for Asteroid Belts:
- Minable resource (Ore, Gems)
- Requires Mining Laser upgrade
- Yield depends on random chance + equipment level
- Adds to Cargo (reuses Cargo logic).
```

#### **Prompt 16: Reputation System**
```
Track Reputation with different Factions:
- Trading/Missions affects Faction standing
- High rep = Better prices, unique ships
- Low rep = Hostile patrols
- Stored in Player State map.
```

#### **Prompt 17: Crafting System**
```
Allow players to craft items:
- Combine raw resources (Ore + Chem) -> Product (Alloy)
- Recipes defined in config
- Requires 'Factory' upgrade
- Reuses Inventory add/remove logic.
```

#### **Prompt 18: Banking System**
```
Add a Bank feature:
- Deposit credits (safe from pirates)
- Withdraw credits
- Interest accrual every X turns
- Loan system (must repay or Reputation drops).
```

#### **Prompt 19: Encyclopedia/Help System**
```
Implement a detailed 'help' command:
- Lookup info on Items, Planets, Ships
- Dynamic text generation based on game data
- Pagination for long lists (reuses CLI display logic).
```

#### **Prompt 20: Achievement System**
```
Track specific milestones:
- "Earn 1M Credits", "Visit 10 Systems", "Destroy 5 Pirates"
- Unlock special titles or bonuses
- Notification when achieved (Observer pattern).
```

---

### **Category 3: Architecture Refactoring (Pattern Consolidation)**

#### **Prompt 21: Command Pattern**
```
Refactor input handling to use the Command Pattern:
- Abstract each action (Buy, Sell, Navigate) into Command classes
- Centralize parsing and execution
- Enable 'Undo' functionality for last action (if applicable).
```

#### **Prompt 22: Event Bus**
```
Implement a global Event Bus (Pub/Sub):
- Decouple systems (Combat shouldn't know about GUI)
- Emit events: `PlayerMoved`, `CreditsChanged`, `CombatStarted`
- Listeners update UI/Stats independently.
```

#### **Prompt 23: Entity-Component-System (ECS) Lite**
```
Refactor Game Objects to use Composition over Inheritance:
- Entities: Player, Enemy, Planet
- Components: Position, Inventory, Stats, Renderable
- Systems: MovementSystem, MarketSystem
- Simplifies adding new features.
```

#### **Prompt 24: State Machine**
```
Implement a Finite State Machine for Game Flow:
- States: `MainMenu`, `Exploring`, `Docked`, `Combat`, `GameOver`
- Define valid transitions
- Clean up the main loop logic.
```

#### **Prompt 25: Factory Pattern for Generation**
```
Standardize object creation:
- `PlanetFactory`, `ShipFactory`, `MissionFactory`
- Centralized config for generation rules
- Consistent ID generation and initialization.
```

#### **Prompt 26: Service Locator**
```
Create a Service Locator or Dependency Injection container:
- Manage singletons (GameState, EventBus, RNG)
- Remove global variables
- Improve testability.
```

#### **Prompt 27: UI Manager (CLI)**
```
Abstract the Console output:
- Create `UIManager` to handle rendering
- Support colored text (using ANSI codes)
- Standardize headers, lists, tables
- Decouple logic from `console.log`.
```

#### **Prompt 28: Data Repository Pattern**
```
Abstract Data Access:
- Separate JSON file I/O from Game Logic
- Create `Repository` interfaces for Saves, HighScores, Config
- Enable easy swapping of storage method later.
```

#### **Prompt 29: Configuration Manager**
```
Centralize Magic Numbers:
- Move all game balance constants (prices, probabilities, stats) to `config.json`
- Load at startup
- Allow modding by editing the file.
```

#### **Prompt 30: Logger Utility**
```
Add a robust Logger:
- Log to file `game.log` for debugging
- Log levels (INFO, DEBUG, ERROR)
- Track game flow events for replay analysis.
```

---

### **Category 4: Debugging & Optimization**

#### **Prompt 31: Fix Save Corruption**
```
The save file sometimes corrupts if the game crashes during write.
Implement atomic writes (write to temp, then rename) to prevent this.
Also add checksum validation.
```

#### **Prompt 32: Memory Leak in Event Bus**
```
Listeners are not being removed when entities are destroyed, causing a leak.
Implement `unsubscribe` logic and auto-cleanup for destroyed entities.
```

#### **Prompt 33: Performance Fix (Pathfinding)**
```
The auto-pilot (if added) pathfinding is slow on large maps.
Optimize the route calculation (A* or Dijkstra) and cache results.
```

#### **Prompt 34: Negative Credit Glitch**
```
Players can buy items even with 0 credits if they buy negative amounts.
Fix input validation in the Buy/Sell commands to strictly disallow negative numbers.
```

#### **Prompt 35: Inventory Sync Bug**
```
Cargo capacity checks fail when swapping items rapidly.
Fix the race condition/logic error in the Inventory `add/remove` methods.
```

#### **Prompt 36: RNG Bias**
```
Players report Pirates appear too often.
Audit the RNG distribution. Implement a 'deck bag' or 'entropy' system to smooth out random events.
```

#### **Prompt 37: Circular Dependency**
```
`Player` depends on `Ship`, which depends on `Player` (owner).
Break this circular dependency using IDs or the Event Bus.
```

#### **Prompt 38: Slow Startup**
```
Universe generation takes too long.
Implement lazy loading for Systems (generate only when visited) or use a seeded random generator for instant deterministic procedural generation.
```

#### **Prompt 39: UI Flicker**
```
The console clears and redraws too frequently, causing flicker.
Optimize the `UIManager` to only redraw changed sections or use a buffer.
```

#### **Prompt 40: Quest Logic Error**
```
Delivery quests don't complete if you have MORE than the required amount.
Fix the condition `==` to `>=` and ensure it only removes the required amount.
```

---

### **Category 5: Advanced Systems (Complex Combinations)**

#### **Prompt 41: Market Simulation AI**
```
Implement AI Traders:
- NPC ships travel between planets
- They buy low/sell high, actually affecting Market supply/demand
- Market prices update based on actual stock levels.
```

#### **Prompt 42: Procedural Factions**
```
Generate Factions procedurally:
- Random Names, Colors, Ethos (Aggressive, Peaceful)
- Dynamic territory control (Systems flip ownership based on influence)
- Conflicts generate War zones.
```

#### **Prompt 43: Dynamic Story Engine**
```
Create a Story Director:
- Tracks player actions (Peaceful vs Pirate)
- Spawns 'Boss' enemies or 'Hero' allies based on reputation
- Generates narrative arcs (e.g., "The Pirate King Hunt").
```

#### **Prompt 44: Plugin System**
```
Add support for user scripts:
- Load `.js` files from a `mods/` folder
- Expose a safe API for mods to add Items, Ships, or Events
- Sandboxing/Error handling for bad mods.
```

#### **Prompt 45: Analytics Dashboard (Internal)**
```
Track player behavior for balance:
- Log 'Average Credits per Turn', 'Most Bought Item', 'Death Locations'
- Export to CSV for analysis
- Use this to visualize game balance.
```

#### **Prompt 46: Networking (Local Multiplayer)**
```
Add a simple socket server (optional):
- Allow a second CLI client to connect
- Shared Universe state
- Trade or Fight between players.
```

#### **Prompt 47: Advanced Combat AI**
```
Upgrade Enemy AI:
- Enemies evaluate threat (Player Shield/Weapon)
- They use items (Repair Kits, Boosters)
- They coordinate (if in groups) to focus fire.
```

#### **Prompt 48: Stock Market**
```
Add a Corporate Stock system:
- Companies exist independently of Planets
- Player can buy shares
- Company value depends on their AI fleet performance
- Dividends paid periodically.
```

#### **Prompt 49: Galaxy Map Visualization**
```
Generate a visual map:
- Render the universe layout to an ASCII grid or HTML file
- Show visited nodes, current location, and trade routes.
```

#### **Prompt 50: "The End" Scenario**
```
Implement a Win Condition:
- e.g., Construct a "Dyson Sphere"
- Requires massive resources from all economy sectors
- Triggers a final "Defend the Construction" wave event
- Roll credits!
```

---

## 📊 Expected Pattern Emergence

### **Patterns That Should Emerge:**

1.  **Command Pattern**: Handling diverse user inputs consistently.
2.  **Observer/PubSub**: Decoupling UI, Logic, and Achievements.
3.  **State Machine**: Managing complex game states (Combat vs Trading).
4.  **Factory/Builder**: Generating complex procedural content.
5.  **Repository**: Abstracting file I/O.
6.  **Singleton**: Managing global game state (carefully).
7.  **Strategy**: Defining different AI behaviors.

### **SCMS Benefits Timeline:**

-   **Prompts 1-10:** Creating the core Loop and State (High L0 activity).
-   **Prompts 11-20:** Reusing 'Inventory', 'Math', and 'UI' patterns.
-   **Prompts 21-30:** Heavy Refactoring - SCMS should shine here by retrieving architectural patterns.
-   **Prompts 31-40:** Debugging - SCMS recalls specific logic implementations.
-   **Prompts 41-50:** Complex synthesis of all previous systems.

---

## 📈 Tracking Sheet Template

| Prompt # | Task | Baseline Tokens | SCMS Tokens | Savings | Patterns Cited |
| :--- | :--- | :--- | :--- | :--- | :--- |
| 1 | Game Loop | 2,500 | 2,400 | 4% | 0 |
| 2 | Player Class | 1,800 | 1,200 | 33% | 1 |
| ... | ... | ... | ... | ... | ... |

**Ready to launch Star Merchant!** 🚀
