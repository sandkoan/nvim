" Aesthetic

if has('nvim-0.5')
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

" Underline matching parentheses
" highlight MatchParen guifg=NONE guibg=NONE gui=underline cterm=underline

" Change matching parentheses color to red
highlight MatchParen guifg=#ff6c6b

" Transparent Background
highlight Normal guibg=NONE ctermbg=NONE
