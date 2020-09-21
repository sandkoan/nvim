let mapleader="\<Space>"
let maplocalleader=","

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
nnoremap <C-j> ciW<CR><Esc>:if match( @", "^\\s*$") < 0<Bar>exec "norm P-$diw+"<Bar>endif<CR>

" Change to current directory
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" Turn off highlighting after search
nnoremap <Leader>, :nohl<CR>

" Remapping C-Space to autocompletion
inoremap <C-@> <C-Space>
inoremap <C-Space> <C-P>
" Tab trhough completion pop up menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" File searching
nnoremap <leader>f :find *
nnoremap <leader>fs :sfind *
nnoremap <leader>fv :vert sfind *
nnoremap <leader>ft :tabfind *

" Search under directly of current file
nnoremap <leader>F :find <C-R>=expand('%:h').'/*'<CR>
nnoremap <leader>FS :sfind <C-R>=expand('%:h').'/*'<CR>
nnoremap <leader>FV :vert sfind <C-R>=expand('%:h').'/*'<CR>
nnoremap <leader>FT :tabfind <C-R>=expand('%:h').'/*'<CR>

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
nnoremap <Leader>bf :ls<CR>:b<Space>
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

" Misc Functions and Keybindings
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

function! GetColorUnderCursor()
    echo synIDattr(synIDtrans(synID(line("."), col("."), 1)), "fg")
endfunction
nnoremap <leader>cuc :call GetColorUnderCursor()<CR>

