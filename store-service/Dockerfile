#FROM adoptopenjdk/openjdk11:ubi
#openjdk:8-jdk-alpine
#RUN apk add --no-cache curl tar bash procps
#FROM maven

FROM zenika/alpine-maven AS MVN

WORKDIR /tmp

COPY pom.xml /tmp/

COPY src /tmp/src

CMD ["mvn", "liquibase:update"]