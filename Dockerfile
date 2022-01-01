FROM v2fly/v2fly-core

COPY config.json /root/

ENTRYPOINT ["/usr/bin/v2ray", "-config", "/root/config.json"]