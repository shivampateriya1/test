FROM openjdk:11 as builder

WORKDIR /springapp

COPY . /springapp/

RUN ./mvnw -B package


FROM openjdk:11 as petclinic 
COPY --from=builder /springapp/target/*.jar springapp/app.jar

ENTRYPOINT ["java","-jar","/app.jar"]
EXPOSE 8080