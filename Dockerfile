FROM openjdk:8-jdk-alpine
EXPOSE 8082
ADD target/skistation-rahma.war skistation.war
ENTRYPOINT ["java","-jar","/skistation.war"]
