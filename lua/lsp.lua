if vim.fn.has('nvim-0.5') == 1 then
    vim.api.nvim_command('set completeopt=menuone,noinsert,noselect')
    require'nvim_lsp'.clangd.setup{}
    require'nvim_lsp'.clangd.setup{on_attach=require'completion'.on_attach}

    require'nvim_lsp'.clangd.setup{on_attach=require'diagnostic'.on_attach}

    vim.api.nvim_command('let g:diagnostic_enable_virtual_text = 1')
    vim.api.nvim_command('let g:diagnostic_virtual_text_prefix = ' ' ')

    local lsp_status = require('lsp-status')
    lsp_status.register_progress()

    local nvim_lsp = require('nvim_lsp')

    nvim_lsp.clangd.setup({
        callbacks = lsp_status.extensions.clangd.setup(),
        init_options = {
            clangdFileStatus = true
        },
        on_attach = lsp_status.on_attach,
        capabilities = lsp_status.capabilities
    })
end
