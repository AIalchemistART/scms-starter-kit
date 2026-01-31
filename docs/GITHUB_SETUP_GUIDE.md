# GitHub Repository Setup Guide

**Repository:** github.com/AIalchemistART/scms-starter-kit  
**Purpose:** Configure security features, branch protection, and community settings  

---

## 📋 Table of Contents

1. [Branch Protection Rules](#branch-protection-rules)
2. [Security Features](#security-features)
3. [Repository Topics](#repository-topics)
4. [GitHub Sponsors Setup](#github-sponsors-setup)
5. [Social Preview Image](#social-preview-image)
6. [Creating Releases](#creating-releases)
7. [Post-Launch Checklist](#post-launch-checklist)

---

## 🛡️ Branch Protection Rules

### Why Branch Protection?

Branch protection prevents:
- Accidental direct pushes to `master`
- Force pushes that rewrite history
- Merging without code review
- Unreviewed security vulnerabilities

### Step-by-Step Setup

1. **Navigate to Branch Settings**
   - Go to: https://github.com/AIalchemistART/scms-starter-kit
   - Click `Settings` (top right)
   - Click `Branches` (left sidebar, under "Code and automation")

2. **Create New Branch Protection Rule**
   - Click `Add branch protection rule` (or `Add rule`)
   - **Branch name pattern:** `master`

3. **Configure Protection Settings**

   **✅ Protect matching branches:**
   - ☑️ **Require a pull request before merging**
     - Required approvals: `1`
     - ☑️ Dismiss stale pull request approvals when new commits are pushed
     - ☑️ Require review from Code Owners (optional - need CODEOWNERS file)
   
   **✅ Require status checks:**
   - ☑️ Require status checks to pass before merging
     - ☑️ Require branches to be up to date before merging
     - *Note: Add specific checks once you have CI/CD*
   
   **✅ Conversation resolution:**
   - ☑️ Require conversation resolution before merging
   
   **✅ Commit signing:**
   - ⬜ Require signed commits (optional - requires GPG setup)
   
   **✅ Linear history:**
   - ☑️ Require linear history
     - Enforces squash/rebase merges (no merge commits)
   
   **✅ Force push protection:**
   - ☑️ Do not allow bypassing the above settings
   - ⬜ Allow force pushes (leave UNCHECKED)
   - ⬜ Allow deletions (leave UNCHECKED)

4. **Bypass Settings (Important for Solo Development)**
   
   **Option A: Include administrators**
   - ☑️ Include administrators
   - This lets you bypass rules when needed (emergency fixes)
   
   **Option B: Add bypass list**
   - Click "Add bypass" → Select "Repository admin"
   - Allows emergency access while keeping protections active

5. **Save Changes**
   - Scroll to bottom
   - Click `Create` (or `Save changes`)

### What This Protects Against

✅ **Accidental direct commits** - Forces PR workflow  
✅ **Unreviewed changes** - Requires approval  
✅ **Broken code** - Can add CI checks  
✅ **Force push disasters** - History protected  
✅ **Merge commit clutter** - Linear history enforced  

---

## 🔒 Security Features

### Enable Security Features

1. **Navigate to Security Settings**
   - Settings → Security (left sidebar)
   - Click "Code security and analysis"

2. **Enable All Features**

   **✅ Dependency graph**
   - Status: Usually enabled by default
   - Shows project dependencies
   - Required for other features
   - Click `Enable` if not active

   **✅ Dependabot alerts**
   - Notifies you of vulnerable dependencies
   - Click `Enable` if not active
   - Highly recommended for Node.js projects

   **✅ Dependabot security updates**
   - Automatically creates PRs to fix vulnerabilities
   - Click `Enable` if not active
   - Review PRs carefully before merging

   **✅ Dependabot version updates (optional)**
   - Creates PRs for dependency updates
   - Requires `.github/dependabot.yml` config
   - Optional but useful

   **✅ Secret scanning**
   - GitHub Advanced Security feature
   - Detects accidentally committed secrets
   - Free for public repositories
   - Click `Enable` if available

   **✅ Code scanning (optional)**
   - Static analysis for security issues
   - Requires CI/CD setup
   - Can add later with GitHub Actions

### Configure Security Advisories

1. **Navigate to Security → Advisories**
2. **Enable private vulnerability reporting**
   - Allows security researchers to report issues privately
   - You'll be notified via email

### Security Policy

✅ **SECURITY.md created** - Located at repository root  
✅ **Vulnerability reporting process** - Email: manny@aialchemist.net  
✅ **Response timeline defined** - 48 hours initial response  

---

## 🏷️ Repository Topics

### Why Topics Matter

Topics help users discover your repository:
- Appear in GitHub search
- Connect to related projects
- Improve SEO
- Show in GitHub Explore

### How to Add Topics

1. **Navigate to Repository Main Page**
   - Go to: https://github.com/AIalchemistART/scms-starter-kit

2. **Find the "About" Section**
   - Top right of repository page
   - Click the ⚙️ **gear icon** next to "About"

3. **Add Topics**
   
   **Core Topics (Recommended):**
   - `ai`
   - `machine-learning`
   - `memory-architecture`
   - `continual-learning`
   - `developer-tools`
   - `productivity`
   
   **IDE/Tool Topics:**
   - `windsurf`
   - `cursor`
   - `vscode`
   - `prompt-engineering`
   
   **Technical Topics:**
   - `nodejs`
   - `javascript`
   - `typescript`
   - `electron`
   
   **License/Community:**
   - `mit-license`
   - `opensource`
   - `open-source`

4. **Add Description (Optional)**
   - Short description: "Sparse Contextual Memory Scaffolding - A validated system for continual learning in AI-assisted development"
   - Website: `https://github.com/AIalchemistART/scms-starter-kit` (or custom domain if you have one)

5. **Save Changes**
   - Click `Save changes`

### Finding Good Topics

- Look at similar projects
- Check what topics are popular in your domain
- Use specific technical terms
- Maximum 20 topics allowed

---

## 💚 GitHub Sponsors Setup

### Prerequisites

- Personal GitHub account (not organization - sponsors work on personal accounts)
- Stripe or PayPal account for receiving payments
- Must agree to GitHub Sponsors terms

### Setup Steps

1. **Go to GitHub Sponsors Page**
   - Visit: https://github.com/sponsors
   - Or: Your profile → Sponsor (if available)

2. **Click "Set up GitHub Sponsors"**

3. **Choose Account Type**
   - Select "Individual" (for personal open source work)

4. **Complete Profile**
   - **Bio:** Explain your open source work
   - **Funding goal:** Optional (can skip)
   - **Custom button:** Add custom funding links

5. **Set Up Tiers**

   **Recommended Tier Structure:**
   
   **☕ Supporter - $5/month**
   - "Help keep SCMS development active"
   - Benefits: Sponsor badge, my gratitude
   
   **🚀 Contributor - $25/month**
   - "Accelerate SCMS feature development"
   - Benefits: Sponsor badge, priority for feature requests
   
   **💎 Champion - $100/month**
   - "Become a key SCMS supporter"
   - Benefits: All above + acknowledgment in README (optional)
   
   **🏢 Enterprise - $500/month**
   - "Enterprise support and consulting"
   - Benefits: All above + consulting hours, custom integration support

6. **Connect Payment Methods**
   - Stripe (recommended for international)
   - PayPal (alternative)
   - Bank account details

7. **Set Matching Preferences**
   - GitHub will match some sponsorships (check current program)

8. **Publish Profile**
   - Review everything
   - Click "Publish"

### Already Have FUNDING.yml?

Check `C:\Games\Projects\scms-starter-kit-github\.github\FUNDING.yml`:

```yaml
# Existing funding links (if you have them)
github: [AIalchemistART]
ko_fi: aialchemistart
custom: ["https://paypal.me/aialchemistart"]
```

If this file exists, GitHub will show a 💚 **Sponsor** button automatically!

---

## 🖼️ Social Preview Image

### Why a Social Preview?

When shared on social media or linked in articles:
- Shows professional image preview
- Increases click-through rate
- Improves brand recognition

### Create Preview Image

**Recommended Specs:**
- Size: 1280 × 640 pixels
- Format: PNG or JPG
- Content: Project logo + tagline
- Text: Large and readable

**Example Content:**
```
SCMS
Sparse Contextual Memory Scaffolding
91% Time Savings | 94% Retention | MIT Licensed
```

### Upload Preview

1. **Navigate to Repository Settings**
   - Settings → General (already there)

2. **Scroll to "Social preview"**
   - Under "General" section
   - Click "Edit"

3. **Upload Image**
   - Click "Upload an image"
   - Select your 1280×640 image
   - Preview shows how it looks

4. **Save**

### Tools for Creating Preview

- **Canva** (free templates)
- **Figma** (design from scratch)
- **Photoshop/GIMP** (advanced)
- **Remove.bg** (remove backgrounds)

---

## 🎉 Creating Releases

### Why Create Releases?

- Tags stable versions
- Provides download snapshots
- Communicates changes to users
- Improves professional appearance

### Create Your First Release

1. **Navigate to Releases**
   - Repository main page → Click "Releases" (right sidebar)
   - Or go to: `https://github.com/AIalchemistART/scms-starter-kit/releases`

2. **Click "Draft a new release"**

3. **Create Release Tag**
   - Click "Choose a tag"
   - Type: `v1.0.0` (semantic versioning)
   - Click "Create new tag: v1.0.0 on publish"

4. **Release Title**
   - `SCMS Starter Kit v1.0.0 - Initial Public Release`

5. **Release Description**

   **Template:**
   ```markdown
   # SCMS Starter Kit v1.0.0
   
   🎉 **Initial Public Release** - MIT Licensed Open Source
   
   ## What is SCMS?
   
   Sparse Contextual Memory Scaffolding transforms AI memory from passive storage into active validation infrastructure.
   
   ## Validated Results
   - ✅ 91% reduction in pattern re-discovery time
   - ✅ 94% knowledge retention rate
   - ✅ 96% time reduction in stale-context scenarios
   - ✅ Zero documentation debt after stabilization
   
   ## What's Included
   
   - Complete SCMS workflow documentation
   - Economic tracking dashboard
   - Session closure automation
   - Example workspace rules
   - Research whitepapers
   
   ## Getting Started
   
   See [SETUP.md](https://github.com/AIalchemistART/scms-starter-kit/blob/master/SETUP.md) for installation instructions.
   
   ## Documentation
   
   - [README](https://github.com/AIalchemistART/scms-starter-kit#readme)
   - [Whitepaper (Empirical)](docs/reference/WHITEPAPER.md)
   - [Economic Dashboard Guide](docs/guides/SCMS_ECONOMIC_DASHBOARD.md)
   
   ## Support
   
   - 📧 Email: manny@aialchemist.net
   - 💬 GitHub Discussions
   - 🐛 GitHub Issues
   
   ---
   
   **License:** MIT | **Documentation:** CC-BY 4.0
   ```

6. **Attach Files (Optional)**
   - Pre-built dashboard (if you have one)
   - Starter templates
   - Quick start guide PDF

7. **Publish Release**
   - ☑️ Set as the latest release
   - ⬜ Set as a pre-release (uncheck)
   - Click "Publish release"

### Semantic Versioning

- **v1.0.0** - Major release (breaking changes)
- **v1.1.0** - Minor release (new features)
- **v1.1.1** - Patch release (bug fixes)

---

## ✅ Post-Launch Checklist

### Immediate (Within 24 Hours)

- [ ] ✅ Enable branch protection for `master`
- [ ] ✅ Enable Dependabot alerts
- [ ] ✅ Enable Dependabot security updates
- [ ] ✅ Enable secret scanning (if available)
- [ ] ✅ Add repository topics (10+ recommended)
- [ ] ✅ Verify SECURITY.md is visible
- [ ] ⬜ Create v1.0.0 release (optional but recommended)
- [ ] ⬜ Add social preview image (optional)

### Within 1 Week

- [ ] Monitor GitHub notifications
  - Issues
  - Pull requests
  - Security alerts
  - Discussions (if enabled)

- [ ] Set up GitHub Sponsors (if desired)
  - Complete profile
  - Configure tiers
  - Connect payment methods

- [ ] Enable GitHub Discussions (optional)
  - Settings → General → Features
  - Check "Discussions"
  - Good for community Q&A

- [ ] Add issue templates (optional)
  - `.github/ISSUE_TEMPLATE/bug_report.md`
  - `.github/ISSUE_TEMPLATE/feature_request.md`

- [ ] Add pull request template (optional)
  - `.github/PULL_REQUEST_TEMPLATE.md`

### Ongoing Maintenance

- [ ] **Review pull requests carefully**
  - Check for security issues
  - Verify tests pass (when added)
  - Maintain code quality

- [ ] **Respond to issues promptly**
  - Security issues: Within 48 hours
  - Bugs: Within 1 week
  - Features: As time permits

- [ ] **Keep dependencies updated**
  - Review Dependabot PRs
  - Test updates locally
  - Merge when safe

- [ ] **Monitor security advisories**
  - GitHub will email you
  - Check dashboard regularly
  - Act on critical issues immediately

- [ ] **Update documentation**
  - Keep README current
  - Update whitepapers as research progresses
  - Add examples as community requests

---

## 🔧 Troubleshooting

### "I can't find the Topics section"

**Solution:** Look for the "About" section at the top right of your repository page. Click the ⚙️ gear icon to edit.

### "Branch protection is blocking my pushes"

**Solution:** This is working as intended! Create a branch and open a PR instead:
```bash
git checkout -b fix-issue
git add .
git commit -m "Fix issue"
git push origin fix-issue
# Then open PR on GitHub
```

Or if you're in bypass list, you can override (use sparingly).

### "Dependabot is creating too many PRs"

**Solution:** Configure update schedule in `.github/dependabot.yml`:
```yaml
version: 2
updates:
  - package-ecosystem: "npm"
    directory: "/"
    schedule:
      interval: "weekly"  # or "monthly"
```

### "Secret scanning found a false positive"

**Solution:** 
1. If it's not a real secret, close the alert as "False positive"
2. Add pattern to `.github/secret_scanning.yml` to ignore
3. Consider refactoring code to not look like secrets

---

## 📚 Additional Resources

### GitHub Documentation
- [Branch protection rules](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-protected-branches/about-protected-branches)
- [Dependabot](https://docs.github.com/en/code-security/dependabot)
- [Secret scanning](https://docs.github.com/en/code-security/secret-scanning)
- [GitHub Sponsors](https://docs.github.com/en/sponsors)

### Best Practices
- [Open Source Guides](https://opensource.guide/)
- [Semantic Versioning](https://semver.org/)
- [Keep a Changelog](https://keepachangelog.com/)

---

**Last Updated:** January 30, 2026  
**Maintainer:** Matthew "Manny" Walker  
**Contact:** manny@aialchemist.net  
