FROM ubuntu:latest

MAINTAINER ANNE

RUN apt-get update -y && apt-get install wget -y && apt-get install telnet -y && apt-get install curl -y 


#Install app dependencies
RUN mkdir /opt/tomcat
RUN mkdir -p /opt/shared/log/apps/app

WORKDIR /opt/tomcat
RUN curl -O https://archive.apache.org/dist/tomcat/tomcat-8/v8.5.51/bin/apache-tomcat-8.5.51.tar.gz
RUN tar xvzf apache*.tar.gz
RUN mv apache-tomcat-8.5.51/* /opt/tomcat/.

# RUN apt-get install openjdk-8-jdk -y
RUN apt-get install default-jdk -y && java -version
RUN java -version

WORKDIR /opt/tomcat/webapps


#Copy application dependencies

COPY  ./**/helloworld-0.1-dev.war   ./

RUN mkdir /efs_data


EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh","run"]
