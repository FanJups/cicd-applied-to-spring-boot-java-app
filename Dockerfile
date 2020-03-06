# Start with a base image containing Java runtime
FROM openjdk:8-jdk-alpine

# Add Maintainer Info
LABEL maintainer="jupsfan@gmail.com"

# Add a volume pointing to /tmp
VOLUME /tmp

# Make port 8080 available to the world outside this container
EXPOSE 8080

# The application's jar file
#ARG JAR_FILE

# Add the application's jar to the container
#ADD ${JAR_FILE} app.jar
COPY target/*.jar app.jar

#Adding HealthCheckup
HEALTHCHECK CMD curl --fail http://localhost:8080/ || exit 1

# Run the jar file 
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
  
  

