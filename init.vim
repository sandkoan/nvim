" Function to source all .vim files in a directory
function! SourceDirectory(file)
  for s:fpath in split(globpath(a:file, '*.vim'), '\n')
    exe 'source' s:fpath
  endfor
endfunction

source $HOME/.config/nvim/vim-plug/plugins.vim

call SourceDirectory('$HOME/.config/nvim/plug-config')
call SourceDirectory('$HOME/.config/nvim/general')
call SourceDirectory('$HOME/.config/nvim/my-scripts')

" Aesthetic
set termguicolors

colorscheme nord

" Conceal char
set conceallevel=2

" Vertical line at 80 characters
set colorcolumn=80 
" highlight ColorColumn ctermbg=NONE guibg=lightgrey

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
map <M-m> %
highlight MatchParen guifg=NONE guibg=NONE gui=underline cterm=underline
highlight Normal guibg=NONE ctermbg=NONE
