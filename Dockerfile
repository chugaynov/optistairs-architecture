#FROM structurizr/structurizr:1.15.0
FROM structurizr/structurizr:latest
ENV USER=tomcat

# ADD ./structurizr-onpremises.war /usr/local/tomcat/webapps/ROOT.war
COPY .artifacts /usr/local/structurizr

RUN chown -R "$USER":"$USER" /usr/local/structurizr
USER "$USER"
ENV CATALINA_OPTS="-Xms512M -Xmx512M"
EXPOSE 8080

CMD ["catalina.sh", "run"]




