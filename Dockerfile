FROM centos:7

COPY .vimrc_pathogen  /root/.vimrc

RUN yum install -y java-1.8.0-openjdk* \
    && yum install -y vim \
    && yum install -y git \
    && yum install -y curl 
   
    
RUN  mkdir -p /root/.vim/autoload /root/.vim/bundle 

COPY pathogen.vim /root/.vim/autoload/pathogen.vim

RUN cd /root/.vim/bundle \
    && git clone https://github.com/scrooloose/nerdtree.git \
    && git clone https://github.com/majutsushi/tagbar \
    && git clone https://github.com/SirVer/ultisnips \
    && git clone https://github.com/tpope/vim-commentary \
    && git clone https://github.com/scrooloose/syntastic \
    && git clone https://github.com/Raimondi/delimitMate \
    && git clone https://github.com/vim-scripts/bufexplorer.zip \
    && git clone https://github.com/magic-dot-files/TagHighlight \
    && git clone https://github.com/Lokaltog/vim-powerline \
    && git clone https://github.com/vim-scripts/javacomplete 
    
ENV VIM_WORKSPACE=/var/workspace
ENV VIM_CONFIG=/etc/.vim_java8

VOLUME [$VIM_WORKSPACE, $VIM_CONFIG]

WORKDIR $VIM_WORKSPACE

CMD /bin/bash
