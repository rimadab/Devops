FROM openjdk:11
COPY target/*.jar app.jar
EXPOSE 8089
ENTRYPOINT ["java", "-jar","app.jar"]
