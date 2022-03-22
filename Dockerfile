FROM openjdk:8-jre-slim-buster
LABEL maintainer "Dylan Luttrell"
# arguments for service name, its directory, and version
ARG NAME=aline-gateway
ARG DIR=.
ARG VERSION=*
# copy from local dir to container
WORKDIR /app
COPY ${DIR}/target/${NAME}-${VERSION}.jar service.jar
# set enviroment variables for database dialect and modification mode
ENV DB_PLATFORM=org.hibernate.dialect.H2Dialect
ENV DDL_AUTO_MODE=create-only

EXPOSE 8071
CMD ["java", "-jar", "service.jar"]
