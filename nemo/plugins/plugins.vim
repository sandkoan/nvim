" Auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    " autocmd VimEnter * PlugInstall
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

" This file controls what nemo plugins are enabled and what order they load
" in. Remember to run ' ~/.config/nvim/bin/nemo sync' after modifying it!

" Autoclose pairs of "", [], {}, and more
Plug 'jiangmiao/auto-pairs'

" Surrounding things
Plug 'tpope/vim-surround'

" Awesome git wrapper
Plug 'tpope/vim-fugitive'

" Commenting with variations on gcc
Plug 'tpope/vim-commentary'

" Improved f/t
Plug 'unblevable/quick-scope'

" Powerful graphical view of undotree
Plug 'mbbill/undotree'

" Write to a file in a directory even if it doesn't exist yet
Plug 'sandkoan/mkdir.vim'

" Color scheme
Plug 'rakr/vim-one'

" Start screen
Plug 'mhinz/vim-startify'

" Leader popup
Plug 'liuchengxu/vim-which-key'

if executable('ranger')
    Plug 'kevinhwang91/rnvimr', {'do': 'make sync'} " Ranger integration
endif

" Fuzzy finding with fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Snippets
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" Python
Plug 'psf/black', { 'branch': 'stable' }

" Colorizer
if has('nvim-0.4')
    Plug 'norcalli/nvim-colorizer.lua'
endif

if has('nvim-0.5')
    " Lsp
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-lua/completion-nvim'

    " Treesitter
    Plug 'nvim-treesitter/nvim-treesitter', { 'commit': '3c07232'}
endif

" Color theme
Plug 'rktjmp/lush.nvim'

if executable('nginx')
    Plug 'chr4/nginx.vim'
endif

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
            \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
            \|   PlugInstall --sync | q
            \| endif
