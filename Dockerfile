FROM osrf/ros:noetic-desktop-full-focal

RUN apt update
RUN apt install -y ssh
RUN echo "Port 22" >> /etc/ssh/ssh_config \
 && echo "RSAAuthentication yes" >> /etc/ssh/ssh_config \
 && echo "PubkeyAuthentication yes" >> /etc/ssh/ssh_config

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

# Ubuntu Config
RUN apt update -y \
 && apt remove modemmanager -y\
 && apt install git zip qtcreator cmake build-essential genromfs ninja-build exiftool astyle -y
# make sure xxd is installed, dedicated xxd package since Ubuntu 18.04 but was squashed into vim-common before
RUN apt update -y \
 && apt install xxd -y \
# jMAVSim simulator dependencies
 && apt-get install ant openjdk-8-jdk openjdk-8-jre -y
# Required python packages
RUN apt update -y \
 && apt install python-argparse python3-empy python3-toml python3-numpy python3-dev python3-pip -y
RUN pip3 install --upgrade pip \
 && pip3 install pandas jinja2 pyserial pyyaml pyulog

# Install FastRTPS 1.7.1 and FastCDR-1.0.8
# ENV fastrtps_dir /eProsima_FastRTPS-1.7.1-Linux
# RUN wget https://www.eprosima.com/index.php/component/ars/repository/eprosima-fast-rtps/eprosima-fast-rtps-1-7-1/eprosima_fastrtps-1-7-1-linux-tar-gz -O eprosima_fastrtps-1-7-1-linux.tar.gz \
#  && file 
#  && tar -xzf eprosima_fastrtps-1-7-1-linux.tar.gz eProsima_FastRTPS-1.7.1-Linux
# RUN tar -xzf eprosima_fastrtps-1-7-1-linux.tar.gz requiredcomponents
# RUN tar -xzf requiredcomponents/eProsima_FastCDR-1.0.8-Linux.tar.gz
# RUN (cd eProsima_FastCDR-1.0.8-Linux && ./configure --libdir=/usr/lib && make -j && make install)
# RUN (cd eProsima_FastRTPS-1.7.1-Linux && ./configure --libdir=/usr/lib && make -j && make install)
# rm -rf requiredcomponents eprosima_fastrtps-1-7-1-linux.tar.gz

RUN mkdir PX4 \
 && cd PX4 \
 && git clone https://github.com/PX4/Firmware.git \
 && cd Firmware \
 && git checkout v1.9.2 \
 && git submodule update --init --recursive 
RUN cd /PX4/Firmware/Tools \
 && chmod +x *.sh \
 && cd /PX4/Firmware \
 && make px4_sitl_default
RUN cd /PX4/Firmware \
 && make px4_sitl_default gazebo 