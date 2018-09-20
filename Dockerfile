FROM maven:3-jdk-8
RUN git clone --depth 1 https://github.com/apache/incubator-dubbo-ops.git /source
WORKDIR /source/dubbo-admin-backend
RUN mvn clean package

  
  
FROM tomcat:8.0-jre8
RUN rm -rf /usr/local/tomcat/webapps/
COPY --from=0 target/*.war  /usr/local/tomcat/webapps/ROOT
EXPOSE 8080
