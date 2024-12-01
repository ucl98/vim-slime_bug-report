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

# Install neovim
RUN curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz \
    && tar -C /opt -xzf nvim-linux64.tar.gz \
    && rm nvim-linux64.tar.gz \
    && echo 'export PATH="$PATH:/opt/nvim-linux64/bin"' >> /root/.bashrc

# Install wezterm
RUN curl -fsSL https://apt.fury.io/wez/gpg.key | gpg --yes --dearmor -o /etc/apt/keyrings/wezterm-fury.gpg \
    && echo 'deb [signed-by=/etc/apt/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | tee /etc/apt/sources.list.d/wezterm.list \
    && apt-get update \
    && apt-get install -y wezterm \
    && rm -rf /var/lib/apt/lists/*

CMD ["sleep", "infinity"]
