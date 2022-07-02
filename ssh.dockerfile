ARG UBUNTU_VERSION
FROM ubuntu:${UBUNTU_VERSION}

ARG UBUNTU_VERSION
COPY ubuntu_source_list.sh /root/
RUN /bin/bash /root/ubuntu_source_list.sh ${UBUNTU_VERSION}

RUN apt update && apt install -y --no-install-recommends \
    ssh \
 && rm -rf /var/lib/apt/lists/*
RUN echo "Port 22" >> /etc/ssh/ssh_config \
 && echo "PubkeyAuthentication yes" >> /etc/ssh/ssh_config

COPY authorized_keys /root/.ssh/

ENTRYPOINT ["/bin/bash", "-c", "service ssh restart; tail -f /dev/null"]
