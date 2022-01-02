FROM enwaiax/x-ui

RUN apt update \
 && apt install openssl cron socat curl -y

RUN curl  https://get.acme.sh | sh