" Startify

let g:startify_custom_header = [
 \'     _   __                      ___',
 \'    / | / /__  ____ ___  ____   <  /',
 \'   /  |/ / _ \/ __ `__ \/ __ \  / / ',
 \'  / /|  /  __/ / / / / / /_/ / / /  ',
 \' /_/ |_/\___/_/ /_/ /_/\____/ /_/   ',
 \]

   "  _   __      _         
   " / | / /   __(_)___ ___ 
  " /  |/ / | / / / __ `__ \
 " / /|  /| |/ / / / / / / /
" /_/ |_/ |___/_/_/ /_/ /_/ 

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
