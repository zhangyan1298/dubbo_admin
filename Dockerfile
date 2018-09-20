FROM maven:3-jdk-8
RUN git clone --depth 1 https://github.com/apache/incubator-dubbo-ops.git /source
WORKDIR /source
RUN mvn clean install

  
  
FROM tomcat:8.0-jre8
RUN rm -rf /usr/local/tomcat/webapps/
COPY /root/.m2/repository/org/apache/dubbo-admin-backend/0.0.1-SNAPSHOT/*.jar .
RUN nohup java -jar  dubbo-admin-backend-0.0.1-SNAPSHOT.jar 
EXPOSE 8080
