" The four dimensions of editing 
" https://gist.github.com/deoxys314/255d483688ff103b63c75a66715bf9bf

let s:second = 1
let s:minute = 60 * s:second
let s:hour = 60 * s:minute
let s:day = 24 * s:hour
let s:week = 7 * s:day
let s:month = 30 * s:day
let s:year = 365 * s:day

function! s:get_undo_time(undo_dict) abort
    let l:idx = a:undo_dict.seq_cur
    for l:entry in a:undo_dict.entries
        if l:entry.seq == l:idx
            return l:entry.time
        endif
    endfor
    return localtime()
endfunction

function! status#StatusTimeLine() abort
    let l:undo_dict = undotree()
    if l:undo_dict.seq_cur == l:undo_dict.seq_last | return 'Present' | endif

    let l:delta_t = localtime() - s:get_undo_time(l:undo_dict)
    if l:delta_t > s:year
        return 'More than a year ago'
    elseif l:delta_t > s:month 
        return 'More than a month ago'
    elseif l:delta_t > s:week
        let l:n_weeks = l:delta_t / s:week
        let l:plural = l:n_weeks > 1
        return 'More than ' . l:n_weeks . ' week' . (l:plural ? 's' : '') . ' ago'
    elseif l:delta_t > s:day
        let l:n_days = l:delta_t / s:day
        let l:plural = l:n_days > 1
        return l:n_days . ' day' . (l:plural ? 's' : '') . ' ago'
    elseif l:delta_t > s:hour
        let l:n_hours = l:delta_t / s:hour
        let l:plural = l:n_hours > 1
        return l:n_hours . ' hour' . (l:plural ? 's' : '') . ' ago'
    elseif l:delta_t > s:minute
        let l:n_minutes = l:delta_t / s:minute
        let l:plural = l:n_minutes > 1
        return l:n_minutes . ' minute' . (l:plural ? 's' : '') . ' ago'
    elseif l:delta_t > s:second
        return 'Seconds ago'
    else
        return 'ERROR: Delta T: ' . l:delta_t
    endif
endfunction
