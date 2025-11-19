# [Feature/Pattern Name] - Standard Operating Procedure

**Document Type**: Level 2 SOP (Standard Operating Procedure)  
**Created**: YYYY-MM-DD  
**Last Updated**: YYYY-MM-DD  
**Status**: ✅ Validated Pattern (Use Count: X) | ⏳ Draft  
**Complexity**: Low | Medium | High  
**Est. Implementation Time**: XX-XX minutes  
**Prerequisites**: [List any required setup or knowledge]  
**Tags:** #[topic] #[category] (e.g., #api #testing #deployment)

> **Cross-Reference:** Add this SOP to `docs/scms/INDEX.md` under the relevant topic section.

---

## 📋 Overview

### What This Does

[Clear description of what this pattern/feature accomplishes]

### When to Use This SOP

**Use this when**:
- [Scenario 1]
- [Scenario 2]
- [Scenario 3]

**Don't use this when**:
- [Exception 1]
- [Exception 2]

### Who This Is For

- [e.g., Frontend developers implementing new features]
- [e.g., Backend developers setting up new endpoints]
- [e.g., Anyone working with [specific technology]]

---

## 🎯 Expected Outcomes

**After following this SOP, you will have**:
- [ ] [Outcome 1]
- [ ] [Outcome 2]
- [ ] [Outcome 3]

**Success Criteria**:
- [How to know it worked]
- [What to test]
- [Expected behavior]

---

## 📚 Background & Context

### Why This Pattern Exists

[Explain the problem this pattern solves]

### Related Patterns

- **L1 Pattern**: See WORKSPACE_RULES.md → [Section name]
- **L2 SOP**: See [Related SOP name]
- **L3 Case Study**: See [Example implementation]

### Historical Context

[Optional: How this pattern evolved, previous approaches, lessons learned]

---

## 🏗️ Architecture Overview

### High-Level Design

```
[ASCII diagram or description of architecture]

Component A → Component B → Component C
     ↓              ↓              ↓
   Data Flow   Processing    Output
```

### Key Components

**[Component 1]**:
- Purpose: [What it does]
- Responsibilities: [What it handles]

**[Component 2]**:
- Purpose: [What it does]
- Responsibilities: [What it handles]

### Data Flow

```
Input → [Step 1] → [Step 2] → [Step 3] → Output
```

---

## 📝 Implementation Steps

### Step 1: [First Step Name]

**Purpose**: [Why this step is necessary]

**Actions**:

1. [Specific action 1]
   ```[language]
   // Code example
   ```

2. [Specific action 2]
   ```[language]
   // Code example
   ```

**Expected Result**: [What you should see after this step]

**Common Issues**:
- **Problem**: [What might go wrong]
- **Solution**: [How to fix it]

---

### Step 2: [Second Step Name]

**Purpose**: [Why this step is necessary]

**Actions**:

1. [Specific action 1]
   ```[language]
   // Code example
   ```

2. [Specific action 2]
   ```[language]
   // Code example
   ```

**Expected Result**: [What you should see after this step]

**Verification**:
```[language]
// How to verify this step worked
```

---

### Step 3: [Third Step Name]

[Continue pattern for all steps...]

---

## ⚠️ Critical Pitfalls

### Pitfall 1: [Problem Name]

**Description**: [What goes wrong]

