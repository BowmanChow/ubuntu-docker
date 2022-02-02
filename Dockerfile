FROM ubuntu:rolling

RUN apt update && apt install -y \
    ssh \
 && rm -rf /var/lib/apt/lists/*
RUN echo "Port 22" >> /etc/ssh/ssh_config \
 && echo "PubkeyAuthentication yes" >> /etc/ssh/ssh_config

COPY authorized_keys /root/.ssh/

COPY start.sh /scripts/start.sh
RUN ["chmod", "+x", "/scripts/start.sh"]
ENTRYPOINT ["/scripts/start.sh"]
