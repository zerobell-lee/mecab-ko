FROM ubuntu:16.04

#Set the locale
ENV LANG C.UTF-8
ENV LANGUAGE C.UTF-8

#Setup essential
RUN apt-get update
RUN apt-get install sudo
RUN apt-get install -y build-essential autotools-dev automake libmecab2 libmecab-dev wget

#Installing Mecab

WORKDIR /workspace/mecab-src
RUN wget https://bitbucket.org/eunjeon/mecab-ko/downloads/mecab-0.996-ko-0.9.2.tar.gz
RUN tar -zxvf mecab-0.996-ko-0.9.2.tar.gz
WORKDIR /workspace/mecab-src/mecab-0.996-ko-0.9.2
RUN ./configure
RUN make
RUN sudo make install
RUN sudo ldconfig
RUN rm -rf /workspace/mecab-src/mecab-0.996-ko-0.9.2

#Installing Mecab-ko-dic

WORKDIR /workspace/mecab-dic-src
RUN wget https://bitbucket.org/eunjeon/mecab-ko-dic/downloads/mecab-ko-dic-2.1.1-20180720.tar.gz
RUN tar -zxvf mecab-ko-dic-2.1.1-20180720.tar.gz
WORKDIR /workspace/mecab-dic-src/mecab-ko-dic-2.1.1-20180720
RUN ./autogen.sh
RUN ./configure
RUN make
RUN sudo make install
RUN ldconfig

#Installing Mecab-Jumandic
# Since Japanese Dics are deployed on Google Drive, you should download it directly and add by yourself.
#

#Removing unneccesary
WORKDIR /
RUN apt-get remove -y build-essential wget

CMD mecab

