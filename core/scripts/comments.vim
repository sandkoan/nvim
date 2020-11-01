" Inspired by Tim Pope's commentary.vim
"
" Uses b:commentstring or 'commentstring' as the comment pattern
" example:
"    let &commentstring = '/*%s*/'
 
" nnoremap gcc :<c-u>.,.+<c-r>=v:count<cr>call <SID>toggleComment()<cr>
" nnoremap gc :<c-u>set opfunc=<SID>commentOp<cr>g@
" xnoremap gc :call <SID>toggleComment()<cr>

function! s:commentOp(...)
  '[,']call s:toggleComment()
endfunction
 
function! s:toggleComment() range
  let comment = substitute(get(b:, 'commentstring', &commentstring), '\s*\(%s\)\s*', '%s', '')
  let pattern = '\V' . printf(escape(comment, '\'), '\(\s\{-}\)\s\(\S\.\{-}\)\s\=')
  let replace = '\1\2'
  if getline('.') !~ pattern
    let indent = matchstr(getline('.'), '^\s*')
    let pattern = '^' . indent . '\zs\(\s*\)\(\S.*\)'
    let replace = printf(comment, '\1 \2' . (comment =~ '%s$' ? '' : ' '))
  endif
  for lnum in range(a:firstline, a:lastline)
    call setline(lnum, substitute(getline(lnum), pattern, replace, ''))
  endfor
endfunction
