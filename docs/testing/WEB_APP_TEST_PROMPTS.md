# SCMS Test Prompts: "TaskFlow Pro" (Web Application Pivot)

This roadmap outlines the 50-prompt journey to build a **Full-Stack Task Management Application** from scratch.
**Goal:** Compare Baseline vs SCMS on architectural stability when scaling from simple CRUD to multi-tenant SaaS.

---

## ⚠️ Test Protocol

1. **Clean Slate:** Delete previous `backend/`, `frontend/`, and `node_modules/` folders.
2. **Environment:** Monorepo setup with TypeScript, Node.js, React (Agent choice of bundler).
3. **Execution:** Run the exact same prompt for both Agents.
4. **Validation:**
   - **Baseline:** Does it work? Does it handle edge cases?
   - **SCMS:** Does it follow patterns? Are there tests?

---

## 🚀 Phase 1: The Foundation (Prompts 1-10)

*Focus: Setting up the backend API and basic frontend.*

#### **Prompt 1: Project Setup & Express Server**
```
Initialize a monorepo TypeScript project:
- Create `backend/` folder with Express server setup.
- Create `package.json` with TypeScript, Express, and nodemon.
- Create `backend/src/server.ts` with basic Express server listening on port 3001.
- Log "Server running on http://localhost:3001" on startup.
```

#### **Prompt 2: Database Setup (SQLite)**
```
Add SQLite database:
- Install `sqlite3` and `better-sqlite3`.
- Create `backend/src/database.ts` with connection setup.
- Create `tasks` table schema (id, title, description, completed, createdAt).
- Initialize database on server startup.
```

#### **Prompt 3: Task Model & Repository**
```
Create Task data layer:
- Create `backend/src/models/Task.ts` interface.
- Create `backend/src/repositories/TaskRepository.ts` with CRUD methods.
- Methods: `create()`, `findAll()`, `findById()`, `update()`, `delete()`.
- Use prepared statements for SQL queries.
```

#### **Prompt 4: REST API Routes**
```
Implement Task API endpoints:
- `POST /api/tasks` - Create task.
- `GET /api/tasks` - Get all tasks.
- `GET /api/tasks/:id` - Get single task.
- `PUT /api/tasks/:id` - Update task.
- `DELETE /api/tasks/:id` - Delete task.
```

#### **Prompt 5: Validation Middleware**
```
Add input validation:
- Install `express-validator`.
- Create `backend/src/middleware/validation.ts`.
- Validate task creation: title (required, 3-100 chars), description (optional).
- Return 400 errors with validation messages.
```

#### **Prompt 6: Error Handling Middleware**
```
Create error handling system:
- Create `backend/src/middleware/errorHandler.ts`.
- Catch all errors and return consistent JSON format.
- Include status code, message, and stack trace (dev only).
- Log errors to console with timestamps.
```

#### **Prompt 7: React Frontend Setup**
```
Initialize React frontend:
- Create `frontend/` folder with Vite + React + TypeScript.
- Setup `frontend/src/App.tsx` with basic component.
- Add TailwindCSS for styling.
- Verify dev server runs on port 5173.
```

#### **Prompt 8: API Client Service**
```
Create API communication layer:
- Create `frontend/src/services/api.ts`.
- Axios/fetch wrapper with base URL configuration.
- Methods: `getTasks()`, `getTask(id)`, `createTask()`, `updateTask()`, `deleteTask()`.
- Handle errors and return typed responses.
```

#### **Prompt 9: Task List Component**
```
Implement Task List UI:
- Create `frontend/src/components/TaskList.tsx`.
- Fetch tasks on mount using API service.
- Display tasks in a list with title, description, status.
- Show loading state and error messages.
```

#### **Prompt 10: Task Form Component**
```
Create Task creation form:
- Create `frontend/src/components/TaskForm.tsx`.
- Form fields: title (input), description (textarea), completed (checkbox).
- Client-side validation matching backend rules.
- Submit to API and refresh task list on success.
```

---

## 🔐 Phase 2: Authentication & Security (Prompts 11-20)

*Focus: User system and protected routes.*

#### **Prompt 11: User Model & Registration**
```
Add User authentication:
- Create `users` table schema (id, email, passwordHash, createdAt).
- Create `backend/src/models/User.ts`.
- Install `bcrypt` for password hashing.
- `POST /api/auth/register` endpoint with email/password validation.
```

#### **Prompt 12: Login & JWT Tokens**
```
Implement login system:
- Install `jsonwebtoken`.
- `POST /api/auth/login` - validate credentials.
- Generate JWT token with user ID and email.
- Return token + user data on successful login.
```

#### **Prompt 13: Auth Middleware**
```
Protect API routes:
- Create `backend/src/middleware/auth.ts`.
- Verify JWT token from `Authorization` header.
- Attach user data to `req.user`.
- Return 401 for invalid/missing tokens.
```

