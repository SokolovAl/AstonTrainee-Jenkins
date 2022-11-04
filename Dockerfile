FROM tomcat:9.0
ENV DB_HOST 192.168.1.110
ENV DB_USER alex
ENV DB_PASSWORD root
EXPOSE 9090
RUN rm -fr /usr/local/tomcat/webapps/spring-boot-0.0.1-SNAPSHOT
COPY target/spring-boot-0.0.1-SNAPSHOT.jar /usr/local/tomcat/webapps/spring-boot-0.0.1-SNAPSHOT.jar
