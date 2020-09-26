lua <<EOF
-- totally optional to use setup
require('telescope').setup{
  defaults = {
    shorten_path = false -- currently the default value is true
  }
}
EOF

nnoremap <c-p> :lua require'telescope.builtin'.find_files{}<CR>
nnoremap <silent> <leader>ar <cmd>lua require'telescope.builtin'.lsp_references{ shorten_path = true }<CR>
