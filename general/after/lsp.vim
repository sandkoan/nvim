" Lsp
lua require'nvim_lsp'.clangd.setup{on_attach=require'completion'.on_attach}
" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
