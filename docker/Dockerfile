FROM library/maven:alpine AS build
COPY . .
RUN mvn install && mv target/*.jar java.jar

FROM openjdk:alpine
COPY --from=build java.jar .
