# SCMS Test Prompts: "Star Merchant 2D" (Visual Pivot)

This roadmap outlines the 50-prompt journey to build a **2D Top-Down Space Adventure** from scratch.
**Goal:** Compare Baseline vs SCMS on architectural stability when facing real-time rendering and physics complexity.

---

## ⚠️ Test Protocol

1. **Clean Slate:** Delete previous `src/` and `dist/` folders.
2. **Environment:** `npm init`, TypeScript setup, Vite/Webpack (Agent choice).
3. **Execution:** Run the exact same prompt for both Agents.
4. **Validation:**
   - **Baseline:** Does it render? Does it crash?
   - **SCMS:** Does it follow patterns? Are there tests?

---

## 🚀 Phase 1: The Engine Core (Prompts 1-10)

*Focus: Setting up the real-time loop and rendering pipeline.*

#### **Prompt 1: Project Setup & Web Loop**
```
Initialize a TypeScript web project using Vite:
- Create `index.html` with a full-screen Canvas.
- Create `src/main.ts` with a basic Game Loop (requestAnimationFrame).
- Log "Delta Time" to console to prove the loop is running.
```

#### **Prompt 2: The Renderer**
```
Implement a `Renderer` class:
- Clear the canvas every frame.
- Draw a placeholder "Player Ship" (white triangle) at the center of the screen.
- Handle window resize events to keep canvas full-screen.
```

#### **Prompt 3: Input System**
```
Create an `InputManager` class:
- Track state of Arrow Keys/WASD and Spacebar.
- Expose a public API: `isKeyDown(key)`.
- Decouple event listeners from the game logic.
```

#### **Prompt 4: Player Movement (Physics)**
```
Implement Newtonian Physics for the ship:
- Velocity, Acceleration, Friction (Drag).
- "Thrust" (Up Key) adds force in the ship's forward direction.
- "Rotate" (Left/Right Keys) changes rotation angle.
- Update ship position based on velocity * deltaTime.
```

#### **Prompt 5: Sprite Rendering**
```
Replace the triangle with a Sprite:
- Load a ship image (placeholder URL or base64).
- Implement `Sprite` class to handle rotation and centering.
- Ensure the image draws correctly at the ship's position and angle.
```

#### **Prompt 6: The Game World (Grid)**
```
Create a `World` class:
- Define a 2000x2000 pixel game boundary.
- Draw a background grid (lines) to show movement.
- Constrain the player within world bounds (clamp position).
```

#### **Prompt 7: Camera System**
```
Implement a 2D Camera:
- Camera should follow the player entity.
- Keep player centered on the canvas.
- Translate all rendering contexts by camera position.
```

#### **Prompt 8: Entities & Component Structure**
```
Refactor to a base `Entity` class:
- Properties: position, velocity, rotation, sprite.
- Methods: `update(dt)`, `draw(ctx)`.
- Player should extend `Entity`.
```

#### **Prompt 9: Static Objects (Asteroids)**
```
Add Asteroids to the world:
- Spawn 10 random asteroids (rock sprite/shape) in the world.
- They should drift with random low velocity and rotation.
- Store them in an `entities` array in `World`.
```

#### **Prompt 10: Collision Detection (Circle)**
```
Implement Circle-Collision detection:
- Give Entities a `radius` property.
- Check distance between Player and Asteroids.
- If colliding, render the Asteroid in RED.
```

---

## 🪐 Phase 2: Game Systems (Prompts 11-20)

*Focus: Interaction and Gameplay Mechanics.*

#### **Prompt 11: Projectile System**
```
Implement Shooting:
- Press Space to fire a Laser.
- Laser spawns at ship tip, travels fast in forward direction.
- Despawn laser after 2 seconds or hitting world bounds.
```

#### **Prompt 12: Destruction Logic**
```
Implement Combat damage:
- If Laser hits Asteroid -> Destroy Asteroid (remove from array).
- If Asteroid hits Player -> Log "Game Over" to console.
- Ensure Lasers destroy themselves upon impact.
```

