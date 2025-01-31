FROM ubuntu:16.04
MAINTAINER Yuichi Shiraishi <friend1ws@gmail.com> 


RUN apt-get update && apt-get install -y \
    git \
    wget \
    bzip2 \
    make \
    gcc \
    zlib1g-dev \
    libbz2-dev \
    liblzma-dev \
    libcurl4-openssl-dev \
    libssl-dev \
    python \
    python-pip

RUN wget https://github.com/samtools/htslib/releases/download/1.7/htslib-1.7.tar.bz2 && \
    tar jxvf htslib-1.7.tar.bz2 && \
    cd htslib-1.7 && \
    make && \
    make install

RUN pip install --upgrade 'pip<21.0'
RUN pip install --upgrade setuptools

RUN pip install annot_utils==0.3.1
RUN pip install pysam==0.15.4
#RUN pip install fusionfusion==0.5.0
RUN pip install chimera_utils==0.6.0

RUN apt-get update && apt-get install -y \
    libkrb5-3 \
    libpng12-0

RUN wget https://github.com/friend1ws/fusion_utils/archive/v0.2.0.tar.gz && \
    tar xzvf v0.2.0.tar.gz && \
    cd fusion_utils-0.2.0 && \
    python setup.py install

RUN cd  /usr/local/bin && \
    wget http://hgdownload.cse.ucsc.edu/admin/exe/linux.x86_64/blat/blat
RUN chmod a+x /usr/local/bin/blat

RUN wget https://github.com/aokad/fusionfusion/archive/refs/tags/v0.5.2b1.zip && \
    tar xzvf v0.5.2b1.tar.gz && \
    cd fusionfusion-0.5.2b1 && \
    python setup.py install
