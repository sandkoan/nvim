" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    "autocmd VimEnter * PlugInstall
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

" This file controls what nemo plugins are enabled and what order they load
" in. Remember to run 'nemo update' after modifying it!

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'

Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdcommenter'
Plug 'mbbill/undotree'

Plug 'rakr/vim-one' " Color scheme
Plug 'mhinz/vim-startify' " Start screen
Plug 'liuchengxu/vim-which-key' " Leader popup

Plug 'kevinhwang91/rnvimr', {'do': 'make sync'} " Ranger integration

" Colorizer
if has('nvim-0.4')
    Plug 'norcalli/nvim-colorizer.lua'
endif

" Nvim lsp
if has('nvim-0.5')
    " Lsp
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-lua/completion-nvim'
    Plug 'nvim-lua/diagnostic-nvim'
    Plug 'nvim-lua/lsp-status.nvim'
    " Treesitter
    " Plug 'nvim-treesitter/nvim-treesitter'
endif


call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
            \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
            \|   PlugInstall --sync | q
            \| endif
