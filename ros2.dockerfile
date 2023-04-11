FROM bowmanchow/ubuntu:c

RUN apt-get update && apt-get install -y --no-install-recommends \
    locales && \
    locale-gen en_US en_US.UTF-8 && \
    update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 && \
    export LANG=en_US.UTF-8

RUN apt-get install -y --no-install-recommends \
    software-properties-common && \
    add-apt-repository universe

COPY ros.key /usr/share/keyrings/ros-archive-keyring.gpg

RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null

RUN apt-get update && apt-get install -y --no-install-recommends \
    ros-foxy-desktop \
    python3-argcomplete \
    ros-dev-tools

RUN apt-get install -y --no-install-recommends \
    ros-foxy-turtlesim \
    ~nros-foxy-rqt*

RUN echo "source /opt/ros/foxy/setup.bash" >> ~/.bashrc
