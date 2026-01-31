# Security Policy

## Reporting a Vulnerability

If you discover a security vulnerability in the SCMS Starter Kit, please report it responsibly:

**📧 Email:** manny@aialchemist.net

**Please include:**
- Description of the vulnerability
- Steps to reproduce
- Potential impact assessment
- Suggested fix (if any)

**⚠️ Please DO NOT:**
- Open a public GitHub issue for security vulnerabilities
- Disclose the vulnerability publicly before we've addressed it

## Response Timeline

- **Initial Response:** Within 48 hours
- **Assessment:** Within 1 week
- **Fix Timeline:** Depends on severity (critical issues prioritized)
- **Disclosure:** After fix is deployed and users have time to update

## Security Model

### SCMS Architecture: Local-First & Bring Your Own Data

SCMS is designed with security and privacy as core principles:

**✅ No Shared Secrets**
- Users supply their own AI API keys
- No central authentication required
- No shared credentials to compromise

**✅ Local-First Data Storage**
- All user data stored on local filesystem
- No cloud storage or databases
- No telemetry or tracking

**✅ Transparent & Auditable**
- Open source codebase
- No obfuscated code
- All dependencies visible

**✅ Zero Trust Model**
- No network dependencies for core functionality
- No external API calls from scripts
- Dashboard reads local files only

### What SCMS Does NOT Collect

❌ No personal information  
❌ No usage analytics  
❌ No telemetry data  
❌ No AI prompts or responses  
❌ No API keys or credentials  
❌ No user behavior tracking  

### User Data Protection

**Protected via .gitignore:**
- API keys (`.env.local`)
- User tracking data (`economics-dashboard-data.json`)
- Session histories (`checkpoints/`, `scms-sessions/`)
- Custom configurations (`WORKSPACE_RULES.custom.md`)
- Backup files (`*.backup.json`)

**Users are responsible for:**
- Securing their own AI API keys
- Managing file permissions on their system
- Not committing sensitive data to their own repositories
- Following security best practices in their IDE

## Best Practices for Users

### 1. API Key Management

**✅ DO:**
- Store API keys in `.env.local` (excluded from git)
- Use environment variables for sensitive data
- Rotate keys regularly
- Use separate keys for development/production

**❌ DON'T:**
- Hardcode API keys in any files
- Commit `.env.local` to version control
- Share API keys in documentation or comments
- Use production keys for testing

### 2. Custom Workspace Rules

When creating custom workspace rules:
- Use `WORKSPACE_RULES.custom.md` (excluded from git)
- Avoid including sensitive project details
- Don't store credentials in rules files
- Review before committing to ensure no secrets

### 3. Tracking Data

The economics dashboard creates `economics-dashboard-data.json`:
- This file is excluded from git
- Contains token usage and session data
- Safe to share if you want to show SCMS effectiveness
- Delete anytime to reset tracking

### 4. Session Logs

If using checkpoint monitoring:
- `checkpoints/` directory is excluded from git
- Contains AI conversation summaries
- May include project-specific context
- Treat as private unless you explicitly want to share

## Security Features

### Git Protection

Enhanced `.gitignore` patterns protect:
- API keys and certificates (`.pem`, `.key`, `.cert`)
- Environment files (`.env*.local`)
- Database files (`.db`, `.sqlite`)
- Secrets and credentials (`secrets.json`, `credentials.json`)
- Temporary files and logs

### Dependency Security

**Dependencies are minimal:**
- `got` - HTTP client (for checkpoint monitoring only)
- `cheerio` - HTML parsing (for dashboard only)
- Standard Node.js modules

**Security monitoring:**
- Enable Dependabot alerts on GitHub
- Review dependency updates carefully
- Keep dependencies up to date

### Code Security

**Safe practices:**
- No `eval()` or dynamic code execution
- No shell command injection vectors
- File system access is read-only except for user data directories
- No external network calls except explicit checkpoint monitoring

## Vulnerability Disclosure Policy

When a security vulnerability is reported and confirmed:

1. **Acknowledgment:** We'll confirm receipt within 48 hours
2. **Assessment:** We'll evaluate severity and impact
3. **Fix Development:** We'll develop and test a fix
4. **Notification:** We'll notify the reporter before public disclosure
5. **Release:** We'll release a patched version
6. **Disclosure:** We'll publish a security advisory after users have time to update

**Severity Levels:**
- **Critical:** Immediate attention, patch within 24-48 hours
- **High:** Patch within 1 week
- **Medium:** Patch within 2-4 weeks
- **Low:** Patch in next regular release

## Responsible Use Guidelines

SCMS is a tool for improving AI-assisted development workflows. Users should:

**✅ Ethical Use:**
- Respect intellectual property when storing patterns
- Follow your organization's data policies
- Don't store proprietary code in public repositories
- Comply with your AI provider's terms of service

**✅ Privacy:**
- Don't store personally identifiable information in SCMS files
- Don't commit client or customer data
- Treat your workspace rules as private documentation

**✅ Legal Compliance:**
- Comply with applicable laws and regulations
- Respect software licenses when documenting patterns
- Follow your employment agreements regarding code ownership

## Security Updates

**Stay informed:**
- Watch this repository for security advisories
- Check the CHANGELOG for security-related updates
- Subscribe to release notifications

**Apply updates promptly:**
```bash
cd scms-starter-kit
git pull origin master
npm install
```

## Questions or Concerns?

If you have security questions that aren't vulnerabilities:
- Open a GitHub Discussion
- Email: manny@aialchemist.net
- Check existing documentation

For vulnerabilities, always use private email reporting.

---

**Last Updated:** January 30, 2026  
**Version:** 1.0  
