FROM tomcat:v2
COPY target/*.war /root/tomcat/webapps/

