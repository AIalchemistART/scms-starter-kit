# P26-P30 Batch Prompt: UI/UX Implementation

**Phase**: UI/UX & User Experience  
**Format**: Batch (5 prompts)  
**Focus**: Frontend polish, responsive design, accessibility

---

## 🎯 SCMS SESSION START

**Working on:** UI/UX Implementation Batch (P26-P30: Animations, Responsive Design, Accessibility, Theme System, Loading States)

Please operate using SCMS (Sparse Contextual Memory Scaffolding) framework:

### 1. 🛠️ CONTEXT LOADING & SYSTEM CHECK
   - Check `docs/scms/INDEX.md` for relevant patterns
   - **CRITICAL:** Review `docs/scms/FAILURES.md` to avoid known pitfalls (L2)
   - **TEMPLATE CHECK:** Ensure `docs/templates/` exists (L2/L3/L5 templates)
   - Verify Environment: Quick check of package.json scripts & config
   - **PROJECT CONFIGURATION:** Review `docs/scms/WORKSPACE_RULES.md` for validated patterns
   - **BATCH PLANNING:** This is a 5-prompt batch (P26-P30). Review all requirements below and **plan implementation order** considering dependencies.
   - **ROADMAP CONTEXT:** Check `docs/testing/WEB_APP_TEST_PROMPTS.md` for full project context and future prompts

### 2. 🧠 LAYER RETRIEVAL PRIORITY
   **AUTOMATIC (System):**
   - L0: Auto-gen memories (Cascade) - **Primary Context**
   - L4: Global Rules (User Rules) - **Hard Constraints**
   - L1: Workspace Rules (valid_patterns) - **Quality Gates**
   
   **SELF-DIRECTED (Agent):**
   - L2: SOPs & Failure Logs - **Must check `FAILURES.md` if doing risky work**
   - L3: Case Studies - Retrieve if implementing complex features
   - L5: Overflow - Low-frequency patterns
   - **ROADMAP:** Reference `WEB_APP_TEST_PROMPTS.md` for UI/UX requirements
   
   **Retrieval Workflow:** Windsurf hardcoded (L0 → L4 → L1) → SCMS directed (L2/L3 → L5 if needed) → Generate (if no retrieval) → L4 compliance check

### 3. 💰 ECONOMIC TRACKING (EXPORT-TRIGGERED)
   - **Goal:** 30-50% Retrieval Ratio
   - **Requirement:** Maintain accurate token warnings in chat
   - **Update Method:** Dashboard Export -> `checkpoints/checkpoint-[ID].txt` 
   - **Do not manually edit** `economics-dashboard-data.json` (it is auto-generated)
   - **BATCH CONTEXT:** Track total cost for all 5 prompts as one unit

### 4. 🚨 FAILURE DOCUMENTATION (L2)
   - **Trigger:** Any component failure, styling issue, or accessibility problem
   - **Action:** Log immediately to `docs/scms/FAILURES.md` 
   - **Constraint:** MUST use `docs/templates/FAILURE_LOG_TEMPLATE.md` (5 Whys required)
   - **Philosophy:** "What NOT to do" is more valuable than "What to do"
   - **NEW:** Use `docs/templates/FAILURE_PATTERN_ANALYSIS_TEMPLATE.md` for systematic failure tracking

### 5. 🏁 SESSION CLOSURE PROTOCOL (L5)
   - **Target:** 10-15 mins remaining
   - **Mandatory Steps:**
     1. **Reflect:** Log failures using L2 Template
     2. **Promote:** Check patterns per threshold (see `docs/scms/MEMORY_STATUS_DASHBOARD.md`) using L3 Template
     3. **Audit:** Generate `docs/scms/SESSION_LOG_L5.md` using **L5 Template**
     4. **Export:** Run Dashboard Export to finalize metrics
     5. **BATCH SUMMARY:** Document batch planning approach, execution order, and any deviations
     6. **FAILURE ANALYSIS:** Complete `FAILURE_PATTERN_ANALYSIS_TEMPLATE.md` for this batch

---

## 📋 BATCH PROMPTS (P26-P30)

Please implement all 5 UI/UX prompts as a cohesive enhancement. **Plan your approach first**, considering:
- Dependency order (what needs to be built first?)
- Shared components or utilities
- Testing strategy for UI components
- Accessibility throughout (not just in P28)
- Visual consistency across all prompts

---

