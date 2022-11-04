FROM scratch                  
ENV DISTTAG=f36container FGC=f36 FBR=f36
ADD fedora-36-x86_64.tar.xz / 
CMD ["/bin/bash"]

#To build it in the container itself
USER not-root
FROM maven:3.6.0-jdk-11-slim AS build
COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean package
RUN java -cp /path_to_packaged_jar_file.jar/

#To copy already-built jar from the host to the container
USER not-root
COPY ./path_to_packaged_jar_file.jar /container/folder
RUN java -cp /path_to_packaged_jar_file.jar/