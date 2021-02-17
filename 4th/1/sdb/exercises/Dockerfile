FROM ubuntu:18.04

RUN apt-get update && apt-get -yq upgrade

RUN apt-get -y install software-properties-common curl
RUN apt-get -y install openjdk-8-jre-headless

RUN curl -O http://archive.apache.org/dist/tomcat/tomcat-7/v7.0.55/bin/apache-tomcat-7.0.55.tar.gz
RUN tar xzf apache-tomcat-7.0.55.tar.gz

CMD apache-tomcat-7.0.55/bin/startup.sh && tail -f apache-tomcat-7.0.55/logs/catalina.out

COPY myapps /apache-tomcat-7.0.55/webapps/

EXPOSE 8080
