# RealWorld Backend (Adapted for Testing Platform)

This repository is based on the original:
https://github.com/gothinkster/spring-boot-realworld-example-app

It was adapted to serve as a controlled **System Under Test (SUT)** for an independent quality engineering platform.

---

## 🔧 Modifications from the Original Project

The following changes were introduced to make the backend suitable for testing, CI/CD integration, and containerized deployment:

### Infrastructure

- Switched persistence from SQLite/H2 to **PostgreSQL**
- Added **docker-compose** configuration with:
    - Postgres service
    - health checks
    - environment-based configuration
- Added multi-stage **Dockerfile** for production-style container builds
- Added `.dockerignore`
- Added `.env` configuration support

### Runtime & Build

- Upgraded to **Java 17 toolchain**
- Configured Gradle Java toolchain explicitly
- Adjusted dependencies for compatibility
- Added Spring Boot Actuator health endpoint:
    - `/actuator/health`

### Configuration

- Externalized database configuration via environment variables:
    - `SPRING_DATASOURCE_URL`
    - `SPRING_DATASOURCE_USERNAME`
    - `SPRING_DATASOURCE_PASSWORD`

---

## 🎯 Purpose of This Repository

This backend serves as a controlled System Under Test (SUT) used to design and demonstrate:
- REST API test strategy
- JWT authentication validation
- Contract testing (provider verification)
- CI/CD quality gates

Business logic remains unchanged.

# ![RealWorld Example App using Kotlin and Spring](example-logo.png)

> ### Spring boot + MyBatis codebase containing real world examples (CRUD, auth, advanced patterns, etc) that adheres to the [RealWorld](https://github.com/gothinkster/realworld-example-apps) spec and API.

This codebase was created to demonstrate a fully fledged full-stack application built with Spring boot + Mybatis including CRUD operations, authentication, routing, pagination, and more.

For more information on how to this works with other frontends/backends, head over to the [RealWorld](https://github.com/gothinkster/realworld) repo.

# *NEW* GraphQL Support  

Following some DDD principles. REST or GraphQL is just a kind of adapter. And the domain layer will be consistent all the time. So this repository implements GraphQL and REST at the same time.

The GraphQL schema is https://github.com/gothinkster/spring-boot-realworld-example-app/blob/master/src/main/resources/schema/schema.graphqls and the visualization looks like below.

![](graphql-schema.png)

And this implementation is using [dgs-framework](https://github.com/Netflix/dgs-framework) which is a quite new java graphql server framework.
# How it works

The application uses Spring Boot (Web, Mybatis).

* Use the idea of Domain Driven Design to separate the business term and infrastructure term.
* Use MyBatis to implement the [Data Mapper](https://martinfowler.com/eaaCatalog/dataMapper.html) pattern for persistence.
* Use [CQRS](https://martinfowler.com/bliki/CQRS.html) pattern to separate the read model and write model.

And the code is organized as this:

1. `api` is the web layer implemented by Spring MVC
2. `core` is the business model including entities and services
3. `application` is the high-level services for querying the data transfer objects
4. `infrastructure`  contains all the implementation classes as the technique details

# Security

Integration with Spring Security and add other filter for jwt token process.

The secret key is stored in `application.properties`.

# Database

The original project used H2/SQLite for local testing.

This adapted version uses **PostgreSQL** as the primary database engine
to better simulate production-like persistence behavior.

Database configuration is externalized via environment variables.

# Getting started

You'll need Java 17 installed (or compatible toolchain).

    ./gradlew bootRun

To test that it works, open a browser tab at http://localhost:8080/tags .  
Alternatively, you can run

    curl http://localhost:8080/tags

# Run with Docker Compose

Make sure Docker is installed.

1. Create `.env` file based on `.env.example`
2. Run:

   docker-compose up --build

Backend will be available at:

    http://localhost:8080

# Try it out with a RealWorld frontend

The entry point address of the backend API is at http://localhost:8080, **not** http://localhost:8080/api as some of the frontend documentation suggests.

# Run test

The repository contains a lot of test cases to cover both api test and repository test.

    ./gradlew test

# Code format

Use spotless for code format.

    ./gradlew spotlessJavaApply

# Help

For original project contributions, please refer to the upstream repository:
https://github.com/gothinkster/spring-boot-realworld-example-app