################################################################################
#      Copyright (C) 2020        Sebastian Francisco Colomar Bauza             #
#      SPDX-License-Identifier:  GPL-2.0-only                                  #
################################################################################
FROM maven:3.6.1-jdk-8-alpine AS build
WORKDIR /build/
COPY . .
RUN mvn install && mv target/*.jar java.jar
################################################################################
FROM openjdk:jre-alpine3.8
WORKDIR /app/
COPY --from=build /build/java.jar .
################################################################################
