if executable('ranger')
    " Make Ranger replace netrw and be the file explorer
    let g:rnvimr_ex_enable = 1
    let g:rnvimr_draw_border = 1
    nnoremap <Leader>f :RnvimrToggle<CR>
endif
