FROM ubuntu:rolling

RUN apt update \
 && apt install -y ssh
RUN echo "Port 22" >> /etc/ssh/ssh_config \
 && echo "PubkeyAuthentication yes" >> /etc/ssh/ssh_config

COPY authorized_keys /root/.ssh/

COPY start.sh /scripts/start.sh
RUN ["chmod", "+x", "/scripts/start.sh"]
ENTRYPOINT ["/scripts/start.sh"]

RUN apt update
RUN apt install -y git
RUN apt install -y build-essential
RUN apt install -y vim cmake
RUN apt install -y python3 python3-pip

RUN python3 -m pip install --upgrade pip