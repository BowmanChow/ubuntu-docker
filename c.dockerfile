FROM bowmanchow/ubuntu:python

ARG DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install -y --no-install-recommends \
    git \
    build-essential \
    cmake \
    curl \
    wget \
    vim \
 && rm -rf /var/lib/apt/lists/*
