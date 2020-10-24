if vim.fn.has('nvim-0.5') == 1 then
    require'nvim-treesitter.configs'.setup {
        ensure_installed = { "c", "cpp", "java", "lua", "ocaml", "bash" },     -- one of "all", "language", or a list of languages
        highlight = {
            enable = true,
            use_languagetree = false, -- Use this to enable language injection (this is very unstable)
            -- custom_captures = {
            -- -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
            -- ["foo.bar"] = "Identifier",
            -- },
        },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "gnn",
                node_incremental = "grn",
                scope_incremental = "grc",
                node_decremental = "grm",
            },
        },
        indent = {
            enable = true
        },
    }
    vim.cmd('set foldmethod=expr')
    vim.cmd('set foldexpr=nvim_treesitter#foldexpr()')
end
