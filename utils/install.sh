#!/usr/bin/env bash

sudo apt update
sudo apt -y upgrade

# Install git
sudo apt install git

# Ranger 
sudo apt install ranger

mkdir -p ~/.config/ranger
echo -e "default_linemode devicons\nset show_hidden true" >> ~/.config/ranger/rc.conf

# Ranger devicons
git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons

# Install neovim
sudo apt install neovim

directory="~/.config/nvim"
if [ -d "$directory" ]
then
    mv "${directory}" "${directory}_old"
fi

git clone https://github.com/sandkoan/nvim.git ~/.config/nvim

# Clipboard support
sudo apt install xsel

# Node for COC
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs

# Python support
sudo apt install -y python3-pip
pip3 install jedi

# Perhaps unnecessary
pip3 install pynvim
# manually install python, etc., lsps
