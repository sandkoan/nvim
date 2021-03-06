# Nvim Nemo 1

![configuration="16pt JetBrainsMono font, Nord colorscheme, Qtile WM"](assets/ConfigPic.png)

A modular neovim configuration with sane, but flexible defaults.

### One Command Install

```bash
# With curl
bash <(curl -s https://raw.githubusercontent.com/sandkoan/nvim/master/bin/install)

# Or with wget
bash <(wget -qO- https://raw.githubusercontent.com/sandkoan/nvim/master/bin/install)
```

**Note: This installation script only works on Ubuntu/Debian and Manjaro/Arch.**

If you already have an nvim configuration in `~/.config/nvim`, the `nvim` folder will be renamed to `nvim_old`.

Feel free to make pull requests or open issues if you run into any issues.

### Some of the installed plugins
* Plugin manager is [vim-plug](https://github.com/junegunn/vim-plug)
* Powerful fuzzy searching with [fzf](https://github.com/junegunn/fzf.vim)
* [Rnvimr](https://github.com/kevinhwang91/rnvimr), a plugin that allows you to use Ranger instead of netrw for file exploration
* Tim Pope's [vim-fugitive](https://github.com/tpope/vim-fugitive) for git integration, [vim-surround](https://github.com/tpope/vim-surround) for surrounding things, and [vim-commentary](https://github.com/tpope/vim-commentary) for commenting
* [Vim-which-key](https://github.com/liuchengxu/vim-which-key) for Spacemacs-style leader popup 

## Dependencies
### Requirements
* [Neovim](https://neovim.io/), ideally, the nightly version (version >= 0.5) for lsp support and treesitter
* [Curl](https://curl.haxx.se/) to install/upgrade vim-plug - should come installed with neovim

### Optional (Strongly Recommended)
* Xsel for integration with system clipboard
* [Ranger](https://github.com/ranger/ranger), a cli filemanager with vim-inspired keybindings
* [FZF](https://github.com/junegunn/fzf), the command-line fuzzy finder
* [Ripgrep](https://github.com/BurntSushi/ripgrep), a blazing fast search utility written in rust

### Truly Optional
* [Bat](https://github.com/sharkdp/bat), for syntax-highlighted preview with fzf
* [Fd](https://github.com/sharkdp/fd), a fast user-friendly alternative to GNU find, written in rust

### Configuration
* User-specific configuration can be found in [nemo](https://github.com/sandkoan/nvim/tree/master/nemo)
    * If you add or delete any plugins, make sure to run `~/.config/nvim/bin/nemo sync`
* To stay up to date with the git repo, run `~/.config/nvim/bin/nemo update`
* Installed plugins can be found in [nemo/plugins](https://github.com/sandkoan/nvim/tree/master/nemo/plugins)
* Configuration settings for installed plugins can be found in [plug-config](https://github.com/sandkoan/nvim/tree/master/nemo/plug-config)
    * For example, to change the file shortcuts in startify, edit `nemo/plug-config/startify.vim`
* I strongly recommend that you install a patched font, like the [JetBrainsMono Nerd Font](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/JetBrainsMono).
