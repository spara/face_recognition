FROM python:3.6-slim-stretch

RUN apt-get -y update
RUN apt-get install -y --fix-missing \
    build-essential \
    cmake \
    gfortran \
    git \
    wget \
    curl \
    graphicsmagick \
    libgraphicsmagick1-dev \
    libatlas-dev \
    libavcodec-dev \
    libavformat-dev \
    libboost-all-dev \
    libgtk2.0-dev \
    libjpeg-dev \
    liblapack-dev \
    libswscale-dev \
    pkg-config \
    python-dev \
    python-numpy \
    python-pip \
    python-protobuf \
    python-setuptools \
    software-properties-common \
    zip \
    && apt-get clean && rm -rf /tmp/* /var/tmp/*

RUN cd ~ && \
    mkdir -p dlib && \
    git clone https://github.com/davisking/dlib.git dlib/ && \
    cd  dlib/ && \
    mkdir build/ && \ 
    cd build/ && \ 
    cmake .. -DDLIB_USE_CUDA=0 -DUSE_AVX_INSTRUCTIONS=1\ && \ 
    cmake --build .
RUN cd ~ && \
    mkdir known && \
    mkdir unknown && \
    chmod 777 known && \
    chmod 777 unknown

RUN pip install face_recognition

ENTRYPOINT ["face_recognition"]