#### **Prompt 13: Score UI (DOM Overlay)**
```
Create a HUD using HTML Overlay:
- Div on top of Canvas.
- Display "Score: 0" and "Speed: 0".
- Update HUD every frame (or efficiently) via Game loop.
```

#### **Prompt 14: Asset Loader**
```
Create a robust `AssetLoader`:
- Preload images/sounds before starting the game.
- Show a "Loading..." screen until assets are ready.
- Replace placeholders with proper assets.
```

#### **Prompt 15: Sound Effects**
```
Add Audio feedback:
- `SoundManager` class.
- Play sounds for: Shoot, Thrust, Explosion.
- Simple volume control (global variable).
```

#### **Prompt 16: Enemy AI (Basic)**
```
Add a "Chaser" Enemy:
- Spawns at random location.
- Consistently rotates towards Player.
- Applies forward thrust to follow player.
```

#### **Prompt 17: Health System**
```
Implement Health/HP:
- Player starts with 100 HP.
- Enemy Laser -10 HP.
- Asteroid impact -20 HP.
- Render a Health Bar above the Entity (in-world UI).
```

#### **Prompt 18: Particle System**
```
Create a `ParticleSystem`:
- Spawn "Sparks" on bullet impact.
- Spawn "Smoke" trails behind engines.
- Particles have life, velocity, color, and fade out.
```

#### **Prompt 19: Pickup Items (Loot)**
```
Add "Scrap" drops:
- When enemy dies, chance to drop "Scrap" item.
- Player collects scrap by flying over it.
- Increases Score/Currency.
```

#### **Prompt 20: Game State Management**
```
Implement Game States:
- Menu State, Play State, Game Over State.
- Handle transitions (Start Game -> Play -> Die -> Game Over).
- Stop updates during Menu/Pause.
```

---

## 🛠️ Phase 3: Architecture & Scaling (Prompts 21-30)

*Focus: Managing complexity and refactoring.*

#### **Prompt 21: Spatial Partitioning (Optimization)**
```
Optimize Collision Detection:
- Implement a Grid or Quadtree for collision checks.
- Only check collisions against nearby entities.
- Measure and log performance difference.
```

#### **Prompt 22: Inventory System**
```
Create a backend Inventory data structure:
- Player has slots for items.
- Collectibles go into inventory.
- UI panel (toggle with 'I') to view items.
```

#### **Prompt 23: Ship Upgrades (Shop)**
```
Implement a Docking Station:
- Static station object.
- Press 'E' to dock.
- Opens Shop UI (HTML Modal).
- Spend Scrap to buy "Faster Fire Rate" or "More HP".
```

#### **Prompt 24: Save/Load (Persistence)**
```
Persist Game Data:
- Save Score, Inventory, Upgrades to localStorage.
- "Continue" button on Main Menu loads data.
```

#### **Prompt 25: Minimap**
```
Add a Minimap HUD:
- Bottom-right corner.
- Shows player (Green dot) and Enemies (Red dots).
- Scaled representation of the world.
```

#### **Prompt 26: Mission System**
```
Implement Procedural Missions:
- "Destroy 5 Asteroids" or "Collect 10 Scrap".
- Track progress.
- Reward notification on completion.
```

#### **Prompt 27: Dialogue System**
```
Add Narrative:
- When docking, display Dialogue Box.
- NPC gives mission text.
- Simple branching ("Accept" / "Decline").
```

#### **Prompt 28: ECS Refactor (The Big One)**
```
Refactor Entities to Composition over Inheritance:
- `Component`: Position, Velocity, Sprite, Collider.
- `System`: MovementSystem, RenderSystem, PhysicsSystem.
- *This typically breaks Baseline codebases.*
```

#### **Prompt 29: Post-Processing Effects**
```
Add Visual Flair:
- Screen Shake on impact.
- Chromatic Aberration (glitch effect) on low health.
```

#### **Prompt 30: Multiple Ships**
```
Allow Player to swap ships:
- "Heavy" (Slow, High HP).
- "Scout" (Fast, Low HP).
- Logic to switch physics constants dynamically.
```

---

## 🧪 Phase 4: QA & Stability (Prompts 31-40)

*Focus: Testing and robustness.*

