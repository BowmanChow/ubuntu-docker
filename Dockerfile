FROM osrf/ros:noetic-desktop-full-focal

RUN apt update
RUN apt install -y ssh
RUN echo "Port 22" >> /etc/ssh/ssh_config \
 && echo "RSAAuthentication yes" >> /etc/ssh/ssh_config \
 && echo "PubkeyAuthentication yes" >> /etc/ssh/ssh_config \
 && echo "AuthorizedKeysFile .ssh/authorized_keys" >> /etc/ssh/ssh_config \
 && echo "PermitRootLogin yes" >> /etc/ssh/ssh_config

COPY authorized_keys /root/.ssh/

COPY start.sh /scripts/start.sh
RUN ["chmod", "+x", "/scripts/start.sh"]

RUN apt install -y git
RUN apt install -y tmux
RUN apt install -y vim
RUN apt install -y ros-noetic-rqt
RUN apt install -y ros-noetic-rqt-common-plugins

RUN echo "source /opt/ros/$ROS_DISTRO/setup.bash" >> ~/.bashrc

ENTRYPOINT ["/scripts/start.sh"]