" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

Plug 'junegunn/vim-easy-align' 
Plug 'terryma/vim-multiple-cursors'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'

Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdcommenter'
Plug 'mbbill/undotree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'octol/vim-cpp-enhanced-highlight'

Plug 'wlangstroth/vim-racket'
Plug 'junegunn/rainbow_parentheses.vim'

Plug 'arcticicestudio/nord-vim'
Plug 'mhinz/vim-startify'

Plug 'unblevable/quick-scope'
" Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
Plug 'lilydjwg/colorizer'

" Unnecessary
Plug 'voldikss/vim-floaterm'
Plug 'liuchengxu/vim-which-key'

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
