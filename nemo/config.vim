" Leader
let mapleader="\<Space>"
let maplocalleader=","

" Folding
set foldenable
set foldlevelstart=20
set foldnestmax=20

" Comment out if not suing treesitter{{{
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
"}}}


" Tabs
set tabstop=4 softtabstop=4 shiftwidth=4
set smarttab expandtab

" Regex
set magic

" Working with virtualenvs causes nvim's python interpreter to get confused
" So I created a separate pipenv for nvim's python interpreter, with modules like `pynvim`
" This is the path to the virtualenv's python executable, modify as necessary
if executable('/home/govindg/.local/share/virtualenvs/nvim-PqFkcQ4L/bin/python')
    let g:python3_host_prog = '/home/govindg/.local/share/virtualenvs/nvim-PqFkcQ4L/bin/python'
endif
