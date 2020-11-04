" Lisp
let g:lisp_rainbow = 1

" Markdown syntax highlighting
let g:markdown_fenced_languages = ['bash=sh', 'zsh', 'python', 'java', 'css', 
            \ 'html', 'cpp', 'c', 'perl', 'ruby', 'vim', 'go', 'rust']

" Python
let python_highlight_all = 1
" Working with virtualenvs causes nvim's python interpreter to get confused
" So I created a separate pipenv for nvim's python interpreter, like `pynvim`
" This is the path to the virtualenv's python executable
" Modify as necessary
if executable('/home/govindg/.local/share/virtualenvs/nvim-PqFkcQ4L/bin/python')
    let g:python3_host_prog = '/home/govindg/.local/share/virtualenvs/nvim-PqFkcQ4L/bin/python'
endif

" RST
let rst_use_emphasis_colors = 1
let rst_fold_enabled = 1

" Rust
let g:rust_conceal = 1
" let g:rust_conceal_mod_path = 1
" let g:rust_conceal_pub = 1
let g:rust_fold = 2
let g:rustfmt_autosave = 1

" Tex
let g:tex_fold_enabled=1

" Sh
let g:sh_fold_enabled= 4

" Ocaml
let g:ocaml_highlight_operators = 1

" Java
let java_highlight_java_lang_ids=1
let java_highlight_functions="style"
" hi link javaParen 
" hi link javaParen1 
" hi link javaParen2


" Vim highlight embedded languages for Lua, Python, Ruby
let g:vimsyn_embed= 'lPr'

" Zsh
let g:zsh_fold_enable = 1
