nnoremap B ^
nnoremap E $
nnoremap gV `[v`]

let mapleader=" "
inoremap jk <Esc>
inoremap kj <Esc>

nnoremap <Leader>, :nohlsearch<CR>
nnoremap <Leader>u :UndotreeToggle<CR>

" Remapping C-Space to autocompletion
inoremap <C-Space> <C-P>
inoremap <C-@> <C-Space>

" Split Buffers
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>

" Folding
nnoremap <space> za  

" Tabs
nnoremap th  :tabfirst<CR>
nnoremap tk  :tabnext<CR>
nnoremap tj  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>
" Alternatively use
" nnoremap th :tabnext<CR>
" nnoremap tl :tabprev<CR>
" nnoremap tn :tabnew<CR>nnoremap <C-Left> :tabprevious<CR>
" nnoremap <C-Right> :tabnext<CR>

nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>

let notabs = 0
nnoremap <silent> <F8> :let notabs=!notabs<Bar>:if notabs<Bar>:tabo<Bar>:else<Bar>:tab ball<Bar>:tabn<Bar>:endif<CR>
cabbrev tabv tab sview +setlocal\ nomodifiable

" Compiling/Running
autocmd filetype cpp nnoremap <F5> :w <bar> !g++ -ulimit -Wall -Wno-unused-result -std=c++11   -O2   % -o %:r && ./%:r < ./input.txt <CR>
autocmd filetype cpp nnoremap <F6> :w <bar> !g++ -ulimit -Wall -Wno-unused-result -std=c++11   -O2   % -o %:r && ./%:r <CR>
autocmd filetype py nnoremap <F5> :w <bar> !python3 % <CR>
autocmd filetype rkt nnoremap <F5> :w <bar> !racket % <CR>
