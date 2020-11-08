if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

command! -nargs=+ -complete=dir -bar Grep lua require'tools'.asyncGrep(<q-args>)
" command! -nargs=+ -complete=dir -bar Lgrep lua require'tools'.asyncLgrep(<q-args>)

cnoreabbrev <expr> grep  (getcmdtype() ==# ':' && getcmdline() ==# 'grep')  ? 'Grep'  : 'grep'
" cnoreabbrev <expr> lgrep  (getcmdtype() ==# ':' && getcmdline() ==# 'lgrep')  ? 'Lgrep'  : 'lgrep'

augroup quickfix
    autocmd!
    autocmd QuickFixCmdPost cgetexpr cwindow
    autocmd QuickFixCmdPost lgetexpr lwindow
augroup END
