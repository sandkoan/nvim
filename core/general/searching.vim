if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" Automatically open quickfix window if grep returns results
function! Grep(...)
    return system(join([&grepprg] + [expandcmd(join(a:000, ' '))], ' '))
endfunction

command! -nargs=+ -complete=file_in_path -bar Grep  cgetexpr Grep(<f-args>)
command! -nargs=+ -complete=file_in_path -bar LGrep lgetexpr Grep(<f-args>)

" Remove annoying step to press <Enter> after running grep
cnoreabbrev <expr> grep  (getcmdtype() ==# ':' && getcmdline() ==# 'grep')  ? 'Grep'  : 'grep'
cnoreabbrev <expr> lgrep (getcmdtype() ==# ':' && getcmdline() ==# 'lgrep') ? 'LGrep' : 'lgrep'

augroup quickfix
    autocmd!
    autocmd QuickFixCmdPost cgetexpr cwindow
    autocmd QuickFixCmdPost lgetexpr lwindow
augroup END

" Navigate errors in quicklist
" nnoremap <leader>qf :call searching#QuickFilter()<CR>

" Edit recent files
" nnoremap <leader>fr :call searching#FindRecentFiles()<CR>

" Very powerful searching
" set wildcharm=<C-z>
" Recursive
" nnoremap <leader>er :e **/*<C-z><S-Tab>
" nnoremap <leader>fr :find **/*<C-z><S-Tab>

" Search under directly of current file
" nnoremap <leader>ff :call searching#FindLocalFile()<CR>
