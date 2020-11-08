if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" Async grep
command! -nargs=+ -complete=dir -bar Grep lua require'tools'.asyncGrep(<q-args>)
" command! -nargs=+ -complete=dir -bar Lgrep lua require'tools'.asyncLgrep(<q-args>)

cnoreabbrev <expr> grep  (getcmdtype() ==# ':' && getcmdline() ==# 'grep')  ? 'Grep'  : 'grep'
" cnoreabbrev <expr> lgrep  (getcmdtype() ==# ':' && getcmdline() ==# 'lgrep')  ? 'Lgrep'  : 'lgrep'

augroup quickfix
    autocmd!
    autocmd QuickFixCmdPost cgetexpr cwindow
    autocmd QuickFixCmdPost lgetexpr lwindow
augroup END

" Async make
if has("nvim")
  command! -nargs=* -complete=file_in_path Make lua require'tools'.make(<q-args>)
else
  command! -nargs=* -complete=file_in_path Make silent make!
endif

cnoreabbrev <expr> make  (getcmdtype() ==# ':' && getcmdline() ==# 'make')  ? 'Make'  : 'make'
