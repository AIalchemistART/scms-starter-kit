# SCMS Economic Validation Test Prompts

**Purpose:** 50 realistic development prompts for comparing baseline vs SCMS-activated performance

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
   mkdir baseline-test
   mkdir scms-test
   ```

2. **Baseline folder:** Empty project or minimal setup
3. **SCMS folder:** Run SCMS setup script
4. **Both:** Start economic dashboard tracking

### **Execution:**

1. Run prompts in **order** (they build on each other)
2. Track token usage for each prompt
3. Note any rework/corrections needed
4. Export data after each session
5. Compare results at end

### **Analysis:**

- **Token Efficiency:** SCMS should use 30-50% fewer tokens
- **Pattern Reuse:** SCMS should cite patterns 30-50% of time
- **Rework Rate:** SCMS should require fewer corrections
- **Time:** SCMS should be faster after initial patterns established

---

## 🎯 Test Prompt Categories

- **Initial Features (1-10):** Fresh implementations
- **Related Features (11-20):** Similar patterns emerge
- **Refactoring (21-30):** Pattern consolidation opportunities
- **Bug Fixes (31-40):** Pattern debugging
- **Advanced Features (41-50):** Complex pattern combinations

---

## 📝 The 50 Test Prompts

### **Category 1: Initial Features (Building Foundation)**

#### **Prompt 1: User Authentication**
```
Create a user authentication system with:
- User registration (email + password)
- Login with JWT tokens
- Password hashing with bcrypt
- Input validation
- Error handling for duplicate emails
```

#### **Prompt 2: Database Setup**
```
Set up a database connection and schema for:
- Users table (id, email, password_hash, created_at)
- Connection pooling
- Migration system
- Environment-based configuration
- Error handling for connection failures
```

#### **Prompt 3: API Endpoints**
```
Create REST API endpoints for:
- POST /api/auth/register
- POST /api/auth/login
- GET /api/auth/profile (authenticated)
- Proper HTTP status codes
- Request/response validation
```

#### **Prompt 4: Logging System**
```
Implement a logging system with:
- Different log levels (debug, info, warn, error)
- File rotation
- Structured log format (JSON)
- Request ID tracking
- Sensitive data masking
```

#### **Prompt 5: Error Handling Middleware**
```
Create centralized error handling:
- Custom error classes
- Express error middleware
- Consistent error response format
- Error logging integration
- Development vs production error messages
```

#### **Prompt 6: Input Validation**
```
Add comprehensive input validation for:
- Email format validation
- Password strength requirements
- Request body sanitization
- SQL injection prevention
- XSS protection
```

#### **Prompt 7: Rate Limiting**
```
Implement rate limiting to prevent abuse:
- Limit login attempts (5 per 15 minutes)
- API endpoint rate limits
- IP-based tracking
- Redis-backed storage (or memory for testing)
- Clear error messages when limited
```

#### **Prompt 8: Email Service**
```
Create email service for:
- Welcome emails on registration
- Password reset emails
- Email templates (HTML + plain text)
- SMTP configuration
- Queue system for async sending
```

#### **Prompt 9: Password Reset Flow**
```
Implement password reset functionality:
- Generate secure reset tokens
- Email reset link
- Token expiration (1 hour)
- Validate token and update password
- Prevent token reuse
```

#### **Prompt 10: User Profile Management**
```
Add user profile features:
- GET /api/profile (view own profile)
- PUT /api/profile (update name, bio)
- Profile picture upload
- Input validation
- Authorization checks
```

---

### **Category 2: Related Features (Pattern Reuse Opportunities)**

#### **Prompt 11: Admin Authentication**
```
Add admin user functionality:
- Admin flag in users table
- Admin-only login endpoint
- Role-based middleware
- Admin dashboard access
- Audit logging for admin actions
```

#### **Prompt 12: Blog Post CRUD**
```
Create blog post management:
- Create, read, update, delete posts
- Author association (foreign key to users)
- Published/draft status
- Slug generation from titles
- Markdown support
```

#### **Prompt 13: Comment System**
```
Add comments to blog posts:
- Create/read/delete comments
- Nested replies (one level)
- Author association
- Spam detection (basic keyword filtering)
- Moderation flags
```

#### **Prompt 14: Search Functionality**
```
Implement search for blog posts:
- Full-text search in title and content
- Filter by author
- Filter by date range
- Pagination of results
- Relevance sorting
```

#### **Prompt 15: Image Upload Service**
```
Create image upload system:
- File type validation (jpg, png, gif)
- Size limits (5MB max)
- S3 or local storage
- Thumbnail generation
- Secure filename handling
```

#### **Prompt 16: Category System**
```
Add categories to blog posts:
- Categories table
- Many-to-many relationship with posts
- CRUD operations for categories
- Filter posts by category
- Category usage counts
```

#### **Prompt 17: Like/Favorite System**
```
Implement post favoriting:
- User can like/unlike posts
- Like count on posts
- User's favorite posts list
- Prevent duplicate likes
- Unlike functionality
```

#### **Prompt 18: Notification System**
```
Create notification system:
- Notify on new comments
- Notify on post likes
- Mark as read/unread
- List user notifications
- Push to database queue
```

#### **Prompt 19: API Pagination**
```
Add pagination to all list endpoints:
- Page and limit query parameters
- Total count in response
- Next/previous page links
- Consistent pagination format
- Default values (page=1, limit=10)
```

#### **Prompt 20: API Filtering**
```
Implement advanced filtering:
- Filter posts by multiple criteria
- Sort by different fields
- Combine filters with AND/OR logic
- Validate filter parameters
- Optimize database queries
```

---

### **Category 3: Refactoring (Pattern Consolidation)**

#### **Prompt 21: Extract Validation Helpers**
```
Refactor validation code:
- Create reusable validation functions
- Centralize common patterns
- Use validator middleware
- Reduce code duplication
- Maintain backward compatibility
```

#### **Prompt 22: Database Query Builder**
```
Create a query builder utility:
- Abstract common query patterns
- Support filtering, sorting, pagination
- Type-safe query construction
- Prevent SQL injection
- Reuse across all models
```

#### **Prompt 23: Standardize Error Responses**
```
Refactor all error handling to use:
- Consistent error object shape
- HTTP status code mapping
- Error code constants
- Validation error formatting
- Update all endpoints
```

#### **Prompt 24: Extract Auth Logic**
```
Consolidate authentication code:
- Create auth service class
- Token generation/validation helpers
- Password hashing utilities
- Centralize JWT configuration
- Remove duplicate code
```

#### **Prompt 25: Service Layer Pattern**
```
Introduce service layer:
- Separate business logic from routes
- Create service classes for each resource
- Move database calls to services
- Improve testability
- Maintain single responsibility
```

#### **Prompt 26: Repository Pattern**
```
Implement repository pattern:
- Abstract database operations
- Create repositories for each model
- Standardize CRUD operations
- Support transaction handling
- Easier to swap databases
```

#### **Prompt 27: DTO Pattern**
```
Add Data Transfer Objects:
- Define request/response shapes
- Validation in DTOs
- Transform database models to DTOs
- Hide sensitive fields
- Versioning support
```

#### **Prompt 28: Config Management**
```
Centralize configuration:
- Environment variable validation
- Type-safe config object
- Default values
- Config documentation
- Fail fast on missing required config
```

#### **Prompt 29: Test Utilities**
```
Create testing helpers:
- Mock user factory
- Database seeding utilities
- API test helpers
- Common assertions
- Cleanup utilities
```

#### **Prompt 30: API Documentation**
```
Add comprehensive API docs:
- OpenAPI/Swagger specification
- Endpoint descriptions
- Request/response examples
- Error code documentation
- Interactive API explorer
```

---

### **Category 4: Bug Fixes (Pattern Debugging)**

#### **Prompt 31: Fix Race Condition**
```
There's a race condition in the like system where users can like a post
multiple times if they click rapidly. Fix this with proper database
constraints and optimistic locking.
```

#### **Prompt 32: Memory Leak in Email Queue**
```
The email queue is growing indefinitely and causing memory issues.
Implement proper cleanup of processed jobs and add monitoring to
detect queue buildup.
```

#### **Prompt 33: SQL Injection Vulnerability**
```
Security audit found SQL injection risk in the search endpoint.
Refactor to use parameterized queries and validate all user input
properly. Add tests to prevent regression.
```

#### **Prompt 34: JWT Token Expiry Issue**
```
Users are getting logged out unexpectedly. Debug the JWT token
expiry logic, implement refresh tokens, and add proper client-side
token renewal before expiry.
```

#### **Prompt 35: Pagination Edge Cases**
```
Pagination breaks when there are exactly N items (where N is the
page size). Fix off-by-one errors and add tests for edge cases:
empty results, single page, exact multiple of page size.
```

#### **Prompt 36: File Upload Size Limit**
```
Large file uploads are timing out. Implement chunked uploads,
add progress tracking, properly handle upload interruptions,
and add resume capability.
```

#### **Prompt 37: Cascading Delete Issue**
```
Deleting a user leaves orphaned posts and comments. Implement
proper cascading deletes or set to null strategies. Add soft
delete option for audit trail.
```

#### **Prompt 38: N+1 Query Problem**
```
Loading a list of posts with authors is very slow. Fix the N+1
query issue using proper joins/eager loading. Add query
performance monitoring.
```

#### **Prompt 39: CORS Configuration**
```
Frontend can't access API from localhost:3000. Configure CORS
properly for development and production, whitelist allowed
origins, handle preflight requests.
```

#### **Prompt 40: Timezone Handling**
```
Created_at timestamps are displaying in different timezones.
Standardize all dates to UTC in database, add timezone support
to API responses, document expected formats.
```

---

### **Category 5: Advanced Features (Complex Pattern Combinations)**

#### **Prompt 41: Real-time Notifications**
```
Add WebSocket support for real-time notifications:
- WebSocket server setup
- Authentication over WebSocket
- Broadcast notifications to connected users
- Reconnection handling
- Fallback to polling for unsupported clients
```

#### **Prompt 42: Full-Text Search with Elasticsearch**
```
Integrate Elasticsearch for advanced search:
- Index blog posts and comments
- Support fuzzy matching
- Faceted search (filter by multiple criteria)
- Search suggestions/autocomplete
- Sync database changes to index
```

#### **Prompt 43: Caching Layer**
```
Implement Redis caching:
- Cache frequently accessed posts
- Cache user profiles
- Cache-aside pattern
- TTL configuration
- Cache invalidation on updates
```

#### **Prompt 44: Analytics Tracking**
```
Add analytics for blog posts:
- Track view counts
- Track unique visitors
- Track read time
- Popular posts dashboard
- Time-series data storage
```

#### **Prompt 45: GraphQL API**
```
Add GraphQL endpoint alongside REST:
- Schema definition for all types
- Resolvers for queries and mutations
- Authentication/authorization
- DataLoader for N+1 prevention
- GraphQL playground
```

#### **Prompt 46: Multi-tenant Architecture**
```
Convert to multi-tenant system:
- Tenant isolation in database
- Tenant detection from subdomain/header
- Tenant-scoped queries
- Separate file storage per tenant
- Admin tenant management
```

#### **Prompt 47: Export/Import System**
```
Add data export and import:
- Export user data to JSON/CSV
- Import bulk users from CSV
- Validation during import
- Progress tracking for large imports
- Error handling and rollback
```

#### **Prompt 48: Automated Backups**
```
Implement automated backup system:
- Scheduled database backups
- File storage backups
- Backup rotation (keep last 7 days)
- Backup to S3/cloud storage
- Restore functionality and testing
```

#### **Prompt 49: API Versioning**
```
Implement API versioning strategy:
- Version in URL path (/v1/, /v2/)
- Support multiple versions simultaneously
- Deprecation warnings
- Migration guide for clients
- Version-specific documentation
```

#### **Prompt 50: Performance Monitoring**
```
Add comprehensive monitoring:
- Request/response time tracking
- Database query performance
- Error rate monitoring
- Custom business metrics
- Integration with monitoring service (Datadog/New Relic)
- Alerting for critical issues
```

---

## 📊 Expected Pattern Emergence

### **Patterns That Should Emerge:**

1. **CRUD Operations** (prompts 1-3, 12, 16)
   - Should be abstracted after 3rd use
   - Database operations standardized
   - Validation patterns reused

2. **Authentication/Authorization** (prompts 1, 9, 11, 41)
   - JWT handling consolidated
   - Middleware reused
   - Token patterns standardized

3. **Error Handling** (prompts 5, 23, 31-40)
   - Custom error classes
   - Consistent response format
   - Logging integration

4. **Input Validation** (prompts 6, 21, 27)
   - Validation helpers
   - Sanitization patterns
   - Error message format

5. **Database Queries** (prompts 2, 22, 26, 38)
   - Query builder pattern
   - Connection pooling
   - Transaction handling

6. **API Patterns** (prompts 3, 19, 20, 30)
   - Pagination
   - Filtering
   - Sorting
   - Response formatting

7. **File Operations** (prompts 15, 36, 48)
   - Upload handling
   - Storage abstraction
   - Validation patterns

8. **Testing Patterns** (prompts 29, 35)
   - Mock factories
   - Test utilities
   - Assertion helpers

### **SCMS Benefits Timeline:**

- **Prompts 1-10:** SCMS overhead (creating patterns)
- **Prompts 11-20:** SCMS starts showing value (pattern reuse)
- **Prompts 21-30:** SCMS major advantage (refactoring guided by patterns)
- **Prompts 31-40:** SCMS debugging advantage (pattern-based fixes)
- **Prompts 41-50:** SCMS compound value (complex pattern combinations)

**Expected crossover point:** Around prompt 15-20 where SCMS efficiency surpasses baseline

---

## 📈 Tracking Sheet Template

Use this to track results:

| Prompt # | Task | Baseline Tokens | SCMS Tokens | Savings | Patterns Cited | Rework Needed |
|----------|------|----------------|-------------|---------|----------------|---------------|
| 1 | User Auth | 5,234 | 5,890 | -12% | 0 | None |
| 2 | Database | 3,456 | 3,234 | +6% | 0 | None |
| ... | ... | ... | ... | ... | ... | ... |
| **Total** | | **150,000** | **105,000** | **30%** | **45** | **3 vs 12** |

---

## 🎯 Success Criteria

**SCMS is validated if:**

- ✅ Overall token savings: 25-40%
- ✅ Pattern citation rate: 30-50%
- ✅ Rework reduction: 50%+
- ✅ Time to completion: 20-30% faster (after initial patterns)
- ✅ Code quality: Equal or better
- ✅ Consistency: Higher in SCMS version

---

## 💡 Testing Tips

### **For Baseline:**
- Track all manual repetition of code patterns
- Note how many times you re-explain similar concepts
- Count corrections and iterations

### **For SCMS:**
- Note pattern promotions (L0 → L1)
- Track pattern retrievals
- Observe refactoring suggestions based on patterns
- Monitor when AI cites existing patterns

### **Documentation:**
- Keep session notes for both
- Export dashboard data after each session
- Screenshot key metrics
- Note qualitative observations

---

## 🚀 Quick Start

```bash
# Baseline test
mkdir baseline-test && cd baseline-test
# Start dashboard tracking
# Run prompts 1-50, track tokens

# SCMS test  
mkdir scms-test && cd scms-test
git clone https://github.com/AIalchemistART/scms-starter-kit.git docs/scms
cd docs/scms && npm install && npm run dashboard:app
# Start SCMS session
# Run same prompts 1-50, track tokens

# Compare results!
```

---

## 📚 Related Documentation

- **Economic Dashboard:** Track real-time metrics
- **Session Closure:** Analyze pattern validation
- **INDEX.md:** Review pattern emergence
- **WORKSPACE_RULES.md:** See promoted patterns

---

**These 50 prompts provide comprehensive validation of SCMS economic benefits in a realistic development scenario!** 🎯
