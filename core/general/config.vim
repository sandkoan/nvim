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
