if has('nvim-0.5')

    set completeopt=longest,menuone
    " set completeopt=menuone,noinsert,noselect
    
    " Clangd
    lua require'nvim_lsp'.clangd.setup{}
    lua require'nvim_lsp'.clangd.setup{on_attach=require'completion'.on_attach}
    lua require'nvim_lsp'.clangd.setup{on_attach=require'diagnostic'.on_attach}

    " Ocaml
    lua require'nvim_lsp'.ocamllsp.setup{}
    lua require'nvim_lsp'.ocamllsp.setup{on_attach=require'completion'.on_attach}
    lua require'nvim_lsp'.ocamllsp.setup{on_attach=require'diagnostic'.on_attach}

    let g:diagnostic_enable_virtual_text = 1
    let g:diagnostic_virtual_text_prefix = ' '
    let g:completion_enable_snippet = 'UltiSnips'

    nnoremap <Tab> <Plug>(completion_smart_tab)
    nnoremap <S-Tab> <Plug>(completion_smart_s_tab)

endif
