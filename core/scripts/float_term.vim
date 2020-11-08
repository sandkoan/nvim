" TERMINAL DRAWER {{{
" depends on: CLEAN UI and Terminal Behavior
nnoremap <silent>``           :call ToggleTerminalDrawer()<CR>
tnoremap <silent>`` <C-\><C-n>:call ToggleTerminalDrawer()<CR>

let g:terminal_drawer_height   = 0.25
let g:terminal_drawer_position = "botright"

let g:terminal_drawer = { 'win_id': v:null, 'buffer_id': v:null }
function! ToggleTerminalDrawer() abort
    if win_gotoid(g:terminal_drawer.win_id)
        hide
        set laststatus=2 showmode ruler
    else
        exec g:terminal_drawer_position . " new"
        if !g:terminal_drawer.buffer_id
            call termopen($SHELL, {"detach": 0})
            let g:terminal_drawer.buffer_id = bufnr("")
        else
            exec 'buffer' g:terminal_drawer.buffer_id
            call RemoveEmptyBuffers()
        endif

        exec 'resize' float2nr(&lines * g:terminal_drawer_height)
        setlocal laststatus=0 noshowmode noruler
        setlocal nobuflisted
        echo ''
        startinsert!
        let g:terminal_drawer.win_id = win_getid()

        tnoremap <buffer><Esc> <C-\><C-n>
        nnoremap <buffer><silent><Esc> :call ToggleTerminalDrawer()<CR>
        nnoremap <buffer><silent> q :call ToggleTerminalDrawer()<CR>
    endif
endfunction
" }}}
" RANGER {{{
function! ToggleRanger()
    echo "Loaded ranger"
    call ToggleTerm('ranger')
endfunction

" }}}
" CREATE FLOATING WINDOW {{{
function! CreateCenteredFloatingWindow()
    let width  = float2nr(&columns * 0.9)
    let height = float2nr(&lines * 0.8)
    let top    = ((&lines - height) / 2) - 1
    let left   = (&columns - width) / 2
    let opts   = { 'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal' }

    let top_line    = "╭" . repeat("─", width - 2) . "╮"
    let mid_line    = "│" . repeat(" ", width - 2) . "│"
    let bot_line    = "╰" . repeat("─", width - 2) . "╯"
    let lines  = [top_line] + repeat([mid_line], height - 2) + [bot_line]
    let s:buf  = nvim_create_buf(v:false, v:true)

    call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
    call nvim_open_win(s:buf, v:true, opts)
    set winhl=Normal:Floating
    call InvertBackground()

    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, CreatePadding(opts))
    autocmd BufWipeout <buffer> exe 'bwipeout '.s:buf
    autocmd BufWipeout <buffer> call ResetBackground()
endfunction

function! CreatePadding(opts)
    let a:opts.row    += 1
    let a:opts.height -= 2
    let a:opts.col    += 2
    let a:opts.width  -= 4
    return a:opts
endfunction
" }}}
" TOGGLE TERMINAL && ON TERMINAL EXIT {{{
function! ToggleTerm(cmd)
    if empty(bufname(a:cmd))
        call CreateCenteredFloatingWindow()
        call termopen(a:cmd, { 'on_exit': function('OnTermExit') })
    else
        bwipeout!
    endif
endfunction

function! OnTermExit(job_id, code, event) dict
    if a:code == 0
        bwipeout!
    endif
endfunction
" }}}
" INVERT && RESET BACKGROUND {{{
function! InvertBackground()
    hi InactiveWindow guibg=NONE
    hi ActiveWindow   guibg=#2c323c
    set winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow
endfunction

function! ResetBackground()
    hi ActiveWindow   guibg=NONE
    hi InactiveWindow guibg=#2c323c
    set winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow
endfunction
" }}}
" REMOVE EMPTY BUFFERS {{{
function! RemoveEmptyBuffers()
    let buffers = filter(range(1, bufnr('$')), 'buflisted(v:val) && empty(bufname(v:val)) && bufwinnr(v:val)<0 && !getbufvar(v:val, "&mod")')
    if !empty(buffers)
        silent exe 'bw ' . join(buffers, ' ')
    endif
endfunction
" }}}
