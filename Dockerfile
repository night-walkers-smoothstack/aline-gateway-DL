FROM openjdk:19-jdk-alpine3.15
LABEL maintainer "Dylan Luttrell"
WORKDIR /app
COPY aline-gateway/target/aline-gateway-0.0.1-SNAPSHOT.jar aline-gateway-0.0.1-SNAPSHOT.jar
ENV DB_PLATFORM=org.hibernate.dialect.H2Dialect
ENV DDL_AUTO_MODE=create-only
CMD ["java", "-jar", "aline-gateway-0.0.1-SNAPSHOT.jar"]
