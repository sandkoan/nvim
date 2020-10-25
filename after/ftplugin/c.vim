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
