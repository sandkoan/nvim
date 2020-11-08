let g:resize_active=0
function! ToggleResizeMode()
    if g:resize_active == 0
        let g:resize_active = 1
        echom 'Resize Mode'
        
        " Esc should exit
        nnoremap <Esc> :call ToggleResizeMode()<CR>
        
        " Switch to navigating keys
        nnoremap a :windcmd h<CR>
        nnoremap s :windcmd j<CR>
        nnoremap d :windcmd k<CR>
        nnoremap f :windcmd l<CR>
        
        " Switch to resize keys
        nnoremap h :wincmd < <CR>
        nnoremap j :wincmd - <CR>
        nnoremap k :wincmd + <CR>
        nnoremap l :wincmd > <CR>
        
        nnoremap <Left>  :wincmd < <CR>
        nnoremap <Down>  :wincmd - <CR>
        nnoremap <Up>    :wincmd + <CR>
        nnoremap <Right> :wincmd > <CR>
        
        " Switch to window moving keys
        nnoremap H :wincmd H    <CR>
        nnoremap J :wincmd J    <CR>
        nnoremap K :wincmd K    <CR>
        nnoremap L :wincmd L    <CR>
        nnoremap = :wincmd =    <CR>
        nnoremap _ :wincmd _    <CR>
        nnoremap + :wincmd <bar><CR>
        
    else
        let g:resize_active = 0
        
        " Switch back to 'normal' keys
        nnoremap <Esc> <Esc>
        
        nnoremap a a
        nnoremap s s
        nnoremap d d
        nnoremap f f
        
        nnoremap <expr> k      v:count == 0 ? 'gk' : 'k'
        nnoremap <expr> j      v:count == 0 ? 'gj' : 'j'
        nnoremap <expr> <Up>   v:count == 0 ? "g\<Up>" : "\<Up>"
        nnoremap <expr> <Down> v:count == 0 ? "g\<Down>" : "\<Down>"
        nnoremap <Left> <Left>
        nnoremap <Right> <Right>

        nnoremap K K
        nnoremap J J
        nnoremap H ^
        nnoremap L $
        nnoremap = =
        nnoremap _ _
        nnoremap + +
        
        echom ''
    endif
endfunction

nnoremap <silent> <Leader>w :call ToggleResizeMode()<CR>
