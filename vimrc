set nocompatible
set mouse=a
source $VIMRUNTIME/colors/torte.vim
set rtp+=$GOROOT/misc/vim
set rtp+=$HOME/repos/supertab
filetype plugin indent on
syntax on

map \c :update<CR>:make %<<CR>:cwindow<CR>
map \m :update<CR>:make<CR>:cwindow<CR>
map \r :!./%<<CR>
map \t :make install<CR>
map \x :make clean<CR>
map \sn :set nu!<CR>
map \ss <ESC>:if exists("syntax_on")<BAR>syntax off<BAR><CR>else<BAR>syntax on<BAR>endif<CR>
map J gT
map K gt
map! <F5> <ESC>:tabe 
map <F5> <ESC>:tabe 

if has("autocmd")
        autocmd FileType python set tabstop=4 shiftwidth=4 smarttab expandtab softtabstop=4
        autocmd FileType java set tabstop=4 shiftwidth=4 smarttab expandtab softtabstop=4
	autocmd FileType java map \c :w<CR>:!javac %<CR>
	autocmd FileType java map \r :!java %<<CR>
        autocmd FileType vhdl map \m :update<CR>:make -C ../<CR>
	autocmd FileType c set tabstop=4 shiftwidth=4 smarttab expandtab softtabstop=4
        autocmd BufNewFile,BufRead *.smali map \m :make %<.jar<CR>
        autocmd BufNewFile,BufRead *.smali map \r :!dalvik -cp %<.jar %<<CR>
        autocmd BufNewFile,BufRead *.pt set tabstop=4 shiftwidth=4 smarttab expandtab softtabstop=4 
	autocmd FileType javascript set tabstop=4 shiftwidth=4 smarttab expandtab softtabstop=4
	autocmd BufRead,BufNewFile *.ll     set filetype=llvm
	autocmd BufRead,BufNewFile *.td     set filetype=tablegen
	autocmd BufRead,BufNewFile *.cmake,CMakeLists.txt,*.cmake.in setf cmake
	autocmd BufRead,BufNewFile *.ctest,*.ctest.in setf cmake
endif

set nu ruler ai cindent autoread title showcmd sm is "nofen fdl=0
set wrap so=7
set nobackup
set csprg=gtags-cscope

cabbr <expr> %% expand('%:p:h')
set wildmode=longest:full
set wildmenu
highlight Normal ctermbg=none
