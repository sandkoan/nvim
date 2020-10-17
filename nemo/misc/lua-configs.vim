if has ('nvim-0.4')
" Colorizer
lua require'colorizer'.setup()
endif

if has('nvim-0.5')
" Lsp
set completeopt=menuone,noinsert,noselect
lua require'nvim_lsp'.clangd.setup{}
lua require'nvim_lsp'.clangd.setup{on_attach=require'completion'.on_attach}

" Diagnostic-nvim
let g:diagnostic_enable_virtual_text = 1
let g:diagnostic_virtual_text_prefix = ' '

lua require'nvim_lsp'.clangd.setup{on_attach=require'diagnostic'.on_attach}

lua <<EOF
-- require'nvim-treesitter.configs'.setup {
--   ensure_installed = {"c", "cpp"} ,     -- one of "all", "language", or a list of languages
--   highlight = {
--     enable = true,              -- false will disable the whole extension
--     disable = { },  -- list of language that will be disabled
--   },
-- 
--   highlight = {
--     enable = true,
--     custom_captures = { },
--   },
-- 
--   incremental_selection = {
--     enable = true,
--     keymaps = {
--       init_selection = "gnn",
--       node_incremental = "grn",
--       scope_incremental = "grc",
--       node_decremental = "grm",
--     },
--   },
-- }

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

EOF

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
endif
