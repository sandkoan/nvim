" Misc Functions

" Toggle spellchecking
function! misc#ToggleSpellCheck()
    set spell!
    if &spell
        echo "Spellcheck ON"
    else
        echo "Spellcheck OFF"
    endif
endfunction

" Toggle transparancy
let t:is_transparent = 0
function! misc#Toggle_transparent()
    if t:is_transparent == 0
        highlight Normal guibg=NONE ctermbg=NONE
        let t:is_transparent = 1
    else
        set background=dark
        let t:is_tranparent = 0
    endif
endfunction

function! misc#GetColorUnderCursor()
    echo synIDattr(synIDtrans(synID(line("."), col("."), 1)), "fg")
endfunction
