FROM tomcat:v1
COPY target/*.war /root/tomcat/webapps
ENTRYPOINT ["catalina.sh", "run"]
