setlocal makeprg=lua\ %

" setlocal efm=%s:\ %f:%l:%m

setlocal errorformat =
            \ '%f:%l:%c: %m,'.
            \ '%-G%.%#'

