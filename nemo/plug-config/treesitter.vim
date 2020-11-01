if has('nvim-0.5')
lua << EOF
    require'nvim-treesitter.configs'.setup {
            ensure_installed = { "c", "cpp", "lua", "bash", "python", "ocaml", "go" },     -- one of "all", "language", or a list of languages
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
                    init_selection = "<Leader>li",
                    node_incremental = "<Leader>ln",
                    scope_incremental = "<Leader>ls",
                    node_decremental = "<Leader>lp",
                },
            },
            indent = {
                enable = true
            },
        }

EOF
    set foldmethod=expr
    set foldexpr=nvim_treesitter#foldexpr()
endif

