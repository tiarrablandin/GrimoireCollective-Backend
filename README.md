# Backend - Grimoire Collective

Spring Boot backend API for Grimoire Collective.

## Tech Stack

- **Language**: Kotlin
- **Framework**: Spring Boot 3.2.1
- **Build Tool**: Gradle
- **Database**: PostgreSQL
- **Migration**: Flyway

## Prerequisites

- Java 17 or higher
- Gradle (or use the included wrapper)
- PostgreSQL (or use Docker)

## Getting Started

### Using Gradle Wrapper

```bash
./gradlew bootRun
```

### Building the Project

```bash
./gradlew build
```

### Running Tests

```bash
./gradlew test
```

## Configuration

Copy `.env.example` to `.env` and update the values:

```bash
cp .env.example .env
```

## API Endpoints

### Health Check
```
GET /api/public/health
```

## Database Migrations

Migrations are managed by Flyway and run automatically on application startup.

Migration files are located in `src/main/resources/db/migration/`.

## Project Structure

```
backend/
├── src/
│   ├── main/
│   │   ├── kotlin/
│   │   │   └── com/grimoirecollective/
│   │   │       ├── config/          # Configuration classes
│   │   │       ├── controller/      # REST controllers
│   │   │       ├── model/           # Domain models
│   │   │       ├── repository/      # Data repositories
│   │   │       ├── service/         # Business logic
│   │   │       └── GrimoireCollectiveApplication.kt
│   │   └── resources/
│   │       ├── db/migration/        # Flyway migrations
│   │       └── application.properties
│   └── test/                        # Test files
├── build.gradle.kts
└── settings.gradle.kts
```
