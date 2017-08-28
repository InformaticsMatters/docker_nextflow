FROM centos:7
MAINTAINER Tim Dudgeon


RUN yum -y install docker-client.x86_64 java-1.8.0-openjdk-headless.x86_64 &&\
 yum clean all 
 
ENV JAVA_HOME /usr/lib/jvm/jre-openjdk/

RUN curl -fsSL get.nextflow.io | bash && chmod 755 nextflow
RUN mv nextflow /usr/local/bin
