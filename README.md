# Nvim Nemo 1

![configuration="16pt JetBrainsMono font, Nord colorscheme, Qtile WM"](core/img/ConfigPic.png)

A modular neovim configuration with sane, but flexible defaults.

### Install the entire configuration with 

```bash 
bash <(curl -s https://raw.githubusercontent.com/sandkoan/nvim/master/bin/install)
```

**Note: This installation script only works on Ubuntu/Debian and Manjaro/Arch.**

If you already have an nvim configuration in `~/.config/nvim`, the `nvim` folder will be renamed to `nvim_old`.

### Post installation
1. Launch neovim, you should be met with many errors.
2. Enter command mode (hit \<Escape\>) then type `:PlugInstall`.
3. After installation, quit (\<Escape\>, then type `:q!`).
4. Success! You have successfully installed `Nemo 1`.

Feel free to make pull requests or open issues if you run into any issues.

### Some of the installed plugins
* Plugin manager is [vim-plug](https://github.com/junegunn/vim-plug)
* [Ranger](https://github.com/ranger/ranger) for file exploring with highly customizable vim keybindings
* Tim Pope's [vim-fugitive](https://github.com/tpope/vim-fugitive) for git integration and [vim-surround](https://github.com/tpope/vim-surround) for surrounding things
* [Vim-which-key](https://github.com/liuchengxu/vim-which-key) for Spacemacs-style leader popup 

### Configuration
* User-specific configuration can be found in [nemo](https://github.com/sandkoan/nvim/tree/master/nemo)
    * If you add or delete any plugins, make sure to run `~/.config/nvim/bin/nemo sync`
* Installed plugins can be found in [nemo/plugins](https://github.com/sandkoan/nvim/tree/master/nemo/plugins)
* Configuration settings for installed plugins can be found in [plug-config](https://github.com/sandkoan/nvim/tree/master/nemo/plug-config)
    * For example, to change the file shortcuts in startify, edit `nemo/plug-config/startify.vim`
* I strongly recommend that you install a patched font, like the [JetBrainsMono Nerd Font](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/JetBrainsMono).
