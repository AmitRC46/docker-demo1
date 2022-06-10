# Pull centos from dockerhub                  -FROM
# install java                                -RUN
# create /opt/tomcat directory                -RUN
# change work directory to /opt/tomcat        -WORKDIR
# download tomcat packages                    -ADD/RUN
# extract tar.gz file                         -RUN
# Rename to tomcat directory                  -RUN
# tell to docker that it runs on port 8080    -EXPOSE
# Start tomcat services                       -CMD

FROM ubuntu:latest
RUN apt-get update && \
	apt-get install -y openjdk-8-jdk && \
	apt-get install -y ant && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* && \
	rm -rf /var/cache/oracle-jdk8-installer;
	
# Fix certificate issues, found as of 
# https://bugs.launchpad.net/ubuntu/+source/ca-certificates-java/+bug/983302
RUN apt-get update && \
	apt-get install -y ca-certificates-java && \
	apt-get clean && \
	update-ca-certificates -f && \
	rm -rf /var/lib/apt/lists/* && \
	rm -rf /var/cache/oracle-jdk8-installer;

# Setup JAVA_HOME, this is useful for docker commandline
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
RUN export JAVA_HOME

RUN mkdir /opt/tomcat
WORKDIR /opt/tomcat
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.64/bin/apache-tomcat-9.0.64.tar.gz .
RUN tar -xvzf apache-tomcat-9.0.64.tar.gz
EXPOSE 8080
CMD ["apache-tomcat-9.0.64/bin/catalina.sh","run"]