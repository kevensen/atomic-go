FROM centos:7

MAINTAINER Kenneth D. Evensen <kevensen@redhat.com>

ENV HOME=/opt/app-root
ENV GOPATH $HOME/go
ENV GOBIN $GOPATH/bin
ENV PATH $PATH:$GOBIN

RUN yum install -y --setopt=tsflags=nodocs golang && \
    yum clean all && \
    rm -rf /var/cache/yum/* && \
    mkdir $HOME

WORKDIR $HOME

ENTRYPOINT ["/usr/bin/go"]
