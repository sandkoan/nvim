" Interactive fuzzy finder
" TODO Integrate these with the newly added vim patch
" For fuzzy searching -> called 'matchfuzzy'

if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" Remove annoying step to press <Enter> after running grep
cnoreabbrev <expr> grep  (getcmdtype() ==# ':' && getcmdline() =~# '^grep')  ? 'silent grep'  : 'grep'
cnoreabbrev <expr> lgrep (getcmdtype() ==# ':' && getcmdline() =~# '^lgrep') ? 'silent lgrep' : 'lgrep'


fun! FilterClose(bufnr)
    wincmd p
    execute "bwipe" a:bufnr
    redraw
    echo "\r"
    return []
endf

fun! Finder(input, prompt) abort
    let l:prompt = a:prompt . '>'
    let l:filter = ""
    let l:undoseq = []
    botright 10new +setlocal\ buftype=nofile\ bufhidden=wipe\
                \ nobuflisted\ nonumber\ norelativenumber\ noswapfile\ nowrap\
                \ foldmethod=manual\ nofoldenable\ modifiable\ noreadonly
    let l:cur_buf = bufnr('%')
    if type(a:input) ==# v:t_string
        let l:input = systemlist(a:input)
        call setline(1, l:input)
    else " Assume List
        call setline(1, a:input)
    endif
    setlocal cursorline
    redraw
    echo l:prompt . " "
    while 1
        let l:error = 0 " Set to 1 when pattern is invalid
        try
            let ch = getchar()
        catch /^Vim:Interrupt$/  " CTRL-C
            return FilterClose(l:cur_buf)
        endtry
        if ch ==# "\<bs>" " Backspace
            let l:filter = l:filter[:-2]
            let l:undo = empty(l:undoseq) ? 0 : remove(l:undoseq, -1)
            if l:undo
                silent norm u
            endif
        elseif ch >=# 0x20 " Printable character
            let l:filter .= nr2char(ch)
            let l:seq_old = get(undotree(), 'seq_cur', 0)
            try " Ignore invalid regexps
                execute 'silent keepp g!:\m' . escape(l:filter, '~\[:') . ':norm "_dd'
            catch /^Vim\%((\a\+)\)\=:E/
                let l:error = 1
            endtry
            let l:seq_new = get(undotree(), 'seq_cur', 0)
            " seq_new != seq_old iff the buffer has changed
            call add(l:undoseq, l:seq_new != l:seq_old)
        elseif ch ==# 0x1B " Escape
            return FilterClose(l:cur_buf)
        elseif ch ==# 0x0D " Enter
            let l:result = empty(getline('.')) ? [] : [getline('.')]
            call FilterClose(l:cur_buf)
            return l:result
        elseif ch ==# 0x0C " CTRL-L (clear)
            call setline(1, type(a:input) ==# v:t_string ? l:input : a:input)
            let l:undoseq = []
            let l:filter = ""
            redraw
        elseif ch ==# 0x0B " CTRL-K
            norm k
        elseif ch ==# 0x0A " CTRL-J
            norm j
        endif
        redraw
        echo (l:error ? "[Invalid pattern] " : "").l:prompt l:filter
    endwhile
endf

" Edit most recently used files
function! EditRecentFiles()
    let paths = Finder(v:oldfiles, 'Choose file')
    if !empty(paths)
        execute "args" join(map(paths, 'fnameescape(v:val)'))
    endif
endfunction

" Edit files in current directory
function! FindLocalFile()
    if executable('fd')
        let choice = Finder('fd --type file --hidden --no-ignore .', "Choose file")
        if !empty(choice)
            execute "edit" choice[0]
        endif
    elseif executable('rg')
        let choice = Finder('rg --files --hidden .', "Choose file")
        if !empty(choice)
            execute "edit" choice[0]
        endif
    else
        let choice = Finder('find . -type f', "Choose file")
        if !empty(choice)
            execute "edit" choice[0]
        endif
    endif
endfunction

" Filter quicklist and jump to item
function! QuickFilter()
    let qfentry = Finder(split(execute('clist'), "\n"), 'Choose qf entry')
    if !empty(qfentry)
        execute "crewind" matchstr(qfentry[0], '^\s*\d\+', )
    endif
endfunction

" Keys:

" Navigate errors in quicklist
nnoremap <leader>qf :call QuickFilter()<CR>

" Edit recent files
nnoremap <leader>er :call EditRecentFiles()<CR>

" Very powerful searching
set wildcharm=<C-z>
" Recursive
nnoremap <leader>er :e **/*<C-z><S-Tab>
nnoremap <leader>fr :find **/*<C-z><S-Tab>

" Search under directly of current file
nnoremap <leader>fc :call FindLocalFile()

" nnoremap <leader>F :find <C-R>=expand('%:h').'/*'<CR>
" nnoremap <leader>FS :sfind <C-R>=expand('%:h').'/*'<CR>
" nnoremap <leader>FV :vert sfind <C-R>=expand('%:h').'/*'<CR>
" nnoremap <leader>FT :tabfind <C-R>=expand('%:h').'/*'<CR>

" nnoremap <leader>f :find *
" nnoremap <leader>fs :sfind *
" nnoremap <leader>fv :vert sfind *
" nnoremap <leader>ft :tabfind *
