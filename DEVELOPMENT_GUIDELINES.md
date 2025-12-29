# Backend Development Guidelines

## Overview
This is the Kotlin Spring Boot backend for Grimoire Collective. Follow these guidelines to maintain consistency and quality.

## Technology Stack
- **Language**: Kotlin 1.9.22
- **Framework**: Spring Boot 3.2.1
- **Build Tool**: Gradle 8.5
- **Database**: PostgreSQL with Flyway migrations
- **Java Version**: 17+

## Project Structure
```
backend/
├── src/
│   ├── main/
│   │   ├── kotlin/
│   │   │   └── com/grimoirecollective/
│   │   │       ├── config/          # Configuration classes
│   │   │       ├── controller/      # REST controllers
│   │   │       ├── service/         # Business logic
│   │   │       ├── repository/      # Data access layer
│   │   │       ├── model/           # Domain models
│   │   │       └── dto/             # Data transfer objects
│   │   └── resources/
│   │       ├── application.properties
│   │       └── db/migration/        # Flyway migrations
│   └── test/
├── docs/                            # 📚 All documentation goes here
│   └── README.md                    # Documentation index
├── build.gradle.kts
├── README.md                        # Main entry point
├── DEVELOPMENT_GUIDELINES.md        # This file
└── gradlew
```

### Documentation Standards

**All documentation must be placed in the `docs/` directory.**

- **API documentation**: Place in `docs/` (e.g., API_REFERENCE.md)
- **Architecture docs**: Place in `docs/` (e.g., ARCHITECTURE.md)
- **Setup guides**: Place in `docs/` (e.g., SETUP.md)
- **Testing guides**: Place in `docs/` (e.g., TESTING.md)

**Root-level files** should only include:
- `README.md` - Main entry point and quick start
- `DEVELOPMENT_GUIDELINES.md` - This file
- Configuration files (`build.gradle.kts`, `settings.gradle.kts`, etc.)
- Essential build/run files

**Creating new documentation:**
1. Place the file in `docs/`
2. Add an entry to `docs/README.md` index
3. Link from main `README.md` if appropriate
4. Use consistent markdown formatting
5. Include code examples and API samples

## Core Principles

### DRY (Don't Repeat Yourself)
**All code must follow DRY principles:**
- Extract reusable logic into functions, services, or utilities
- Use inheritance, interfaces, and composition to avoid duplication
- Create base classes or abstract classes for shared behavior
- Leverage Kotlin's extension functions for reusable operations
- If you find yourself copying code, refactor it into a shared component
- Use constants and configuration for repeated values

## Coding Standards

### Kotlin Style
- Use Kotlin idioms (data classes, extension functions, etc.)
- Prefer `val` over `var` for immutability
- Use nullable types explicitly (`?`)
- Leverage Kotlin's null safety features
- Use `when` expressions over multiple if-else

### Naming Conventions
- **Classes**: PascalCase (e.g., `UserController`, `BookService`)
- **Functions**: camelCase (e.g., `findUserById`, `createBook`)
- **Constants**: UPPER_SNAKE_CASE (e.g., `MAX_RETRY_COUNT`)
- **Packages**: lowercase (e.g., `com.grimoirecollective.service`)

### API Design
- Follow RESTful conventions
- Use proper HTTP methods (GET, POST, PUT, DELETE, PATCH)
- Return appropriate HTTP status codes
- Use `/api/` prefix for all API endpoints
- Version APIs when breaking changes occur (`/api/v1/`)

### Database Guidelines
- **Flyway Migrations**:
  - Use versioned migrations: `V{version}__{description}.sql`
  - Never modify existing migrations in production
  - Test migrations in development first
  - Keep migrations small and focused

- **Repository Layer**:
  - Use Spring Data JPA repositories
  - Custom queries should use `@Query` annotation
  - Prefer named queries over native SQL when possible

### Error Handling
- Use proper exception handling with `@ControllerAdvice`
- Return meaningful error messages
- Log errors appropriately (use SLF4J)
- Never expose stack traces to clients in production

### Security
- Use Spring Security for authentication/authorization
- Never store sensitive data in plain text
- Use environment variables for configuration
- Validate all input data
- Use parameterized queries to prevent SQL injection

## Testing
- Write unit tests for services
- Write integration tests for controllers
- Aim for >80% code coverage
- Use MockK for mocking in Kotlin
- Test file naming: `{ClassName}Test.kt`

## Building and Running

### Local Development
```bash
./gradlew bootRun
```

### Build
```bash
./gradlew build
```

### Run Tests
```bash
./gradlew test
```

## Git Workflow
- Branch naming: `feature/{feature-name}`, `bugfix/{bug-name}`
- Commit messages: Use conventional commits format
- Always run tests before committing
- Keep commits atomic and focused

## Environment Variables
Required environment variables (set in `.env` or system):
- `DATABASE_URL` - PostgreSQL connection string
- `DATABASE_USERNAME` - Database user
- `DATABASE_PASSWORD` - Database password
- `JWT_SECRET` - Secret for JWT token signing (if implementing auth)

## Code Review Checklist
- [ ] Code follows Kotlin conventions
- [ ] All tests pass
- [ ] No sensitive data in code
- [ ] API endpoints are properly documented
- [ ] Error handling is implemented
- [ ] Database migrations are tested
- [ ] Dependencies are up to date and secure

## Common Patterns

### Controller Example
```kotlin
@RestController
@RequestMapping("/api/users")
class UserController(private val userService: UserService) {
    
    @GetMapping("/{id}")
    fun getUserById(@PathVariable id: Long): ResponseEntity<UserDto> {
        return userService.findById(id)
            ?.let { ResponseEntity.ok(it) }
            ?: ResponseEntity.notFound().build()
    }
}
```

### Service Example
```kotlin
@Service
class UserService(private val userRepository: UserRepository) {
    
    fun findById(id: Long): UserDto? {
        return userRepository.findById(id)
            .map { it.toDto() }
            .orElse(null)
    }
}
```

## Performance Considerations
- Use pagination for list endpoints
- Implement caching where appropriate
- Optimize database queries (avoid N+1 problems)
- Use async operations for long-running tasks

## Documentation
- Document all public APIs with KDoc
- Keep README.md updated
- Document complex business logic
- Maintain API documentation (consider Swagger/OpenAPI)

## Questions?
Refer to:
- [Spring Boot Documentation](https://docs.spring.io/spring-boot/docs/current/reference/html/)
- [Kotlin Documentation](https://kotlinlang.org/docs/home.html)
- Project's `COPILOT_INSTRUCTIONS.md` in root directory

---
**Last Updated**: December 28, 2025
