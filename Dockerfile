FROM tomcat:8.0

ADD ./webapp/target/*.war /usrlocal/tomcat/webapps

EXPOSE 8090

CMD ["catalina.sh", "run"]
