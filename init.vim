" Function to source all .vim files in a directory
function! SourceDirectory(file)
  for s:fpath in split(globpath(a:file, '*.vim'), '\n')
    exe 'source' s:fpath
  endfor
endfunction

source $HOME/.config/nvim/plugins/plugins.vim
source $HOME/.config/nvim/plugins/vim-packs.vim

call SourceDirectory('$HOME/.config/nvim/plug-config')
call SourceDirectory('$HOME/.config/nvim/my-scripts')
call SourceDirectory('$HOME/.config/nvim/general')

source $HOME/.config/nvim/general/after/aesthetic.vim
source $HOME/.config/nvim/general/after/lsp.vim
