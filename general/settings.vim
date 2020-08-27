syntax on

filetype on 
filetype indent on 
filetype plugin on

" Autocompletion
set omnifunc=syntaxcomplete#Complete

" General/Aesthetic
set nocompatible
set cursorline
set lazyredraw

" Recursive searching for wildmenu
set path+=**
set wildmenu
set wildmode=list:longest,full

set showmatch
set nowrap
set mouse=a
set smartcase
set clipboard=unnamedplus
set cmdheight=2
set updatetime=50
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c 
" set history=1000

"Undodir + Backups
set undodir=~/.config/nvim/undodir
set undofile
set nobackup
set nowritebackup

" Line numbers
set number relativenumber

" Searching
set hlsearch
set incsearch
set ignorecase

" Regex
set magic

set visualbell
set hidden

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Tabs{{{
set tabstop=4 softtabstop=4 shiftwidth=4
set smarttab smartindent
set expandtab
"}}}

"Folding{{{
set foldenable
set foldlevelstart=20
set foldnestmax=20
augroup vimrc
  au BufReadPre * setlocal foldmethod=indent
  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END
"}}}

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" set encoding=utf-8
" set fileformat=unix

set termguicolors
set scrolloff=8 

" Vertical line at 80 characters
set colorcolumn=80 
highlight ColorColumn ctermbg=NONE guibg=lightgrey

" Differentiate whitespaces
set list
set listchars=tab:-\ ,trail:\ ,extends:#,nbsp:\

" Toggle transparancy{{{
let t:is_transparent = 0
function! Toggle_transparent()
    if t:is_transparent == 0
        highlight Normal guibg=NONE ctermbg=NONE
        let t:is_transparent = 1
    else
        set background=dark
        let t:is_tranparent = 0
    endif
endfunction
nnoremap <C-t> : call Toggle_transparent()<CR>
"}}}
