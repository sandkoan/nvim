if has('nvim-0.5')

    " Use <Tab> and <S-Tab> to navigate through popup menu
    inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

    " Set completeopt to have a better completion experience
    set completeopt=menuone,noinsert,noselect

lua << EOF
    local on_attach_vim = function(client)
        require'completion'.on_attach(client)
        require'diagnostic'.on_attach(client)
    end
    require'nvim_lsp'.pyls.setup{on_attach=on_attach_vim}
    require'nvim_lsp'.ocamllsp.setup{on_attach=on_attach_vim}
    require'nvim_lsp'.clangd.setup{on_attach=on_attach_vim}

--    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
--      vim.lsp.diagnostic.on_publish_diagnostics, {
--        -- This will disable virtual text, like doing:
--        -- let g:diagnostic_enable_virtual_text = 0
--        virtual_text = {
--            prefix = ''
--        },
--
--        -- This is similar to:
--        -- let g:diagnostic_show_sign = 1
--        -- To configure sign display,
--        --  see: ":help vim.lsp.diagnostic.set_signs()"
--        signs = true,
--
--        -- This is similar to:
--        -- "let g:diagnostic_insert_delay = 1"
--        update_in_insert = false,
--      }
--    )

EOF

let g:completion_enable_snippet = 'UltiSnips'
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy', 'all']
let g:completion_matching_smart_case = 1

" nnoremap <Tab> <Plug>(completion_smart_tab)
" nnoremap <S-Tab> <Plug>(completion_smart_s_tab)

    function! LSPSetMappings()
        setlocal omnifunc=v:lua.vim.lsp.omnifunc

        nnoremap <buffer> <silent> <C-]>  <cmd>lua vim.lsp.buf.definition()<CR>
        nnoremap <buffer> <silent> K      <cmd>lua vim.lsp.buf.hover()<CR>
        nnoremap <buffer> <silent> <C-k>  <cmd>lua vim.lsp.buf.signature_help()<CR>
        nnoremap <buffer> <silent> gD     <cmd>lua vim.lsp.buf.implementation()<CR>
        nnoremap <buffer> <silent> 1gD    <cmd>lua vim.lsp.buf.type_definition()<CR>
        nnoremap <buffer> <silent> gr     <cmd>lua vim.lsp.buf.references()<CR>
        nnoremap <buffer> <silent> gR     <cmd>lua vim.lsp.buf.rename()<CR>
        nnoremap <buffer> <silent> g0     <cmd>lua vim.lsp.buf.document_symbol()<CR>
        nnoremap <buffer> <silent> gW     <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
        nnoremap <buffer> <silent> gd     <cmd>lua vim.lsp.buf.declaration()<CR>
    endfunction

endif
