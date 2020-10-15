if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" Remove annoying step to press <Enter> after running grep
cnoreabbrev <expr> grep  (getcmdtype() ==# ':' && getcmdline() =~# '^grep')  ? 'silent grep'  : 'grep'
cnoreabbrev <expr> lgrep (getcmdtype() ==# ':' && getcmdline() =~# '^lgrep') ? 'silent lgrep' : 'lgrep'

" Navigate errors in quicklist
nnoremap <leader>qf :call searching#QuickFilter()<CR>

" Edit recent files
nnoremap <leader>fr :call searching#FindRecentFiles()<CR>

" Very powerful searching
set wildcharm=<C-z>
" Recursive
" nnoremap <leader>er :e **/*<C-z><S-Tab>
" nnoremap <leader>fr :find **/*<C-z><S-Tab>

" Search under directly of current file
nnoremap <leader>ff :call searching#FindLocalFile()<CR>
