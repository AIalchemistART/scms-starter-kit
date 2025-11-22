# P31-P35 Batch Prompt: Enhanced Task Management Features

**Phase**: UI/UX Enhancement (Advanced Features)  
**Format**: Batch (5 prompts)  
**Focus**: User productivity, interaction patterns, data manipulation

---

## 📋 BATCH PROMPTS (P31-P35)

Please implement all 5 enhanced features to improve task management functionality. Consider implementing them in a logical order based on dependencies.

---

### **Prompt 31: Task Filtering** 🔍

Add filter controls to narrow down task views:
- Filter by status: All, Active, Completed
- Filter by date: Today, This Week, All Time
- Filter UI: Segmented control or dropdown above task list
- Update TaskList component with filter state
- Filter tasks client-side after fetch
- Show filter count (e.g., "Showing 5 of 12 tasks")

**Implementation Notes:**
- Consider where to store filter state (component state, context, URL params)
- Ensure filters work together with any existing search functionality
- Add visual indicator of active filter

---

### **Prompt 32: Task Sorting** 📊

Implement sorting controls:
- Sort options: Date (newest/oldest), Title (A-Z/Z-A), Status
- Sort UI: Dropdown selector or toggle buttons
- Sort tasks before rendering in TaskList
- Add sort direction indicator (up/down arrow)

**Implementation Notes:**
- Sorting should be fast and not block the UI
- Consider persisting user's sort preference
- Ensure sorting works together with filters

---

### **Prompt 33: Task Search** 🔎

Add search functionality:
- Search input above task list (prominent placement)
- Filter by title AND description (case-insensitive)
- Debounce search input (300ms delay)
- Show "No results" message when empty
- Clear search button (X icon)
- Show result count ("Found 3 tasks")

**Implementation Notes:**
- Debounce to avoid excessive re-renders
- Consider highlighting search terms in results
- Ensure search works with filters and sorting

---

### **Prompt 34: Inline Task Editing** ✏️

Enable quick editing without modal:
- Double-click task to enter edit mode
- Inline inputs for title and description
- Save on Enter or blur, cancel on Escape
- Show save/cancel buttons or auto-save
- Update API and refresh list
- Handle errors gracefully

**Implementation Notes:**
- Provide visual indicator of edit mode (highlight, border)
- Validate input same as create form
- Consider optimistic updates for better UX
- Disable editing while save is in progress

---

### **Prompt 35: Drag & Drop Reordering** 🎯

Add task reordering capability:
- Install a drag & drop library (react-beautiful-dnd or similar)
- Allow dragging tasks to reorder within list
- Visual feedback during drag (lift animation, drop indicators)
- Save order to database (add `position` or `order` column to tasks table)
- Persist order across page reloads
- Handle edge cases: empty list, single item, drag cancel

**Implementation Notes:**
- Choose a drag & drop library that fits your needs
- Add `position` column (integer) to tasks table
- Ensure smooth animations
- Consider mobile/touch support

---

## 🎯 IMPLEMENTATION GUIDANCE

### **Planning Phase**

Before implementing, consider:

1. **Implementation Order:**
   - What dependencies exist between features?
   - Which features share common functionality?
   - What's the most logical build order?

2. **State Management:**
   - How will filter, sort, and search state be managed?
   - Will you use URL params for shareable links?
   - Should preferences persist across sessions?

3. **Integration:**
   - How do filter + sort + search work together?
   - What happens to custom drag order when sort is applied?
   - Can users edit while filters are active?

### **Testing**

Verify each feature:
- Works in isolation
- Works together with other features
- Handles edge cases (empty lists, no results, errors)
- Performs well (no lag or jank)
- Works on mobile devices

### **Verification Checklist**

**P31 - Filtering:**
- [ ] All filter options work correctly
- [ ] Filter count is accurate
- [ ] Works with sort and search
- [ ] Visual feedback for active filter

**P32 - Sorting:**
- [ ] All sort options work correctly
- [ ] Sort direction indicator visible
- [ ] Works with filter and search
- [ ] Sorting is fast/smooth

**P33 - Search:**
- [ ] Searches title and description
- [ ] Debounced properly
- [ ] Shows result count
- [ ] Clear button works
- [ ] Works with filter and sort
- [ ] No results message appears

**P34 - Inline Editing:**
- [ ] Double-click enters edit mode
- [ ] Save on Enter, cancel on Escape
- [ ] Validation works correctly
- [ ] API updates successfully
- [ ] Error handling works
- [ ] Works while filtered/sorted

**P35 - Drag & Drop:**
- [ ] Visual feedback during drag
- [ ] Drop zones are clear
- [ ] Order persists to database
- [ ] Works after page reload
- [ ] Smooth animations
- [ ] Cancel on Escape works

---

## 📊 COMPLETION CRITERIA

**All features should:**
- ✅ Be fully functional
- ✅ Work together without conflicts
- ✅ Handle errors gracefully
- ✅ Provide good user feedback
- ✅ Work on desktop and mobile
- ✅ Maintain existing functionality (no regressions)

**Quality indicators:**
- Clean, maintainable code
- Good performance (no lag)
- Intuitive user experience
- Consistent visual design
- Proper error handling

---

## 🎯 FINAL OUTPUT

When complete, please provide:

1. **Summary of implementation:**
   - Order you implemented features and why
   - Any challenges encountered
   - How features integrate with each other

2. **State management approach:**
   - How filter/sort/search state is managed
   - Whether preferences persist
   - How features coordinate

3. **Known issues or limitations:**
   - Any features not fully implemented
   - Performance considerations
   - Future improvements needed

---

**Ready to enhance your task management app! 🚀**
