FROM centos:7

RUN mkdir ~/.vim/bundle/
COPY .vimrc  /.vimrc

RUN yum install -y java-1.8.0-openjdk* \
    && yum install -y vim \
    && yum install -y git \
    && yum install -y curl \
    && git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    && vim +PluginInstall +qall  
    
ENV VIM_WORKSPACE=/var/workspace
ENV VIM_CONFIG=/etc/.vim_java8

VOLUME [$VIM_WORKSPACE, $VIM_CONFIG]


WORKDIR $VIM_WORKSPACE

CMD /bin/bash

