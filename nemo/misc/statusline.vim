" Inspired by https://gist.github.com/ahmedelgabri/b9127dfe36ba86f4496c8c28eb65ef2b

" Statusline & Tabline/Buffer line
" Dynamically getting the fg/bg colors from the current colorscheme, returns hex which is enough for me to use in Neovim
" Needs to figure out how to return cterm values too
let fgcolor=synIDattr(synIDtrans(hlID("Normal")), "fg", "gui")
let bgcolor=synIDattr(synIDtrans(hlID("Normal")), "bg", "gui")

" Tabline/Buffer line
set showtabline=2
set tabline="%1T"

" Statusline

let s:status_fourth_dim = get(g:, 'statusline_fourth_dimension', 0)

let g:currentmode={
            \ 'n'  : 'N ',
            \ 'no' : 'N·Operator Pending ',
            \ 'v'  : 'V ',
            \ 'V'  : 'V·Line ',
            \ '' : 'V·Block',
            \ 's'  : 'Select ',
            \ 'S'  : 'S·Line ',
            \ '' : 'S·Block ',
            \ 'i'  : 'I ',
            \ 'R'  : 'R ',
            \ 'Rv' : 'V·Replace ',
            \ 'c'  : 'Command ',
            \ 'cv' : 'Vim Ex ',
            \ 'ce' : 'Ex ',
            \ 'r'  : 'Prompt ',
            \ 'rm' : 'More ',
            \ 'r?' : 'Confirm ',
            \ '!'  : 'Shell ',
            \ 't'  : 'Terminal '
            \}

highlight User1 cterm=None gui=None ctermfg=007 guifg=fgcolor
highlight User2 cterm=None gui=None ctermfg=008 guifg=bgcolor
highlight User3 cterm=None gui=None ctermfg=008 guifg=bgcolor
highlight User4 cterm=None gui=None ctermfg=008 guifg=bgcolor
highlight User5 cterm=None gui=None ctermfg=008 guifg=bgcolor
highlight User7 cterm=None gui=None ctermfg=008 guifg=bgcolor
highlight User8 cterm=None gui=None ctermfg=008 guifg=bgcolor
highlight User9 cterm=None gui=None ctermfg=007 guifg=fgcolor

" Automatically change the statusline color depending on mode
function! ChangeStatuslineColor()
    if (mode() =~# '\v(n|no)')
        exe 'hi! StatusLine ctermfg=008 guifg=fgcolor gui=None cterm=None'
    elseif (mode() =~# '\v(v|V)' || g:currentmode[mode()] ==# 'V·Block' || get(g:currentmode, mode(), '') ==# 't')
        exe 'hi! StatusLine ctermfg=005 guifg=#82CC6A gui=None cterm=None'
    elseif (mode() ==# 'i')
        exe 'hi! StatusLine ctermfg=004 guifg=#6CBCE8 gui=None cterm=None'
    else
        exe 'hi! StatusLine ctermfg=006 guifg=#ECBE7B gui=None cterm=None'
    endif

    return ''
endfunction

" Find out current buffer's size and output it.
function! FileSize()
    let bytes = getfsize(expand('%:p'))
    if (bytes >= 1024)
        let kbytes = bytes / 1024
    endif
    if (exists('kbytes') && kbytes >= 1000)
        let mbytes = kbytes / 1000
    endif

    if bytes <= 0
        return '0'
    endif

    if (exists('mbytes'))
        return mbytes . ' MB '
    elseif (exists('kbytes'))
        return kbytes . ' KB '
    else
        return bytes . ' B '
    endif
endfunction

function! ReadOnly()
    if &readonly || !&modifiable
        return ''
    else
        return ''
    endif
endfunction

function! GitBranch()
    return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
    let l:branchname = GitBranch()
    if strlen(l:branchname) > 0
        return ' '.l:branchname
    else
        return ''
    endif
endfunction

" if has('nvim-0.5')
    " function! LspStatus() abort
        " if luaeval('#vim.lsp.buf_get_clients() > 0')
            " return luaeval("require('lsp-status').status()")
        " endif
        " return ''
    " endfunction
" endif

set laststatus=2
set statusline=
set statusline+=%{ChangeStatuslineColor()}               " Changing the statusline color
set statusline+=%0*\ %{toupper(g:currentmode[mode()])}   " Current mode
set statusline+=%8*\ [%n]                                " buffernr
set statusline+=%8*\ %{StatuslineGit()}                  " Git Branch name
set statusline+=%8*\ %<%F\ %{ReadOnly()}\ %m\ %w\        " File+path
set statusline+=%=
set statusline+=%#warningmsg#                            " Warning messages
" if has('nvim-0.5')
    " set statusline+=%{LspStatus()}                           " Nvim Lsp Info
" endif
set statusline+=%*
set statusline+=%9*\ %=                                  " Space
set statusline+=%8*\ %y\                                 " FileType
set statusline+=%8*\ %-3(%{FileSize()}%)                 " File size
set statusline+=%0*\%3p%%\ \ %l:\ %3c\                  " Rownumber, total (%)

if s:status_fourth_dim == '1'
    set statusline+=\ z:%{foldlevel(line('.'))}              " Fold level of current line
    set statusline+=\ t:%{status#StatusTimeLine()}           " Time level
endif