#### **Prompt 14: User-Task Association**
```
Link tasks to users:
- Add `userId` column to `tasks` table.
- Update TaskRepository to filter by userId.
- Modify all task endpoints to use `req.user.id`.
- Users can only see/modify their own tasks.
```

#### **Prompt 15: Login Form Component**
```
Create login UI:
- Create `frontend/src/components/LoginForm.tsx`.
- Email and password inputs with validation.
- Call `/api/auth/login` on submit.
- Store token in localStorage on success.
```

#### **Prompt 16: Register Form Component**
```
Add registration UI:
- Create `frontend/src/components/RegisterForm.tsx`.
- Email, password, confirm password fields.
- Password strength validation (8+ chars, number, special char).
- Navigate to login after successful registration.
```

#### **Prompt 17: Auth Context**
```
Implement global auth state:
- Create `frontend/src/context/AuthContext.tsx`.
- Manage user state, token, login/logout functions.
- `useAuth()` hook for components.
- Auto-load user from localStorage on app start.
```

#### **Prompt 18: Protected Routes**
```
Add route protection:
- Install `react-router-dom`.
- Create `ProtectedRoute` component.
- Redirect to `/login` if not authenticated.
- Setup routes: `/login`, `/register`, `/tasks` (protected).
```

#### **Prompt 19: API Client with Auth**
```
Update API service for authentication:
- Auto-attach JWT token to all requests.
- Intercept 401 responses and redirect to login.
- Clear token from storage on logout.
- Refresh token on API client initialization.
```

#### **Prompt 20: Logout & Session Management**
```
Complete auth flow:
- Add logout button in header/navbar.
- Clear token and user state on logout.
- Add token expiration check (auto-logout after 24h).
- Show "Session expired" message and redirect.
```

---

## 🧪 Phase 3: Testing & Quality (Prompts 21-30)

*Focus: Automated testing and code quality.*

#### **Prompt 21: Backend Unit Tests Setup**
```
Initialize backend testing:
- Install Jest and `@types/jest`.
- Create `backend/jest.config.js`.
- Create `backend/src/__tests__/` folder.
- Add `npm test` script for backend.
```

#### **Prompt 22: Task Repository Tests**
```
Test data layer:
- Create `TaskRepository.test.ts`.
- Test CRUD operations with in-memory SQLite.
- Verify: create returns new task, findAll returns array, update modifies record.
- Use beforeEach to reset database state.
```

#### **Prompt 23: API Endpoint Tests**
```
Integration tests for routes:
- Install `supertest`.
- Create `routes/tasks.test.ts`.
- Test all endpoints: POST/GET/PUT/DELETE.
- Verify status codes and response structure.
```

#### **Prompt 24: Auth Flow Tests**
```
Test authentication:
- Create `auth.test.ts`.
- Test registration with valid/invalid data.
- Test login with correct/incorrect credentials.
- Test protected endpoints with/without token.
```

#### **Prompt 25: Frontend Test Setup**
```
Initialize frontend testing:
- Install Vitest and `@testing-library/react`.
- Create `frontend/vitest.config.ts`.
- Add `npm test` script for frontend.
- Create `frontend/src/__tests__/` folder.
```

#### **Prompt 26: Component Tests**
```
Test React components:
- Create `TaskList.test.tsx`.
- Mock API calls with `vi.mock()`.
- Test: loading state, error state, successful render.
- Verify tasks display correctly.
```

#### **Prompt 27: Form Validation Tests**
```
Test form behavior:
- Create `TaskForm.test.tsx`.
- Test: empty submission shows errors.
- Test: valid submission calls API.
- Test: successful submission clears form.
```

#### **Prompt 28: Auth Context Tests**
```
Test authentication state:
- Create `AuthContext.test.tsx`.
- Test login updates state and stores token.
- Test logout clears state.
- Test auto-login from localStorage.
```

#### **Prompt 29: API Client Tests**
```
Test service layer:
- Create `api.test.ts`.
- Mock fetch/axios responses.
- Test error handling (network errors, 404, 500).
- Verify request headers include auth token.
```

#### **Prompt 30: E2E Test Setup**
```
Add end-to-end testing:
- Install Playwright.
- Create `e2e/auth.spec.ts`.
- Test full flow: register -> login -> create task -> logout.
- Run tests in CI-ready mode.
```

---

## 🎨 Phase 4: UI/UX Enhancement (Prompts 31-40)

*Focus: User experience and visual polish.*

#### **Prompt 31: Task Filtering**
```
Add filter controls:
- Filter by status: All, Active, Completed.
- Filter by date: Today, This Week, All Time.
- Update TaskList component with filter state.
- Filter tasks client-side after fetch.
```

#### **Prompt 32: Task Sorting**
```
Implement sorting:
- Sort options: Date (newest/oldest), Title (A-Z), Status.
- Dropdown selector for sort method.
- Sort tasks before rendering.
- Persist sort preference to localStorage.
```

