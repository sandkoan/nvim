if has('unix')
" Use a bunch of standard UNIX commands for quick an dirty
" whitespace-based alignment
function! Align()
	'<,'>!column -t|sed 's/  \(\S\)/ \1/g'
	normal gv=
endfunction

xnoremap <silent> <leader>a :<C-u>silent call Align()<CR>
endif
