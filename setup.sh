#!/bin/bash

# Install neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
rm -rf /opt/nvim
tar -C /opt -xzf nvim-linux64.tar.gz
rm nvim-linux64.tar.gz

# Update PATH
echo 'export PATH="$PATH:/opt/nvim-linux64/bin"' >> ~/.bashrc

# Install wezterm
curl -fsSL https://apt.fury.io/wez/gpg.key | gpg --yes --dearmor -o /etc/apt/keyrings/wezterm-fury.gpg
echo 'deb [signed-by=/etc/apt/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | tee /etc/apt/sources.list.d/wezterm.list
apt update
apt install -y wezterm

source ~/.bashrc