### **Prompt 26: Smooth Transitions & Animations** ✨
```
Add polish to the user interface:
- Install framer-motion or use CSS transitions
- Add fade-in animations for task list items
- Add slide-in animation for modal/dialogs
- Add subtle hover effects on interactive elements
- Add loading skeleton animations while data loads
- Keep animations subtle and performant (60fps)
- Add prefers-reduced-motion support for accessibility
```

**Key Considerations:**
- Performance: Animations should not block UI
- Accessibility: Respect `prefers-reduced-motion`
- Consistency: Define animation timings/easings once, reuse
- Testing: Visual regression tests or manual QA checklist

---

### **Prompt 27: Responsive Design & Mobile Support** 📱
```
Make the application fully responsive:
- Implement mobile-first responsive breakpoints
- Add hamburger menu for mobile navigation
- Make task list mobile-friendly (swipe actions?)
- Ensure forms work well on mobile (proper input types)
- Test on common breakpoints: 320px, 768px, 1024px, 1440px
- Add viewport meta tag if missing
- Use CSS Grid/Flexbox for flexible layouts
```

**Key Considerations:**
- Touch targets: Minimum 44x44px for mobile
- Mobile navigation: Hamburger menu or bottom nav?
- Form UX: Proper keyboard types (email, password, etc.)
- Testing: Test on actual devices or browser dev tools

---

### **Prompt 28: Accessibility (A11y) Improvements** ♿
```
Ensure application is accessible to all users:
- Add proper ARIA labels to interactive elements
- Ensure keyboard navigation works (tab order logical)
- Add focus indicators (visible focus styles)
- Ensure color contrast meets WCAG 2.1 AA standards
- Add screen reader announcements for dynamic content
- Add alt text to any images
- Test with keyboard only (no mouse)
- Test with screen reader if possible (NVDA/JAWS/VoiceOver)
```

**Key Considerations:**
- Semantic HTML: Use proper elements (button, not div onclick)
- ARIA when needed: But prefer semantic HTML first
- Focus management: Trap focus in modals, restore after close
- Color contrast: Use tools like WebAIM contrast checker
- Testing: Lighthouse accessibility audit, axe DevTools

---

### **Prompt 29: Dark Mode / Theme System** 🌓
```
Implement theme switching:
- Create theme context or use CSS variables
- Implement light and dark color schemes
- Add theme toggle button in header/settings
- Save theme preference to localStorage
- Respect system preference (prefers-color-scheme)
- Ensure good contrast in both themes
- Update all components to use theme colors
```

**Key Considerations:**
- CSS Custom Properties: Most flexible approach
- System preference: `prefers-color-scheme` media query
- Persistence: localStorage or user profile
- Flash of unstyled content: Load theme before render
- Color palette: Define once, use throughout

---

### **Prompt 30: Loading & Error States** ⏳
```
Improve feedback for async operations:
- Add loading spinners/skeletons for data fetching
- Add error boundaries to catch React errors
- Show user-friendly error messages (not stack traces)
- Add retry mechanisms for failed requests
- Add empty states (no tasks yet, no results)
- Add toast notifications for success/error actions
- Handle network errors gracefully (offline mode?)
```

**Key Considerations:**
- Loading states: Skeleton screens > spinners (better perceived performance)
- Error handling: User-friendly messages, actionable next steps
- Empty states: Guide user to take action (create first task)
- Optimistic updates: Show UI change immediately, rollback if fails
- Network resilience: Handle offline, slow connections

---

## 🎯 BATCH EXECUTION GUIDANCE

### **Step 1: PLAN BEFORE CODING** (5-10 minutes)

**Review all 5 prompts and answer:**
1. What is the logical implementation order?
   - Example: P27 (responsive) might come first to establish layout structure
   - Example: P29 (theme) needs CSS variables that affect P26 (animations)
   - Example: P30 (loading) might integrate throughout others

2. Are there shared utilities to create?
   - Animation constants (duration, easing)
   - Theme color palette
   - Responsive breakpoint constants
   - Loading/Error components

3. What are the integration points?
   - Animations + Theme (color transitions)
   - Responsive + Accessibility (mobile menu keyboard nav)
   - Loading + Error (feedback states)

4. How will you test each component?
   - Manual QA checklist?
   - Visual regression?
   - Accessibility audit?
   - Responsive breakpoint testing?

**OUTPUT YOUR PLAN** before implementing. Include:
- Implementation order with rationale
- Shared utilities/components to create
- Integration considerations
- Testing approach

---

### **Step 2: IMPLEMENT SYSTEMATICALLY**

