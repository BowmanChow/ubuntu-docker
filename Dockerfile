FROM ubuntu:rolling

RUN apt update \
 && apt install -y ssh
RUN echo "Port 22" >> /etc/ssh/ssh_config \
 && echo "PubkeyAuthentication yes" >> /etc/ssh/ssh_config

COPY authorized_keys /root/.ssh/

COPY start.sh /scripts/start.sh
RUN ["chmod", "+x", "/scripts/start.sh"]
ENTRYPOINT ["/scripts/start.sh"]

RUN apt update \
 && apt install -y openjdk-11-jdk apt-transport-https curl gnupg

RUN echo "deb https://repo.scala-sbt.org/scalasbt/debian all main" | tee /etc/apt/sources.list.d/sbt.list \
 && echo "deb https://repo.scala-sbt.org/scalasbt/debian /" | tee /etc/apt/sources.list.d/sbt_old.list \
 && curl -sL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x2EE0EA64E40A89B84B2DF73499E82A75642AC823" | gpg --no-default-keyring --keyring gnupg-ring:/etc/apt/trusted.gpg.d/scalasbt-release.gpg --import \
 && chmod 644 /etc/apt/trusted.gpg.d/scalasbt-release.gpg

RUN apt update \
 && apt install sbt -y

RUN sbt --version

RUN git clone https://github.com/BowmanChow/risc-v-cpu.git \
 && cd risc-v-cpu \
 && sbt test