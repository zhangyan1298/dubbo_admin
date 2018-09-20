FROM maven:3-jdk-8
RUN git clone --depth 1 -b master https://github.com/apache/incubator-dubbo-ops.git /source
WORKDIR /source
RUN mvn clean install -f dubbo-admin
#RUN mvn --projects dubbo-admin-backend spring-boot:run


FROM openjdk:8-jre-alpine
COPY --from=0 /source/dubbo-admin/target/dubbo-admin-0.0.1-SNAPSHOT.jar /
ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar","/dubbo-admin-0.0.1-SNAPSHOT.jar"]

