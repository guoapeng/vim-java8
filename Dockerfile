FROM centos:7

RUN yum install -y java-1.8.0-openjdk* \
    && yum install -y vim \
    && yum install -y git

ENV VIM_WORKSPACE=/var/workspace
ENV VIM_CONFIG=/etc/.vim_java8

VOLUME [$VIM_WORKSPACE, $VIM_CONFIG]
mkdir /.vim/bundle/

WORKDIR $VIM_WORKSPACE

CMD /bin/bash

