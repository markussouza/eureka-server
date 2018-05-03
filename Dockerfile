FROM java:8
FROM maven:alpine

WORKDIR /app

COPY . /app

RUN mvn -v
RUN mvn clean install -DskipTests
EXPOSE 8761
LABEL maintainer="markus.souza@gmail.com"
ADD ./target/eureka-service.jar eureka-service.jar
ENTRYPOINT ["java", "-jar", "eureka-service.jar"]