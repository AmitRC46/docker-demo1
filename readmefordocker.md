we can pull it from docker hub
we can build it with the help of docker file

So the flow will be-->
docker file  --docker build->> Docker image --docker run->> docker container

# Basic commands:

FROM: to pull the base image
RUN: To execute commands
CMD: to provide defaults for an executing container and the commands are replaceble
ENTRYPOINT: to configure a container that will run as an executable and the commands are not replacable
WORKDIR: to sets the working directory
COPY: to copy a directory from your local machine to the docker container
ADD: to copy afiles and folders  from your local machine to the docker container and also download from URL
EXPOSE: inform docker that the container listens on the specified network ports at run time
ENV: To set environment variable

# procedure: install tomcat on Centos
Pull centos from dockerhub                  -FROM
install java                                -RUN
create /opt/tomcat directory                -RUN
change work directory to /opt/tomcat        -WORKDIR
download tomcat packages                    -ADD/RUN
extract tar.gz file                         -RUN
Rename to tomcat directory                  -RUN
tell to docker that it runs on port 8080    -EXPOSE
Start tomcat services                       -CMD