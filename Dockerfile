FROM kkrizka/vivado:2019.2

RUN apt update \
 && apt install -y ssh
RUN echo "Port 22" >> /etc/ssh/ssh_config \
 && echo "PubkeyAuthentication yes" >> /etc/ssh/ssh_config

COPY authorized_keys /root/.ssh/

COPY start.sh /scripts/start.sh
RUN ["chmod", "+x", "/scripts/start.sh"]
ENTRYPOINT ["/scripts/start.sh"]

RUN apt update \
 && apt install -y libxtst6 tmux git