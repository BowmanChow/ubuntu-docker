FROM ubuntu:rolling

RUN apt update \
 && apt install -y ssh
RUN echo "Port 22" >> /etc/ssh/ssh_config \
 && echo "PubkeyAuthentication yes" >> /etc/ssh/ssh_config

COPY authorized_keys /root/.ssh/

COPY start.sh /scripts/start.sh
RUN ["chmod", "+x", "/scripts/start.sh"]
ENTRYPOINT ["/scripts/start.sh"]

ARG DEBIAN_FRONTEND=noninteractive
RUN apt update \
 && apt install -y curl

RUN curl https://sh.rustup.rs -sSf >> rustup.sh

RUN sh rustup.sh -y

RUN apt update \
 && apt install -y qemu-system-misc qemu-user

RUN apt update \
 && apt install -y git

ARG ALL_PROXY

RUN git clone https://github.com/LearningOS/rCore-Tutorial-2021Autumn

RUN apt update \
 && apt install -y make gcc

# WORKDIR /rCore-Tutorial-2021Autumn/os
# RUN ["/bin/bash", "-c", "source $HOME/.cargo/env && make"]
