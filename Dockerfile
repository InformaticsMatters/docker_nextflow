FROM centos:7
LABEL maintainer="Tim Dudgeon<tdudgeon@informaticsmatters.com>"
ARG NF_VERSION=19.01.0

RUN yum update -y &&\
 yum install -y --setopt=tsflags=nodocs --setopt=override_install_langs=en_US.utf8\
 docker-client\
 java-1.8.0-openjdk-headless &&\
 yum clean -y all &&\
 rm -rf /var/cache/yum 
 
ENV JAVA_HOME /usr/lib/jvm/jre-openjdk/

WORKDIR /root
COPY nextflow-config .nextflow/config
RUN curl https://github.com/nextflow-io/nextflow/releases/download/v${NF_VERSION}/nextflow -o nextflow -L && \
    chmod 755 nextflow && \
    mv nextflow /usr/local/bin
