" Rainbow parentheses
let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
nnoremap <leader>rp :RainbowParentheses!!
augroup rainbow_lisp
  autocmd!
  autocmd FileType lisp,clojure,scheme,.rkt RainbowParentheses
augroup END


