set nocompatible
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
	  \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall | source $MYVIMRC
endif
set mouse=a
source $VIMRUNTIME/colors/torte.vim
filetype off
syntax on
filetype plugin indent on

let g:airline#extensions#whitespace#enabled = 0
let g:airline_powerline_fonts = 1

map \c :update<CR>:make %<<CR>:cwindow<CR>
map \m :update<CR>:Make<CR>:cwindow<CR>
map \r :!./%<<CR>
map \t :Make! install<CR>
map \d :make deploy<CR>
map \x :make clean<CR>
map \sn :set nu!<CR>
map \ss <ESC>:if exists("syntax_on")<BAR>syntax off<BAR><CR>else<BAR>syntax on<BAR>endif<CR>

" Move to next / previous tab
"
map <nowait><silent>[ gT
map <nowait><silent>] gt
"nnoremap <nowait><silent> [ :tabprevious<CR>
"nnoremap <nowait><silent> ] :tabnext<CR>

function! MakeBracketMaps()
    nnoremap <nowait><silent><buffer> [ :tabprevious<CR>
    nnoremap <nowait><silent><buffer> ] :tabnext<CR>
endfunction

augroup bracketmaps
    autocmd!
    autocmd BufEnter * call MakeBracketMaps()
augroup END

map <C-j> <PageDown>
map <C-k> <PageUp>
map! <F5> <ESC>:tabe 
map <F5> <ESC>:tabe 
map <F8> <ESC>:TagbarToggle<CR>
map! <F8> <ESC>:TagbarToggle<CR>
map \n <ESC>:NERDTreeTabsToggle<CR>
map \k :silent !man <cword><cr>:redraw!<cr>

highlight DiffAdd ctermfg=253 ctermbg=237 guifg=#dadada guibg=#3a3a3a

if has("autocmd")
	"au FileType python set omnifunc=pythoncomplete#Complete
        autocmd FileType html,xhtml,jinja set tabstop=2 shiftwidth=2 smarttab expandtab softtabstop=2
        autocmd FileType txt set tabstop=4 shiftwidth=4 smarttab expandtab softtabstop=4
	autocmd BufNewFile,BufRead *.jinja set ft=html
        autocmd FileType python set tabstop=4 shiftwidth=4 smarttab expandtab softtabstop=4
        autocmd FileType java set tabstop=4 shiftwidth=4 smarttab expandtab softtabstop=4
	autocmd FileType java map \c :update<CR>:!javac %<CR>
	autocmd FileType java map \r :!java %<<CR>
        autocmd FileType vhdl map \m :update<CR>:make -C ../<CR>
	autocmd FileType c set tabstop=4 shiftwidth=4 smarttab expandtab softtabstop=4
	autocmd FileType cpp set tabstop=4 shiftwidth=4 smarttab expandtab
        autocmd BufNewFile,BufRead *.smali map \m :make %<.jar<CR>
        autocmd BufNewFile,BufRead *.smali map \r :!dalvik -cp %<.jar %<<CR>
        autocmd BufNewFile,BufRead *.pt set tabstop=4 shiftwidth=4 smarttab expandtab softtabstop=4 
	autocmd FileType javascript set tabstop=4 shiftwidth=4 smarttab expandtab softtabstop=4
	autocmd BufRead,BufNewFile *.ll     set filetype=llvm
	autocmd BufRead,BufNewFile *.td     set filetype=tablegen
	autocmd BufRead,BufNewFile *.cmake,CMakeLists.txt,*.cmake.in setf cmake
	autocmd BufRead,BufNewFile *.ctest,*.ctest.in setf cmake
	autocmd Filetype tex setlocal expandtab tabstop=8 shiftwidth=8 
	autocmd Filetype tex set nocursorline nornu
endif

set hls nu ruler ai cindent autoread title showcmd sm is "nofen fdl=0
set wrap so=7
set nobackup
set csprg=gtags-cscope
set ignorecase smartcase

cabbr <expr> %% expand('%:p:h')
set wildmode=longest,list,full
" set wildmenu
highlight Normal ctermbg=none
let g:jedi#popup_on_dot = 0
" find current word in quickfix
nnoremap <leader>fw :execute "vimgrep ".expand("<cword>")." %"<cr>:copen<cr>
" find last search in quickfix
nnoremap <leader>ff :execute 'vimgrep /'.@/.'/g %'<cr>:copen<cr>

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "normal! g`\"" |
\ endif
highlight clear SignColumn

set undodir=~/.vim/undo
set undofile
set undolevels=1000
set undoreload=10000

set clipboard=unnamed

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'bling/vim-airline'
Plug 'enricobacis/vim-airline-clock'
Plug 'google/vim-glaive'
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-commentary'
Plug 'mhinz/vim-signify'
Plug 'majutsushi/tagbar'
Plug 'rhysd/vim-grammarous'
" Plug 'lervag/vimtex'
Plug 'mattn/emmet-vim'
Plug 'dense-analysis/ale'
"Plug 'prabirshrestha/vim-lsp'


Plug '~/.fzf'
call plug#end()

let g:ctrlp_match_window_bottom = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_switch_buffer = 0


" prevent wrong expansion on latex file

" let g:clang_format_executable = '/usr/local/bin/clang-format'
call glaive#Install()
Glaive codefmt plugin[mappings]

" ALE
let g:ale_cpp_cpplint_options = '--filter=-whitespace,-legal,-readability'
let g:ale_completion_enabled = 1
nnoremap <silent> K :ALEHover<CR>
nnoremap <silent> D :ALEGoToDefinition<CR>
nnoremap <silent> R :ALEFindReferences<CR>
let g:airline#extensions#ale#enabled = 1
