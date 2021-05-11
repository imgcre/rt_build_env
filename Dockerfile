FROM ubuntu
ARG DEST_DIR=/usr/lib/gcc
ARG VERSION=gcc-arm-none-eabi-10-2020-q4-major
ARG URL=https://developer.arm.com/-/media/Files/downloads/gnu-rm/10-2020q4/gcc-arm-none-eabi-10-2020-q4-major-x86_64-linux.tar.bz2

# used by rtconfig.py
ENV RTT_EXEC_PATH=$DEST_DIR/$VERSION/bin
ENV PATH "$RTT_EXEC_PATH:$PATH"

WORKDIR ${DEST_DIR}

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
        build-essential \
        python3 \
        python-is-python3 \
        scons \
        git \
        wget \
        bzip2 \
        # qemu \
        # qemu-system-arm \
        # --menuconfig--
        libncurses5-dev \ 
    && \
    apt-get clean && \
    wget -nv --show-progress --progress=bar:force:noscroll -O- $URL | tar -xj
