FROM zenika/alpine-maven AS MVN

WORKDIR /tmp

COPY pom.xml /tmp/

COPY src /tmp/src

CMD ["mvn", "clean", "package", "liquibase:update"]