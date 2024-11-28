FROM ubuntu:22.04

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

RUN apt-get update && apt-get install -y \
    python3-pip \
    build-essential \
    curl \
    git \
    vim \
    zlib1g-dev \
    libopenmpi-dev \
    ffmpeg \
    software-properties-common \
    lsb-release \
    sed \
    tmux \
    python3-opengl \
    unzip \
    wget \
    ripgrep \
    clangd \
    luarocks \
    python3-venv \
    && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs && \
    rm -rf /var/lib/apt/lists/*

RUN pip3 install ipython

CMD ["sleep", "infinity"]
