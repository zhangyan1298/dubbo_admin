FROM maven:3-jdk-8
RUN git clone --depth 1 https://github.com/apache/incubator-dubbo-ops.git /source
WORKDIR /source
RUN mvn clean install
RUN mvn --projects dubbo-admin-backend spring-boot:run