**Symptom**: [How you know it's happening]

**Bad Example**:
```[language]
// Code that causes the problem
```

**Good Example**:
```[language]
// Correct approach
```

**Why It Happens**: [Root cause]

**Prevention**: [How to avoid]

---

### Pitfall 2: [Problem Name]

[Continue pattern for all common pitfalls...]

---

## ✅ Testing Checklist

### Unit Tests

- [ ] Test [specific functionality]
- [ ] Test [edge case 1]
- [ ] Test [edge case 2]
- [ ] Test error handling

**Example Test**:
```[language]
test('[description]', () => {
  // Test implementation
});
```

---

### Integration Tests

- [ ] Test [component interaction]
- [ ] Test [data flow]
- [ ] Test [API integration]

---

### Manual Testing

1. **[Test Scenario 1]**:
   - Action: [What to do]
   - Expected: [What should happen]

2. **[Test Scenario 2]**:
   - Action: [What to do]
   - Expected: [What should happen]

---

### Edge Cases

- [ ] Test with empty input
- [ ] Test with null/undefined
- [ ] Test with maximum values
- [ ] Test with invalid data
- [ ] Test concurrent operations (if applicable)

---

## 🎯 Performance Considerations

### Expected Performance

**Benchmarks**:
- [Operation]: < [time]
- [Operation]: < [time]

### Optimization Tips

**[Optimization 1]**:
```[language]
// Example of optimization
```

**[Optimization 2]**:
```[language]
// Example of optimization
```

### Monitoring

**Metrics to Track**:
- [Metric 1]: Target [value]
- [Metric 2]: Target [value]

**When to Optimize**:
- If [metric] exceeds [threshold]
- If user reports [specific issue]

---

## 🔧 Code Templates

### Template 1: [Template Name]

**Use Case**: [When to use this template]

```[language]
// Complete working template
// Copy and modify as needed

function template() {
  // Implementation
}
```

**Customization Points**:
- `[variable]`: [What to change]
- `[function]`: [What to modify]

---

### Template 2: [Template Name]

[Continue pattern for additional templates...]

---

## 🐛 Troubleshooting

### Issue: [Common Problem 1]

**Symptom**: [What you see]

**Diagnosis**:
1. Check [thing 1]
2. Verify [thing 2]
3. Confirm [thing 3]

**Solution**:
```[language]
// Fix code
```

---

### Issue: [Common Problem 2]

[Continue pattern for common issues...]

---

## 📊 Metrics & Validation

### Success Metrics

**Quantitative**:
- [Metric 1]: [Current value] → [Target value]
- [Metric 2]: [Current value] → [Target value]

**Qualitative**:
- [Quality 1]: [How to assess]
- [Quality 2]: [How to assess]

### Validation Steps

1. **Verify [aspect 1]**:
   - Command: `[test command]`
   - Expected output: [what to see]

2. **Verify [aspect 2]**:
   - Action: [what to do]
   - Expected result: [what should happen]

---

## 🔄 Maintenance & Updates

### When to Update This SOP

**Triggers**:
- Pattern used 10+ times (consider splitting into variants)
- New edge case discovered
- Performance optimization found
- Breaking change in dependencies

### Update Process

1. Document the change in git commit
2. Update this SOP
3. Notify team (if breaking change)
4. Update related L1 patterns in WORKSPACE_RULES.md

---

## 🔗 Related Documentation

### Within SCMS

- **L0 Memory**: `docs/memories/[memory-name].md` - Original pattern capture
- **L1 Pattern**: `WORKSPACE_RULES.md` → [Section] - Quick reference
- **L3 Case Study**: `docs/case-studies/[example].md` - Complete example

### External Resources

- [Link to official docs]
- [Link to relevant article]
- [Link to related tool]

---

## 📝 Examples

### Example 1: [Simple Use Case]

**Scenario**: [Describe scenario]

**Implementation**:
```[language]
// Complete working example
```

**Result**: [What this produces]

---

### Example 2: [Complex Use Case]

[Continue pattern for additional examples...]

---

## 🎓 Learning Resources

### For Beginners

**Start Here**:
1. [Resource 1 - Basic concepts]
2. [Resource 2 - Getting started]
3. [Resource 3 - Simple examples]

### For Advanced Users

**Deep Dives**:
1. [Resource 1 - Advanced patterns]
2. [Resource 2 - Performance optimization]
3. [Resource 3 - Edge cases]

---

## 📞 Getting Help

**If you encounter issues**:

1. **Check this SOP** - Review troubleshooting section
2. **Search memories** - `docs/memories/` for related patterns
3. **Ask the team** - [Slack channel / Discord / etc.]
4. **Create issue** - Document new edge cases for future updates

---

## 🗂️ Appendix

### Glossary

**[Term 1]**: [Definition]  
**[Term 2]**: [Definition]  
**[Term 3]**: [Definition]

### Configuration Reference

```[language]
// Complete configuration example
const config = {
  // All options documented
};
```

### Command Reference

**[Command 1]**: `command here`  
**[Command 2]**: `command here`

---

## ✍️ Changelog

**[Date]**: [Version] - [Author]
- [Change 1]
- [Change 2]

**[Date]**: [Version] - [Author]
- [Change 1]
- [Change 2]

---

**Last Updated**: YYYY-MM-DD  
**Maintained By**: [Team/Person]  
**Review Frequency**: [Weekly/Monthly/Quarterly]  
**Status**: ✅ Production Ready | ⏳ Draft | 🔄 Under Review

---

## Template Instructions (Remove This Section)

**To Create SOP from This Template**:

1. **Copy this template** to `docs/sops/[YOUR_SOP_NAME]_SOP.md`
2. **Replace all placeholders** in square brackets
3. **Fill in each section** with actual content
4. **Remove template instructions** (this section)
5. **Test the procedure** by following your own steps
6. **Get team review** before marking as production ready
7. **Link from WORKSPACE_RULES.md** in relevant L1 pattern

**When to Create an SOP**:
- Pattern used ≥5 times (validated through repeated use)
- Complex enough to need step-by-step guide
- Has multiple decision points or configurations
- Team members frequently ask "how do I do X?"

**Keep SOPs**:
- Clear and actionable (step-by-step)
- Up-to-date with current code
- Tested (can actually follow and get results)
- Referenced from L1 patterns

This is **Layer 2** in SCMS - detailed procedures for validated, frequently-used patterns.
