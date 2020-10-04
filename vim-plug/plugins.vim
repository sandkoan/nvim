" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    "autocmd VimEnter * PlugInstall
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'

Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdcommenter'
Plug 'mbbill/undotree'

" Color scheme
Plug 'rakr/vim-one'
" Start screen
Plug 'mhinz/vim-startify'

" Ranger integration
Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
" Colorize hex color codes
Plug 'lilydjwg/colorizer'

" " Nvim lsp
" if has('nvim-0.5')
    " Plug 'neovim/nvim-lspconfig'
    " Plug 'nvim-lua/completion-nvim'
    " Plug 'nvim-lua/diagnostic-nvim'
    " " Plug 'nvim-lua/popup.nvim'
    " " Plug 'nvim-lua/plenary.nvim'
    " " Plug 'nvim-lua/telescope.nvim'
" endif

" Unnecessary
Plug 'liuchengxu/vim-which-key'

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
            \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
            \|   PlugInstall --sync | q
            \| endif
