# Dockerfile for Spring Boot App
FROM openjdk:17-jdk-slim-bullseye

ENV APP_JAR app.jar

COPY target/*.jar $APP_JAR

EXPOSE 8080

ENTRYPOINT ["java","-jar","/app.jar"]



