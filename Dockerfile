# -------- Stage 1: Build --------
FROM eclipse-temurin:17-jdk-jammy AS builder

WORKDIR /workspace

COPY gradlew .
COPY gradle gradle
COPY build.gradle .
COPY src src

RUN apt-get update && apt-get install -y dos2unix
RUN dos2unix gradlew
RUN chmod +x gradlew
RUN ./gradlew clean bootJar --no-daemon

# -------- Stage 2: Runtime --------
FROM eclipse-temurin:17-jre-jammy

RUN useradd -ms /bin/bash appuser

WORKDIR /app

COPY --from=builder /workspace/build/libs/*.jar app.jar

RUN chown -R appuser:appuser /app

USER appuser

EXPOSE 8080

HEALTHCHECK --interval=30s --timeout=5s --start-period=30s --retries=3 \
  CMD curl -f http://localhost:8080/actuator/health || exit 1

ENTRYPOINT ["java", "-jar", "app.jar"]
