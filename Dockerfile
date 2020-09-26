FROM jenkinsci/blueocean:latest

USER root
# get maven 3.6.3
ENV WORKINGDIR=/tmp/
WORKDIR ${WORKINGDIR}
RUN wget https://mirrors.estointernet.in/apache/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz

# install maven
RUN tar xzf /tmp/apache-maven-3.6.3-bin.tar.gz -C /opt/
RUN ln -s /opt/apache-maven-3.6.3 /opt/maven
RUN ln -s /opt/maven/bin/mvn /usr/local/bin
RUN rm -f /tmp/apache-maven-3.6.3-bin.tar.gz
ENV MAVEN_HOME /opt/maven


RUN chown -R jenkins:jenkins /opt/maven
COPY settings.xml  ~/.m2
USER jenkins
