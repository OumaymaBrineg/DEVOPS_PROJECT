# Dockerfile for Spring Boot App
FROM openjdk:17-jdk-slim

ENV APP_JAR app.jar

# Copy the packaged JAR from target
COPY target/*.jar $APP_JAR

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "/app.jar"]
