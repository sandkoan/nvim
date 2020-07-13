#!/usr/bin/env bash

sudo apt update
sudo apt -y upgrade

# Ranger 
sudo apt install ranger caca-utils highlight atool w3m poppler-utils mediainfo

git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons

mkdir -p ~/.config/ranger
echo -e "default_linemode devicons\nset show_hidden true" >> ~/.config/ranger/rc.conf

# Install neovim
sudo apt install neovim

directory="~/.config/nvim"
if [ -d "$directory" ]
then
    mv "${directory}" "${directory}_old"
fi

git clone https://github.com/sandkoan/nvim.git ~/.config/nvim

# Clipbaord support
sudo apt install xsel

# Install hack font, needs to be added to terminal config
# sudo apt install fonts-hack-ttf

# Node for COC
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs

# Python support
sudo apt install -y python3-pip
pip3 install jedi

# Perhaps unnecessary
pip3 install pynvim
# manually install python, etc., lsps