#### **Prompt 33: Task Search**
```
Add search functionality:
- Search input above task list.
- Filter by title and description (case-insensitive).
- Debounce search input (300ms).
- Show "No results" message when empty.
```

#### **Prompt 34: Inline Task Editing**
```
Enable quick edits:
- Double-click task to enter edit mode.
- Inline inputs for title/description.
- Save on Enter, cancel on Escape.
- Update API and refresh list.
```

#### **Prompt 35: Drag & Drop Reordering**
```
Add task reordering:
- Install `react-beautiful-dnd` or `@dnd-kit/core`.
- Allow dragging tasks to reorder.
- Save order to database (add `position` column).
- Persist order across page reloads.
```

#### **Prompt 36: Task Categories/Tags**
```
Implement tagging system:
- Add `tags` column to tasks (JSON array).
- Tag input component with autocomplete.
- Filter tasks by tag.
- Display tags as colored badges.
```

#### **Prompt 37: Dark Mode**
```
Add theme toggle:
- Create theme context (light/dark).
- Toggle button in header.
- Update TailwindCSS classes dynamically.
- Persist theme preference to localStorage.
```

#### **Prompt 38: Animations & Transitions**
```
Add UI polish:
- Fade in tasks on load.
- Slide animation for task creation/deletion.
- Loading spinners for async operations.
- Toast notifications for success/error messages.
```

#### **Prompt 39: Responsive Design**
```
Mobile optimization:
- Responsive grid for task cards (1/2/3 columns).
- Mobile-friendly forms and buttons.
- Hamburger menu for navigation.
- Test on mobile viewport sizes.
```

#### **Prompt 40: Accessibility (A11y)**
```
Improve accessibility:
- Add ARIA labels to interactive elements.
- Keyboard navigation for all features.
- Focus management in modals.
- Screen reader announcements for state changes.
```

---

## 🚀 Phase 5: Advanced Features (Prompts 41-50)

*Focus: Production-ready capabilities.*

#### **Prompt 41: Due Dates & Reminders**
```
Add time-based features:
- Add `dueDate` column to tasks.
- Date picker input in task form.
- Highlight overdue tasks in red.
- Sort by due date option.
```

#### **Prompt 42: Task Priority Levels**
```
Implement priority system:
- Add `priority` column (Low/Medium/High/Urgent).
- Priority selector in form.
- Color-code tasks by priority.
- Sort by priority.
```

#### **Prompt 43: Subtasks (Nested Tasks)**
```
Add task hierarchy:
- Add `parentId` column for subtasks.
- Nested task list rendering.
- Create subtask button.
- Track completion percentage for parent tasks.
```

#### **Prompt 44: File Attachments**
```
Allow file uploads:
- Add file upload to task form.
- Store files in `backend/uploads/` folder.
- Save file paths in database.
- Display/download attachments in UI.
```

#### **Prompt 45: Activity Log**
```
Track task history:
- Create `activity_log` table (taskId, action, userId, timestamp).
- Log: created, updated, completed, deleted events.
- Display activity timeline for each task.
```

#### **Prompt 46: Export & Import**
```
Data portability:
- Export tasks to JSON/CSV format.
- Import tasks from file.
- Validate imported data structure.
- Download button in UI.
```

#### **Prompt 47: Real-time Updates**
```
Add WebSocket support:
- Install `socket.io`.
- Broadcast task changes to all connected clients.
- Update UI in real-time when tasks change.
- Show "New task added by [user]" notifications.
```

#### **Prompt 48: Multi-Tenant SaaS**
```
Add organization support:
- Create `organizations` table.
- Users belong to organizations.
- Shared tasks within organization.
- Organization admin role.
```

#### **Prompt 49: Performance Optimization**
```
Optimize application:
- Add database indexes (userId, createdAt).
- Implement pagination (20 tasks per page).
- Lazy load task details.
- Bundle size optimization (code splitting).
```

#### **Prompt 50: Production Deployment**
```
Prepare for deployment:
- Create `Dockerfile` for backend.
- Environment variable configuration (.env).
- Setup CORS for production domain.
- Add build scripts for frontend production bundle.
- Create deployment README with instructions.
```

---

## 📊 Analysis Metrics

Compare results at checkpoints (Prompt 10, 20, 30, 40, 50):
1. **Lines of Code vs. Bugs**
2. **API Response Time** (Baseline vs SCMS)
3. **Refactor Success** (Did auth integration break existing code?)
4. **Token Cost** (Economy)
5. **Test Coverage** (Target >80%)

---

## 🎯 Key Refactor Points

Watch for architectural stress at:
- **Prompt 14:** User-Task association (major data model change)
- **Prompt 28:** Auth context integration (state management refactor)
- **Prompt 43:** Subtasks (hierarchical data complexity)
- **Prompt 47:** WebSockets (real-time architecture shift)
- **Prompt 48:** Multi-tenancy (complete data isolation rework)

*These typically break Baseline codebases without proper patterns.*
