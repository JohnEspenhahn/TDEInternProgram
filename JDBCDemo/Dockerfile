FROM tomcat

WORKDIR /usr/local

# Add compiled code
ADD ./target/*.war ROOT.war
RUN rm -rf tomcat/webapps/ROOT
RUN mkdir tomcat/webapps/ROOT
RUN unzip ROOT.war -d tomcat/webapps/ROOT

# Change data-access.properties so server knows how to reference database
ADD ./src/main/webapp/WEB-INF/spring/environments/docker_data-access.properties data-access.properties
RUN rm tomcat/webapps/ROOT/WEB-INF/spring/data-access.properties
RUN mv data-access.properties tomcat/webapps/ROOT/WEB-INF/spring/

# Allow remote debugging
ENV JPDA_ADDRESS 8000
ENV JPDA_TRANSPORT dt_socket

EXPOSE 8000
WORKDIR $CATALINA_HOME
CMD [ "catalina.sh", "jpda", "run" ]