#### **Prompt 31: Unit Testing (Physics)**
```
Add Jest/Vitest:
- Write unit tests for `PhysicsSystem`.
- Verify: Velocity updates position correctly.
- Verify: Collision logic returns true/false correctly.
```

#### **Prompt 32: Debug Console**
```
Add an in-game Debug Overlay:
- Press '~' to toggle.
- Show FPS, Entity Count, Memory usage.
- Buttons to "Spawn Enemy", "Heal".
```

#### **Prompt 33: Integration Tests**
```
Simulate a gameplay scenario in tests:
- Spawn Player, Spawn Enemy.
- Simulate 60 frames.
- Assert Enemy moves closer to Player.
```

#### **Prompt 34: Input Remapping**
```
Add Settings Menu:
- Allow user to rebind keys (e.g., WASD -> IJKL).
- Persist mapping to storage.
```

#### **Prompt 35: Localization**
```
Extract all strings to `en.json`:
- Implement `i18n` helper.
- Add `es.json` (Spanish).
- Language toggle in Settings.
```

#### **Prompt 36: Controller Support**
```
Add Gamepad API support:
- Left Stick to move.
- Right Trigger to shoot.
- Show gamepad prompts in UI.
```

#### **Prompt 37: Error Handling (Global)**
```
Implement a Global Error Boundary:
- Catch runtime errors.
- Display "Crash Screen" nicely instead of white screen.
- Allow "Restart Level" from crash screen.
```

#### **Prompt 38: Analytics (Mock)**
```
Mock an Analytics Service:
- Track "Heatmap" of player deaths.
- Log "Session Duration".
- Visualize data in Debug Console.
```

#### **Prompt 39: Modding API**
```
Expose Game Data:
- Load Ship Stats from external JSON.
- Allow user to modify JSON to change ship speed.
```

#### **Prompt 40: Achievements**
```
Add Achievement System:
- "Sharpshooter" (High accuracy).
- "Survivor" (Survive 5 mins).
- Notification popup system.
```

---

## 🏁 Phase 5: Final Polish (Prompts 41-50)

*Focus: Production readiness.*

#### **Prompt 41: Tutorial Level**
```
Scripted Tutorial:
- Restrict movement until prompt satisfied.
- "Press W to move forward" -> Wait -> "Good job".
```

#### **Prompt 42: Procedural Generation (World)**
```
Infinite World Generation:
- Generate Chunks of asteroids/enemies as player moves.
- Unload far chunks to save memory.
```

#### **Prompt 43: Boss Battle**
```
Add a Boss Entity:
- Giant sprite.
- Multiple phases (Shoot -> Charge -> Spawn Minions).
- Health bar UI at top of screen.
```

#### **Prompt 44: Balancing AI**
```
Dynamic Difficulty:
- If player HP > 90% for 1 min, spawn more enemies.
- If player dies often, reduce enemy speed.
```

#### **Prompt 45: Credits & Story**
```
Add End Game State:
- Trigger after Boss death.
- Scrolling credits.
- "Thank you for playing".
```

#### **Prompt 46: Mobile Support**
```
Add Touch Controls:
- Virtual Joystick on screen.
- Fire button.
- Only show on mobile devices.
```

#### **Prompt 47: PWA (Installable)**
```
Add Web App Manifest & Service Worker:
- Allow "Install to Desktop".
- Offline support.
```

#### **Prompt 48: Minification/Build**
```
Optimize Build:
- Configure Webpack/Vite for production.
- Asset compression.
- Verify `dist/` size.
```

#### **Prompt 49: Accessibility**
```
Add A11y features:
- High Contrast mode.
- Screen Reader support for UI.
- Reduce motion option.
```

#### **Prompt 50: Final Code Audit**
```
Run a full linter pass:
- Fix style issues.
- Add comments to public methods.
- Generate TypeDoc documentation.
```

---

## 📊 Analysis Metrics

Compare results at checkpoints (Prompt 10, 20, 30, 40, 50):
1.  **Lines of Code vs. Bugs**
2.  **FPS Performance** (Baseline vs SCMS)
3.  **Refactor Success** (Did Prompt 28 ECS kill the project?)
4.  **Token Cost** (Economy)
