let mapleader="\<Space>"
let localleader=","

nnoremap <Leader><CR> :so $MYVIMRC<CR>

inoremap jk <Esc>
inoremap kj <Esc>

" Accidents
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

nnoremap B ^
nnoremap E $
nnoremap gV `[v`]

" Insert new line in normal mode
nnoremap [o o<Esc>
nnoremap [O O<esc>
" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Split a line into two at the cursor
nnoremap <C-J> ciW<CR><Esc>:if match( @", "^\\s*$") < 0<Bar>exec "norm P-$diw+"<Bar>endif<CR>

" Change to current directory
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" Turn off highlighting after search
nnoremap <Leader>, :nohl<CR>

" Remapping C-Space to autocompletion
inoremap <C-@> <C-Space>
inoremap <C-Space> <C-P>

" Buffers
set hidden

nnoremap <Leader>bh :bprevious<CR>
nnoremap <Leader>bl :bnext<CR>
nnoremap <Leader>bk :bfirst<CR>
nnoremap <Leader>bj :blast<CR>

" Flying with buffers
nnoremap <C-b> :ls<CR>:b<Space>

" Creating splits
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

" Resizing splits
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>

" Navigating splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Tabs
let notabs = 0
nnoremap <leader>th :tabfirst<CR>
nnoremap <leader>tk :tabnext<CR>
nnoremap <leader>tj :tabprev<CR>
nnoremap <leader>tl :tablast<CR>
nnoremap <leader>tt :tabedit<Space>
nnoremap <leader>tn :tabnext<Space>
nnoremap <leader>tm :tabm<Space>
nnoremap <leader>td :tabclose<CR>

" Switch tab positions with Alt + h/l
nnoremap <silent> <A-h> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-l> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>
nnoremap <silent> <F8> :let notabs=!notabs<Bar>:if notabs<Bar>:tabo<Bar>:else<Bar>:tab ball<Bar>:tabn<Bar>:endif<CR>
cabbrev tabv tab sview +setlocal\ nomodifiable

" Toggle spellchecking
function! ToggleSpellCheck()
  set spell!
  if &spell
    echo "Spellcheck ON"
  else
    echo "Spellcheck OFF"
  endif
endfunction
nnoremap <silent> <Leader>S :call ToggleSpellCheck()<CR>

" Toggle transparancy
let t:is_transparent = 0
function! Toggle_transparent()
  if t:is_transparent == 0
    highlight Normal guibg=NONE ctermbg=NONE
    let t:is_transparent = 1
  else
    set background=dark
    let t:is_tranparent = 0
  endif
endfunction
nnoremap <C-t> : call Toggle_transparent()<CR>

command! FixWhitespace :%s/\s\+$//e

augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

