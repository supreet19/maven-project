#
# Build stage
#
FROM maven:3.8.1-jdk-8-slim AS build
COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean package

#
# Package stage
#
FROM openjdk:8-jdk-slim
COPY --from=build /home/app/target/spring-boot-hello-world-example-0.0.1-SNAPSHOT.jar /usr/local/lib/supreetms.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/usr/local/lib/supreetms.jar"]
