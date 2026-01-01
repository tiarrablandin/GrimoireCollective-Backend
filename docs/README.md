# Backend Documentation

Welcome to the Grimoire Collective backend documentation!

## 📚 Documentation Index

This directory contains all technical documentation for the Spring Boot backend API.

### Getting Started

- **[API_REFERENCE.md](API_REFERENCE.md)** - Complete API endpoint documentation *(coming soon)*
- **[SETUP.md](SETUP.md)** - Local development setup guide *(coming soon)*

### Development

- **[ARCHITECTURE.md](ARCHITECTURE.md)** - Application architecture and design patterns *(coming soon)*
- **[AUTHENTICATION.md](AUTHENTICATION.md)** - Authentication and authorization guide *(coming soon)*
- **[DATABASE.md](DATABASE.md)** - Database integration and entity relationships *(coming soon)*

### Testing

- **[TESTING.md](TESTING.md)** - Testing strategy and guidelines *(coming soon)*

### Deployment

- **[DEPLOYMENT.md](DEPLOYMENT.md)** - Deployment procedures and environments *(coming soon)*

---

## 🗂️ Backend Structure

```text
backend/
├── src/
│   ├── main/
│   │   ├── kotlin/
│   │   │   └── com/grimoirecollective/
│   │   │       ├── GrimoireCollectiveApplication.kt
│   │   │       ├── config/
│   │   │       ├── controller/
│   │   │       ├── service/
│   │   │       ├── repository/
│   │   │       ├── model/
│   │   │       └── dto/
│   │   └── resources/
│   │       ├── application.properties
│   │       └── db/migration/
│   └── test/
├── docs/                      # 📚 All documentation (you are here!)
├── build.gradle.kts
├── README.md
└── DEVELOPMENT_GUIDELINES.md
```

## 🎯 Quick Links

**Want to...**

- **Set up locally?** → See main [README.md](../README.md)
- **Understand the architecture?** → Check [ARCHITECTURE.md](ARCHITECTURE.md) *(coming soon)*
- **Use the API?** → Read [API_REFERENCE.md](API_REFERENCE.md) *(coming soon)*
- **Run tests?** → Follow [TESTING.md](TESTING.md) *(coming soon)*

## 🚀 Technology Stack

- **Language**: Kotlin
- **Framework**: Spring Boot 3.x
- **Build Tool**: Gradle (Kotlin DSL)
- **Database**: PostgreSQL 16
- **ORM**: Spring Data JPA
- **Migration**: Flyway
- **Security**: Spring Security
- **Testing**: JUnit 5, MockK

## 📝 Contributing Documentation

When adding new documentation:

1. Place the file in this `docs/` directory
2. Add an entry to this README index
3. Link from main README if appropriate
4. Follow markdown best practices
5. Include code examples where helpful

## 🔗 Related Documentation

- **Database**: [../database/docs/](../../database/docs/) - Database schema and queries
- **Frontend**: [../frontend/docs/](../../frontend/docs/) - Frontend documentation
- **Root**: [../../README.md](../../README.md) - Project overview

---

**Ready to build the backend?** Start with the main [README.md](../README.md)!
