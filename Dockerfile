#FROM ubuntu:latest
FROM tomcat:latest

COPY mgdb_no_docker.war /usr/local/tomcat/webapps/mgdb.war

EXPOSE 8080

CMD ["catalina.sh", "run"]