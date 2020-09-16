# Nvim Nemo 1

![configuration="16pt JetBrainsMono font, Nord colorscheme, Qtile wm"](/assets/ConfigPic.png)

### Install the entire configuration with 

```bash 
bash <(curl -s https://raw.githubusercontent.com/sandkoan/nvim/master/utils/install.sh)
```

**Note: This only works on Ubuntu**

If you already have an nvim configuration in ```~/.config/nvim```, the ```nvim``` folder will be renamed to ```nvim_old```.

### Some of the installed plugins
* Plugin manager is [vim-plug](https://github.com/junegunn/vim-plug)
* [Ranger](https://github.com/ranger/ranger) for file exploring with highly customizable vim keybindings
* [Fzf](https://github.com/junegunn/fzf) for fuzzy searching
* Tim Pope's [vim-fugitive](https://github.com/tpope/vim-fugitive) for git integration and [vim-surround](https://github.com/tpope/vim-surround) for surrounding things
* [Vim-which-key](https://github.com/liuchengxu/vim-which-key) for Spacemacs-style leader popup 
* You can get language support via [coc.nvim](https://github.com/neoclide/coc.nvim), follow the set-up instructions on their github page

### Location
* General settings are in [general/settings.vim](https://github.com/sandkoan/nvim/tree/master/general/settings.vim) 
* General Keybindings are in [general/keys.vim](https://github.com/sandkoan/nvim/tree/master/general/keys.vim)
* Installed plugins can be found in [vim-plug/plugins.vim](https://github.com/sandkoan/nvim/tree/master/vim-plug)
* Configuration settings for installed plugins can be found in [plug-config](https://github.com/sandkoan/nvim/tree/master/plug-config)

I strongly recommend that you install a patched font, like the [JetBrainsMono Nerd Font](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/JetBrainsMono).
