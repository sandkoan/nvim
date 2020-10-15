#!/usr/bin/env bash

# Identify linux distribution
if python3 -m platform | egrep -qi "manjaro|arch"
then
    os="arch"
else if python3 -m platform | egrep -qi "debian|ubuntu"
    os="debian"
else
    echo 'Your Linux distribution is not yet supported.'
    echo 'Currently, only arch/manjaro and debian/ubuntu are supported'
    echo 'Please proceed with the installation manually.'
    exit 1
fi

if [[ "$os" == "arch" ]]
then
    # System clipboard integration
    sudo apt install xsel git ranger neovim
else
    sudo pacman -S xsel git ranger neovim
fi

mkdir -p ~/.config/ranger
echo -e "default_linemode devicons\nset show_hidden true" >> ~/.config/ranger/rc.conf

# Ranger devicons
git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons

config_directory="~/.config/nvim"
if [ -d "$config_directory" ]
then
    mv "${config_directory}" "${config_directory}_old"
fi

# Install Nemo 1 nvim config
git clone https://github.com/sandkoan/nvim.git ~/.config/nvim
