" Init file
" This file sources all other files/directories
" Do not Modify anythign unless you knwo what you're doing

" Function to source all .vim files in a directory
function! SourceDirectory(file)
  for s:fpath in split(globpath(a:file, '*.vim'), '\n')
    exe 'source' s:fpath
  endfor
endfunction

call SourceDirectory('$HOME/.config/nvim/core/general')
call SourceDirectory('$HOME/.config/nvim/core/scripts')

" Plugins
call SourceDirectory('$HOME/.config/nvim/nemo/plugins')

" Plugin configuration
call SourceDirectory('$HOME/.config/nvim/nemo/plug-config')

" Misc - statuslines, etc
call SourceDirectory('$HOME/.config/nvim/nemo/misc')

" User defined configuration
source $HOME/.config/nvim/nemo/config.vim
