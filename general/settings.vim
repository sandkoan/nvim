" Settings

set nocompatible
set encoding=utf-8
set fileformat=unix

syntax on

filetype on 
filetype indent on 
filetype plugin on

" Indenting
set cindent autoindent smartindent

" Autocompletion
set dictionary=/usr/share/dict/words

set omnifunc=syntaxcomplete#Complete
set complete=.,w,b,u,t,i
set path+=.,**

" Wildmenu
set wildmenu
set wildmode=list:longest,full

" Wildmenu ignore vcs, and zipped files
set wildignore=*.swp,*.bak
set wildignore+=*.pyc,*.class,*.sln,*.Master,*.csproj,*.csproj.user,*.cache,*.dll,*.pdb,*.min.*
set wildignore+=*/.git/**/*,*/.hg/**/*,*/.svn/**/*
set wildignore+=tags
set wildignore+=*.tar.*

" Wildmenu ignore case when completing
set wildignorecase

" General/Aesthetic
set nowrap
set mouse=a
set cursorline
set lazyredraw
set scrolloff=8 
set cmdheight=2
set visualbell
set updatetime=50

" System clipboard integration
set clipboard=unnamedplus

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c 
set history=10000

" " Autoresize splits
" set winwidth=79
" set winheight=50

"Undodir + Backups
set undodir=~/.config/nvim/undodir
set undofile
set nobackup
set nowritebackup

" Hybrid line numbers
set number relativenumber

" Regex
set magic

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
set inccommand=split

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Tabs
set tabstop=4 softtabstop=4 shiftwidth=4
set smarttab expandtab

"Folding
set foldenable
set foldlevelstart=20
set foldnestmax=20
set foldmethod=syntax

" Toggle pasting
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode
