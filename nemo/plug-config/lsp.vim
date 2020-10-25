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

    function! LSPSetMappings()
        setlocal omnifunc=v:lua.vim.lsp.omnifunc

        nnoremap <buffer> <silent> <C-]>        <cmd>lua vim.lsp.buf.definition()<CR>
        nnoremap <buffer> <silent> K            <cmd>lua vim.lsp.buf.hover()<CR>
        nnoremap <buffer> <silent> <C-k>        <cmd>lua vim.lsp.buf.signature_help()<CR>
        nnoremap <buffer> <silent> gD           <cmd>lua vim.lsp.buf.implementation()<CR>
        nnoremap <buffer> <silent> 1gD          <cmd>lua vim.lsp.buf.type_definition()<CR>
        nnoremap <buffer> <silent> gr           <cmd>lua vim.lsp.buf.references()<CR>
        nnoremap <buffer> <silent> gR           <cmd>lua vim.lsp.buf.rename()<CR>
        nnoremap <buffer> <silent> g0           <cmd>lua vim.lsp.buf.document_symbol()<CR>
        nnoremap <buffer> <silent> gW           <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
        nnoremap <buffer> <silent> gd           <cmd>lua vim.lsp.buf.declaration()<CR>
    endfunction
endif
