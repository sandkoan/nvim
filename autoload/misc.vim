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

function! misc#GetColorUnderCursor()
    echo synIDattr(synIDtrans(synID(line("."), col("."), 1)), "fg")
endfunction
