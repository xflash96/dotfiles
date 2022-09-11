set runtimepath+=~/.nvim,~/.nvim/after
set packpath+=~/.nvim

" python support
let g:python3_host_prog='/usr/local/bin/python3'
"let g:python_host_prog='~/.virtualenvs/neovim-python2/bin/python'

" vars
let $MYVIMRC='~/.nvimrc'
let $MYPLUGS='~/.nvim/plugs.vim'

source ~/.nvimrc
if !exists('g:vscode')
    source ~/.nvim/plugs.vim
endif
