# dubbo_admin  分支开发版本 已经没有了dubbo-admin文件夹注意。
部署方法继承spring boot

Dockerfile
FROM maven:3-jdk-8
RUN git clone --depth 1 https://github.com/apache/incubator-dubbo-ops.git /source
WORKDIR /source
RUN mvn clean install
RUN mvn --projects dubbo-admin-backend spring-boot:run

#dubbo_admin master版本
详见master分支Dockerfile


