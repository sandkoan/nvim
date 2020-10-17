let mapleader="\<Space>"
let maplocalleader=","

nnoremap <Leader><CR> :so $MYVIMRC<CR>
nnoremap <Leader>u :UndotreeToggle<CR>

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

nnoremap B 0
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
nnoremap <C-j> ciW<CR><Esc>:if match( @", "^\\s*$") < 0<Bar>exec "norm P-$diw+"<Bar>endif<CR>

" 'cd' towards the directory in which the current file is edited
" but only change the path for the current window
nnoremap <leader>cd :lcd %:h<CR>

" Turn off highlighting after search
nnoremap <Leader>, :nohl<CR>

" Remapping C-Space to autocompletion
inoremap <C-@> <C-Space>
inoremap <C-Space> <C-P>

" Tab trhough completion pop up menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Empty buffer prompt in wildmenu
set wildcharm=<C-z>
nnoremap ,e :e **/*<C-z><S-Tab>
nnoremap ,f :find **/*<C-z><S-Tab>

" Session management
nnoremap <leader>so :OpenSession<Space>
nnoremap <leader>ss :SaveSession<Space>
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>

" Tags
nnoremap <leader>gt :tjump /

" Buffers
set hidden

nnoremap <Leader>bh :bprevious<CR>
nnoremap <Leader>bl :bnext<CR>
nnoremap <Leader>bk :bfirst<CR>
nnoremap <Leader>bj :blast<CR>
nnoremap <Leader>bd :bd<CR>

nnoremap <leader>bp :buffer <C-z><S-Tab>
nnoremap <leader>Bp :sbuffer <C-z><S-Tab>

" Flying with buffers
nnoremap <C-b> :ls<CR>:b<Space>
nnoremap <leader>bo :b#<CR>

" Windows
" Creating splits
noremap <Leader>ws :<C-u>split<CR>
noremap <Leader>wv :<C-u>vsplit<CR>

" Resizing splits
nnoremap <leader>wi :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <Leader>w+ :vertical resize +5<CR>
nnoremap <Leader>w- :vertical resize -5<CR>
nnoremap <leader>w= <C-w>=

" Navigating splits
nnoremap <leader>wh <C-w>h
nnoremap <leader>wj <C-w>j
nnoremap <leader>wk <C-w>k
nnoremap <leader>wl <C-w>l

" Moving splits
nnoremap <leader>wr <C-w>r
nnoremap <leader>wH <C-w>H
nnoremap <leader>wJ <C-w>J
nnoremap <leader>wK <C-w>K
nnoremap <leader>wL <C-w>K

" Tabs
let notabs = 0
nnoremap <leader>th :tabfirst<CR>
nnoremap <leader>tk :tabnext<CR>
nnoremap <leader>tj :tabprev<CR>
nnoremap <leader>tl :tablast<CR>
nnoremap <leader>tt :tabedit<Space>
nnoremap <leader>tn :tabnext<Space>
nnoremap <leader>tm :tabmove<Space>
nnoremap <leader>td :tabclose<CR>

" Switch tab positions with Alt + h/l
nnoremap <silent> <A-h> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-l> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>
" Same thing with Alt + arrow keys
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>
nnoremap <silent> <F8> :let notabs=!notabs<Bar>:if notabs<Bar>:tabo<Bar>:else<Bar>:tab ball<Bar>:tabn<Bar>:endif<CR>
cabbrev tabv tab sview +setlocal\ nomodifiable

" Emacs keybindings in Command Mode
" start of line
cnoremap <C-A> <Home>
" back one character
cnoremap <C-B> <Left>
" delete character under cursor
cnoremap <C-D> <Del>
" end of line
cnoremap <C-E> <End>
" forward one character
cnoremap <C-F> <Right>
" recall newer command-line
cnoremap <C-N> <Down>
" recall previous (older) command-line
cnoremap <C-P> <Up>
" back one word
cnoremap <Esc><C-B> <S-Left>
" forward one word
cnoremap <Esc><C-F> <S-Right>

nnoremap <silent> <Leader>S :call misc#ToggleSpellCheck()<CR>

nnoremap <C-t> :call misc#Toggle_transparent()<CR>

nnoremap <leader>cuc :call misc#GetColorUnderCursor()<CR>

command! FixWhitespace :%s/\s\+$//e