For each prompt:
1. ✅ Implement core functionality
2. ✅ Test in isolation
3. ✅ Integrate with existing code
4. ✅ Verify no regressions
5. ✅ Document any issues encountered

**Use the Failure Analysis Template:**
- Track iterations needed
- Categorize failure types
- Document fixes applied
- Note learning/patterns

---

### **Step 3: INTEGRATION & POLISH**

After all 5 implemented:
1. Test them **working together**
   - Dark mode + animations (smooth theme transitions?)
   - Responsive + a11y (mobile menu keyboard nav works?)
   - Loading states + animations (graceful loading transitions?)

2. Visual consistency check
   - All components use theme colors
   - All animations use same timing/easing
   - All error states have consistent styling
   - All interactive elements have proper focus styles

3. Performance check
   - Animations don't block UI
   - No layout shifts
   - Smooth scrolling on mobile
   - Theme switch is instant

---

### **Step 4: VERIFICATION CHECKLIST**

Before declaring "done," verify:

**Prompt 26 - Animations:**
- [ ] Task list items fade in smoothly
- [ ] Modals slide in/out
- [ ] Hover effects are subtle
- [ ] Loading skeletons animate
- [ ] `prefers-reduced-motion` respected
- [ ] Animations are 60fps (check devtools)

**Prompt 27 - Responsive:**
- [ ] Works on 320px (mobile)
- [ ] Works on 768px (tablet)
- [ ] Works on 1024px+ (desktop)
- [ ] Mobile navigation functional
- [ ] Touch targets ≥44x44px
- [ ] Forms work on mobile

**Prompt 28 - Accessibility:**
- [ ] Keyboard navigation works (tab through all controls)
- [ ] Focus indicators visible
- [ ] ARIA labels on interactive elements
- [ ] Color contrast passes WCAG AA
- [ ] Screen reader announces dynamic changes
- [ ] Lighthouse accessibility score >90

**Prompt 29 - Theme:**
- [ ] Light mode works
- [ ] Dark mode works
- [ ] Theme toggle functional
- [ ] Theme persists (localStorage)
- [ ] Respects system preference
- [ ] No FOUC (flash of unstyled content)
- [ ] All components use theme colors

**Prompt 30 - Loading/Error:**
- [ ] Loading states show for async ops
- [ ] Error boundaries catch errors
- [ ] User-friendly error messages
- [ ] Retry mechanisms work
- [ ] Empty states guide user
- [ ] Toast notifications appear
- [ ] Offline handling (if applicable)

---

## 📊 SUCCESS METRICS

**Completion Criteria:**
- ✅ All 5 prompts fully implemented
- ✅ No visual regressions on existing features
- ✅ Lighthouse scores: Performance >90, Accessibility >90, Best Practices >90
- ✅ Mobile responsive (tested on real device or devtools)
- ✅ Keyboard navigation works throughout
- ✅ Dark/Light themes both functional
- ✅ Loading/Error states graceful

**Quality Indicators:**
- Visual consistency across all new features
- Performance: No jank, smooth 60fps animations
- Accessibility: Usable with keyboard only
- Responsive: Seamless experience on mobile/desktop
- Polish: Professional appearance, attention to detail

---

## 🚨 FAILURE LOGGING REMINDER

**For every issue encountered:**

1. **Immediate logging** to `FAILURES.md` if it's a bug/regression
2. **Use template:** `FAILURE_PATTERN_ANALYSIS_TEMPLATE.md` for systematic tracking
3. **Track iterations:** How many attempts to get each prompt working?
4. **Categorize failures:** CSS bug? Accessibility issue? Integration problem?
5. **Document fixes:** What worked? What didn't?

**This data is critical for comparative analysis!**

---

## 🎯 FINAL OUTPUT

At completion, provide:

1. **Batch Summary:**
   - Implementation order you chose and why
   - Total time estimate
   - Any deviations from plan
   - Integration challenges encountered

2. **Failure Analysis:**
   - Use template to document all failures
   - Categorize by type (CSS, Integration, A11y, etc.)
   - Complexity of fixes
   - Patterns observed

3. **Verification Report:**
   - Checklist status (all items checked?)
   - Lighthouse scores
   - Known issues/limitations
   - Recommendations for future prompts

4. **Pattern Opportunities:**
   - Any patterns worth promoting to L1?
   - Reusable components created?
   - Anti-patterns to avoid?

---

**Let's build a polished, accessible, delightful user experience! ✨**

Remember: **Plan → Implement → Integrate → Verify → Document**

Good luck! 🚀
