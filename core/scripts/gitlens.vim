" Git lens

lua vim.api.nvim_command [[autocmd CursorHold   * lua require'utils'.blameVirtText()]]
lua vim.api.nvim_command [[autocmd CursorMoved  * lua require'utils'.clearBlameVirtText()]]
lua vim.api.nvim_command [[autocmd CursorMovedI * lua require'utils'.clearBlameVirtText()]]

hi! link GitLens Comment
