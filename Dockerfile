FROM maven:3-jdk-8
RUN git clone --depth 1 https://github.com/apache/incubator-dubbo-ops.git /source
WORKDIR /source
RUN mvn clean install
RUN mvn --projects dubbo-admin-backend 
  
  
FROM tomcat:8.0-jre8
RUN rm -rf /usr/local/tomcat/webapps/
COPY --from=0 /source/target/*.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
