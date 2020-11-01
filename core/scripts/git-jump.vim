command! -bar -nargs=* Jump cexpr system('$HOME/.config/nvim/bin/git-jump ' . expand(<q-args>))
