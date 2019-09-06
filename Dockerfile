FROM ubuntu:18.04

WORKDIR /swift-source

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -y \
    git \
    cmake \
    ninja-build \
    clang \
    python \
    uuid-dev \
    libicu-dev \
    icu-devtools \
    libedit-dev \
    libxml2-dev \
    libsqlite3-dev swig \
    libpython-dev \
    libncurses5-dev \
    pkg-config \
    libcurl4-openssl-dev \
    systemtap-sdt-dev \
    tzdata \
    rsync

RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/apple/swift.git \
    && swift/utils/update-checkout --clone

ENV TOOLCHAINS=swift
RUN swift/utils/build-script