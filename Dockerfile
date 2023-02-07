FROM amazoncorretto:11-alpine
COPY target/*.jar testing-web-complete.jar
CMD ["java","-jar","testing-web-complete.jar"]
