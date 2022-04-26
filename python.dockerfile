FROM bowmanchow/ubuntu:ssh

RUN apt update && apt install -y --no-install-recommends \
    python3 \
    python3-pip \
 && rm -rf /var/lib/apt/lists/*

RUN python3 -m pip install --upgrade pip && \
    python3 -m pip install setuptools && \
    python3 -m pip install apt-mirror-updater && \
    python3 -m pip cache purge

RUN apt-mirror-updater --auto-change-mirror