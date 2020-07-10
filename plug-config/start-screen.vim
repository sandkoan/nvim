" Startify

let g:startify_custom_header = [
 \'     _   __                      ___',
 \'    / | / /__  ____ ___  ____   <  /',
 \'   /  |/ / _ \/ __ `__ \/ __ \  / / ',
 \'  / /|  /  __/ / / / / / /_/ / / /  ',
 \' /_/ |_/\___/_/ /_/ /_/\____/ /_/   ',
 \]


" let g:startify_custom_footer = [
" '   .o oOOOOOOOo                                            0OOOo   '
" "    Ob.OOOOOOOo  OOOo.      oOOo.                      .adOOOOOOO
" "    OboO000000000000.OOo. .oOOOOOo.    OOOo.oOOOOOo..0000000000OO
" "    OOP.oOOOOOOOOOOO 0POOOOOOOOOOOo.   `0OOOOOOOOOP,OOOOOOOOOOOB'
" "    `O'OOOO'     `OOOOo"OOOOOOOOOOO` .adOOOOOOOOO"oOOO'    `OOOOo
" "    .OOOO'            `OOOOOOOOOOOOOOOOOOOOOOOOOO'            `OO
" "    OOOOO                 '"OOOOOOOOOOOOOOOO"`                oOO
" "   oOOOOOba.                .adOOOOOOOOOOba               .adOOOOo.
" "  oOOOOOOOOOOOOOba.    .adOOOOOOOOOO@^OOOOOOOba.     .adOOOOOOOOOOOO
" "  OOOOOOOOOOOOOOOOO.OOOOOOOOOOOOOO"`  '"OOOOOOOOOOOOO.OOOOOOOOOOOOOO
" "    :            .oO%OOOOOOOOOOo.OOOOOO.oOOOOOOOOOOOO?         .
" "    Y           'OOOOOOOOOOOOOO: .oOOo. :OOOOOOOOOOO?'         :`
" "    .            oOOP"%OOOOOOOOoOOOOOOO?oOOOOO?OOOO"OOo
" "                 '%o  OOOO"%OOOO%"%OOOOO"OOOOOO"OOO':
" "                      `$"  `OOOO' `O"Y ' `OOOO'  o             .
" "    .                  .     OP"          : o     .
" "



" ]


let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Files']            },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ ]

let g:startify_bookmarks = [
            \ { 'i': '~/.config/nvim/init.vim' },
            \ { 'c': '~/.config/i3/config' },
            \ { 'z': '~/.zshrc' },
            \ '~/Code',
            \ ]
