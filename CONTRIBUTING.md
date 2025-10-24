# Contributing to SCMS Starter Kit

Thank you for your interest in contributing to the SCMS Starter Kit! This project helps developers implement Sparse Contextual Memory Scaffolding for continual learning in AI-assisted development.

---

## Ways to Contribute

### 1. Report Issues

**Found a bug or have a suggestion?**

- Check [existing issues](https://github.com/AIalchemistART/scms-starter-kit/issues) first
- Create a new issue with clear description
- Include:
  - Steps to reproduce (for bugs)
  - Expected vs actual behavior
  - Your IDE/environment
  - SCMS version

---

### 2. Improve Documentation

**Help make SCMS more accessible!**

- Fix typos or unclear explanations
- Add examples or use cases
- Improve setup instructions
- Translate documentation
- Share success stories

---

### 3. Add IDE Support

**Support more AI assistants!**

We welcome setup guides for:
- VS Code with AI extensions
- JetBrains IDEs
- Emacs with AI plugins
- Vim with AI plugins
- Other AI-powered editors

**Template**: See `config/windsurf/SETUP.md` or `config/cursor/SETUP.md`

---

### 4. Share Examples

**Show SCMS in action!**

- Real-world case studies
- Pattern libraries for specific domains
- SOP examples from your projects
- Metrics and results

**Sanitize**: Remove sensitive/proprietary information

---

### 5. Create Tools

**Automate SCMS workflows!**

- Dashboard generators
- Memory management scripts
- Promotion automation
- Metrics tracking
- IDE plugins

---

## Contribution Process

### Step 1: Fork & Clone

```bash
# Fork on GitHub
# Clone your fork
git clone https://github.com/YOUR_USERNAME/scms-starter-kit.git
cd scms-starter-kit

# Add upstream
git remote add upstream https://github.com/AIalchemistART/scms-starter-kit.git
```

---

### Step 2: Create Branch

```bash
git checkout -b feature/your-feature-name
# or
git checkout -b fix/your-bug-fix
```

**Branch naming**:
- `feature/` - New features or enhancements
- `fix/` - Bug fixes
- `docs/` - Documentation changes
- `refactor/` - Code improvements

---

### Step 3: Make Changes

**Follow these guidelines**:

#### Documentation

- Use clear, concise language
- Include code examples
- Add visual diagrams where helpful
- Test all commands/examples
- Keep consistent formatting

#### Code/Scripts

- Comment thoroughly
- Follow existing code style
- Include usage examples
- Test on multiple platforms (if applicable)
- Update README if needed

#### Templates

- Maintain consistent structure
- Include helpful comments
- Provide clear instructions
- Test usability

---

### Step 4: Test Your Changes

**Before submitting**:

- [ ] All links work (no 404s)
- [ ] Code examples run successfully
- [ ] Scripts tested on target platforms
- [ ] Documentation renders correctly
- [ ] No typos or grammar issues

---

### Step 5: Commit

**Use clear commit messages**:

```bash
git add .
git commit -m "feat: Add support for VS Code with Copilot"
# or
git commit -m "docs: Improve Windsurf setup instructions"
# or
git commit -m "fix: Correct template path in setup script"
```

**Commit message format**:
- `feat:` New feature
- `fix:` Bug fix
- `docs:` Documentation
- `style:` Formatting, no code change
- `refactor:` Code restructuring
- `test:` Adding tests
- `chore:` Maintenance

---

### Step 6: Push & Create PR

```bash
git push origin feature/your-feature-name
```

**On GitHub**:
1. Go to your fork
2. Click "New Pull Request"
3. Fill in description:
   - What changes you made
   - Why they're needed
   - Any breaking changes
   - Screenshots (if UI changes)

**PR Title**: Clear and descriptive
- ✅ "Add PostgreSQL setup guide to examples"
- ✅ "Fix broken link in Cursor setup"
- ❌ "Update stuff"
- ❌ "Changes"

---

## Contribution Guidelines

### Documentation Style

**Use markdown features**:
- Headers for structure
- Code blocks with language tags
- Lists for steps/options
- Bold/italic for emphasis
- Links for references

**Example**:
```markdown
## Step 1: Install Dependencies

**Prerequisites**:
- Node.js ≥ 16
- Git

**Install**:
```bash
npm install
```

**Verify**:
```bash
npm test
```
```

---

### Code Style

**Scripts** (JavaScript/Bash/PowerShell):
- Clear variable names
- Comments explaining why, not what
- Error handling
- Help/usage messages
- Exit codes

**Example**:
```javascript
// Good
function createMemory(patternName) {
  if (!patternName) {
    console.error('Error: Pattern name required');
    process.exit(1);
  }
  
  // Convert to kebab-case for filename
  const filename = patternName.toLowerCase().replace(/\s+/g, '-');
  // ... implementation
}

// Bad
function cm(n) {
  let f = n.toLowerCase().replace(/\s+/g, '-');
  // ...
}
```

---

### Templates

**Keep consistent structure**:
- Use placeholders: `[Your Project Name]`, `YYYY-MM-DD`
- Include instructions section
- Provide examples
- Mark optional vs required sections

---

### Examples

**When sharing examples**:

**DO** ✅:
- Sanitize sensitive information
- Use generic names (not company-specific)
- Include context (what problem it solved)
- Show metrics/results if available
- Explain lessons learned

**DON'T** ❌:
- Share proprietary code
- Include real customer data
- Use internal tooling names
- Expose security patterns
- Share without permission

---

## Review Process

### What Reviewers Look For

1. **Quality**: Is it well-written and clear?
2. **Accuracy**: Are examples correct and tested?
3. **Consistency**: Does it match existing style?
4. **Completeness**: Is anything missing?
5. **Value**: Does it help users?

### Response Time

- **Small fixes**: Usually reviewed within 2-3 days
- **Larger features**: May take 5-7 days
- **Complex changes**: Might require discussion

### Feedback

**If changes requested**:
1. Make requested changes
2. Push to same branch
3. PR updates automatically
4. Reply to review comments

---

## Recognition

**Contributors will be**:
- Added to CONTRIBUTORS.md
- Mentioned in release notes
- Credited in documentation
- Listed as co-authors (for significant contributions)

---

## Code of Conduct

### Our Standards

**Positive environment**:
- Be respectful and inclusive
- Welcome newcomers
- Give constructive feedback
- Accept criticism gracefully
- Focus on what's best for community

**Unacceptable**:
- Harassment or discrimination
- Trolling or insulting comments
- Personal or political attacks
- Publishing others' private information

### Reporting

**If you experience or witness unacceptable behavior**:
- Email: [maintainer email]
- All reports reviewed confidentially
- Appropriate action will be taken

---

## Questions?

**Need help?**
- Check [documentation](docs/)
- Search [existing issues](https://github.com/AIalchemistART/scms-starter-kit/issues)
- Join [discussions](https://github.com/AIalchemistART/scms-starter-kit/discussions)
- Open a new issue with `question` label

---

## License

By contributing, you agree that your contributions will be licensed under:
- **Code**: MIT License
- **Documentation**: CC-BY 4.0

See [LICENSE](LICENSE) for details.

---

## Development Setup

### Prerequisites

- Git
- Node.js (for scripts, optional)
- Your preferred IDE
- AI assistant (for testing)

### Setup

```bash
# Clone
git clone https://github.com/YOUR_USERNAME/scms-starter-kit.git
cd scms-starter-kit

# Test setup script
./scripts/setup.sh  # Unix/Mac
.\scripts\setup.ps1  # Windows

# Make changes
# Test thoroughly
# Submit PR
```

---

## Thank You!

Every contribution, no matter how small, helps make SCMS better for everyone. We appreciate your time and effort! 🙏

**Happy Contributing!** 🚀
