FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    build-essential \
    software-properties-common \
    curl \
    git \
    unzip \
    tmux \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install ipython
RUN pip3 install matplotlib-backend-wezterm

RUN curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
RUN rm -rf /opt/nvim
RUN tar -C /opt -xzf nvim-linux64.tar.gz
RUN rm nvim-linux64.tar.gz
RUN echo 'export PATH="$PATH:/opt/nvim-linux64/bin"' >> ~/.bashrc

RUN curl -fsSL https://apt.fury.io/wez/gpg.key | gpg --yes --dearmor -o /etc/apt/keyrings/wezterm-fury.gpg
RUN echo 'deb [signed-by=/etc/apt/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | tee /etc/apt/sources.list.d/wezterm.list
RUN apt update
RUN apt install -y wezterm

CMD ["sleep", "infinity"]
