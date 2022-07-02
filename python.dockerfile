FROM bowmanchow/ubuntu:ssh

RUN apt update && apt install -y --no-install-recommends \
    python3 \
    python3-pip \
 && rm -rf /var/lib/apt/lists/*
