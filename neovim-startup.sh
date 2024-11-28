#!/bin/bash

# Install neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
rm -rf /opt/nvim
tar -C /opt -xzf nvim-linux64.tar.gz
rm nvim-linux64.tar.gz

# Update PATH
echo 'export PATH="$PATH:/opt/nvim-linux64/bin"' >> ~/.bashrc

# Nvim configuration
mkdir -p /root/.config/nvim
curl -L https://github.com/ucl98/config/raw/main/nvim/init.lua -o /root/.config/nvim/init.lua

# Tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Tmux configuration
git clone https://github.com/ucl98/config.git /tmp/config
cp -r /tmp/config/tmux /root/.config/tmux
rm -rf /tmp/config

# Add a note for shorcuts and reference the folder for nvim
curl https://raw.githubusercontent.com/ucl98/config/refs/heads/main/notes/shorcuts.md > /workspace/notes/shortcuts.md
echo TERM=xterm-256color >> ~/.bashrc

# Install wezterm
curl -fsSL https://apt.fury.io/wez/gpg.key | gpg --yes --dearmor -o /etc/apt/keyrings/wezterm-fury.gpg
echo 'deb [signed-by=/etc/apt/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | tee /etc/apt/sources.list.d/wezterm.list
apt update
apt install -y wezterm

# Install lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
mkdir -p ~/bin
mv lazygit ~/bin/
rm lazygit.tar.gz
echo 'export PATH=$PATH:~/bin' >> ~/.bashrc

# Setup terminal plots
pip3 install --user matplotlib-backend-wezterm
pip3 install --user neovim

source ~/.bashrc
