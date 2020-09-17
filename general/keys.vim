let mapleader="\<Space>"

inoremap jk <Esc>
inoremap kj <Esc>

" Accidents
nnoremap :W :w
nnoremap :Q! :q!
nnoremap :wQ :wq
nnoremap :Wq :wq

nnoremap B ^
nnoremap E $
nnoremap gV `[v`]

nnoremap [o o<Esc>
nnoremap [O O<esc>
nnoremap <C-J> ciW<CR><Esc>:if match( @", "^\\s*$") < 0<Bar>exec "norm P-$diw+"<Bar>endif<CR>

nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

nnoremap <Leader>, :nohlsearch<CR>
nnoremap <Leader>u :UndotreeToggle<CR>

nnoremap <Leader>f :Lex<CR>

" Remapping C-Space to autocompletion
inoremap <C-@> <C-Space>
inoremap <C-Space> <C-P>

" Buffers
set hidden

nnoremap <Leader>h :bprevious<CR>
nnoremap <Leader>l :bnext<CR>
nnoremap <Leader>k :bfirst<CR>
nnoremap <Leader>j :blast<CR>

" Flying with buffers
nnoremap <C-b> :ls<CR>:b<Space>

nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader><CR> :so $MYVIMRC<CR>

" Split Buffers
" nnoremap <Leader>h <C-w>h
" nnoremap <Leader>j <C-w>j
" nnoremap <Leader>k <C-w>k
" nnoremap <Leader>l <C-w>l

" Tabs
let notabs = 0
nnoremap th  :tabfirst<CR>
nnoremap tk  :tabnext<CR>
nnoremap tj  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>
nnoremap <silent> <F8> :let notabs=!notabs<Bar>:if notabs<Bar>:tabo<Bar>:else<Bar>:tab ball<Bar>:tabn<Bar>:endif<CR>
cabbrev tabv tab sview +setlocal\ nomodifiable

" Compiling/Running
autocmd filetype cpp nnoremap <F5> :w <bar> !g++ -ulimit -Wall -Wno-unused-result -std=c++11   -O2   % -o %:r && ./%:r < ./input.txt <CR>
autocmd filetype cpp nnoremap <F6> :w <bar> !g++ -ulimit -Wall -Wno-unused-result -std=c++11   -O2   % -o %:r && ./%:r <CR>
autocmd filetype py nnoremap <F5> :w <bar> !python3 % <CR>
autocmd filetype rkt nnoremap <F5> :w <bar> !racket % <CR>

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
