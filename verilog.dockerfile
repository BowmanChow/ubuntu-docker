FROM bowmanchow/ubuntu:c

RUN apt update && apt install -y --no-install-recommends \
    verilator \
    gdb \
    libreadline-dev \
    libsdl2-dev \
    llvm-11 \
    llvm-11-dev \
    bison \
    flex \
    verilator \
    libsdl2-dev \
    libsdl2-image-dev \
 && rm -rf /var/lib/apt/lists/*

RUN git config --global user.name "22040539-ZhouJunBao" && \
    git config --global user.email "junbaozhou@foxmail.com"