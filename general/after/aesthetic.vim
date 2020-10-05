" Aesthetic

if has('nvim-0.5.0')
  augroup LuaHighlight
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
  augroup END
endif

set termguicolors
colorscheme one

" Conceal char
set conceallevel=2

" Vertical line at 80 characters
set colorcolumn=80 

" Differentiate whitespaces
set list
set listchars=space:·,tab:›\ ,extends:›,precedes:‹,nbsp:·,trail:·
" set listchars+=eol:↓
highlight WhiteSpaceBol guifg=NONE
highlight WhiteSpaceMol guifg=NONE
match WhiteSpaceMol / /
2match WhiteSpaceBol /^ \+/

set showmatch
set matchtime=3
nnoremap <M-m> %
highlight MatchParen guifg=NONE guibg=NONE gui=underline cterm=underline
highlight Normal guibg=NONE ctermbg=NONE
