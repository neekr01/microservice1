FROM openjdk:8
# MAINTAINER Vinod <vinod@vinod.co>
ADD target/microservice-1-0.0.1-SNAPSHOT.jar microservice-1-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java", "-jar", "-Dserver.port=8002", "/microservice-1-0.0.1-SNAPSHOT.jar"]
EXPOSE 8002