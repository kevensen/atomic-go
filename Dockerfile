FROM centos:7

MAINTAINER Kenneth D. Evensen <kevensen@redhat.com>

ARG user=1000

ENV HOME=/opt/app-root
ENV GOPATH $HOME/go
ENV GOBIN $GOPATH/bin
ENV PATH $PATH:$GOBIN

RUN rpmkeys --import file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7 && \
    yum install -y --setopt=tsflags=nodocs golang git git-bzr && \
    yum clean all && \
    rm -rf /var/cache/yum/* && \
    mkdir $HOME && \
    mkdir $GOPATH

WORKDIR $HOME

RUN useradd -u ${user} -r -g 0 -d ${HOME} -s /sbin/nologin -c "Default Application User" default && chown -R ${user}:0 /opt/app-root

USER ${user}

ENTRYPOINT ["/bin/bash"]
