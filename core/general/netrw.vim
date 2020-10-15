" absolute width of netrw window
let g:netrw_winsize = 25

" do not display info on the top of window
let g:netrw_banner = 0

" tree-view
let g:netrw_liststyle = 3

" sort is affecting only: directories on the top, files below
let g:netrw_sort_sequence = '[\/]$,*'

" use the previous window to open file
let g:netrw_browse_split = 4

let g:netrw_altv = 1

" initialize netrw with dotfiles hidden
" type gh to toggle do file hiding
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'

" augroup ProjectDrawer
  " autocmd!
  " autocmd VimEnter * :Vexplore
" augroup END

