# .bashrc
#SSH_AUTH_SOCK=`ss -xl | grep -o '/run/user/1000/keyring-.*/ssh' | head -n 1`
# [ -z "$SSH_AUTH_SOCK" ] || export SSH_AUTH_SOCK
#eval `ssh-agent`

# User specific aliases and functions
export HISTSIZE=50000
export CLICOLOR=1

alias py='python'
alias ipy='ipython'
alias gpy='ipython --gthread -c "import gtk, gobject"'
alias vi='vim'
alias st='stree'
alias skim='open -a Skim'
alias backtrace=gdb-backtrace
alias bt=gdb-backtrace
alias dstat='dstat -cdlmnpsy'
#alias blender='/Applications/Blender/blender.app/Contents/MacOS/blender'
#alias ls='ls --color'

export EDITOR='vim'
# color highlighting for manpages
export MANPAGER='bash -c "vim -MRn -c \"set ft=man nomod nolist nospell nonu\" -c \"nm q :qa!<CR>\" -c \"nm <end> G\" -c \"nm <home> gg\"</dev/tty <(col -b)"'
#export PAGER="$HOME/bin/vim-pager"
export CVS_RSH=ssh

export GNOME_DISABLE_CRASH_DIALOG=1
export KDE_DEBUG=1
ulimit -c unlimited

export MANSECT='0p:3p:1p:3:2:1:4:5:6:7:8:9:l'#:n #tcl

# grep
alias egrep='egrep --color=tty -d skip'
alias egrpe='egrep --color=tty -d skip'
alias fgrep='fgrep --color=tty -d skip'
alias fgrpe='fgrep --color=tty -d skip'
alias grep='grep --color=tty -d skip'
alias grpe='grep --color=tty -d skip'

alias g=open
alias m=make
alias ev=evince
alias ..='cd ..'
alias ...='cd ../../../'

# readline
export INPUTRC=$HOME/.inputrc
# bash completion
#export GOROOT=$HOME/repos/go
export GOPATH=$HOME/gopkg
export IACAPATH=$HOME/repos/iaca-mac64
export PATH=$HOME/bin:$GOROOT/bin:$IACAPATH/bin:$HOME/gopkg/bin:/usr/local/bin:$PATH
export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:$IACAPATH/lib
export CC=gcc
export CXX=g++
export ASAN_SYMBOLIZER_PATH=/usr/local/bin/llvm-symbolizer-3.4
export PATH=/usr/local/sbin:$PATH
export LANG=en_US.UTF-8 
export LC_CTYPE="en_US.UTF-8"
unset ignoreeof
export DISPLAY=:0

#source $HOME/bin/git-prompt.bash
if [ -n "$ZSH_VERSION" ]; then
	if [ -n "$SSH_CLIENT" ]; then
		prompt_host="%{$fg[green]%}%m "
	fi;
	PS1="${prompt_host}%{$fg[yellow]%}%T %{$fg[blue]%}%~ %{$fg[green]%}$%{$reset_color%} "
else
	if [ -n "$SSH_CLIENT" ]; then
		prompt_host="\[\e[00;32m\]\h "
	fi;
	export PS1="${prompt_host}\[\e[00;33m\]\A \[\e[00;34m\]\w \[\e[0m\]"
	shopt -s histappend
	[ -f ~/.fzf.bash ] && source ~/.fzf.bash
fi

export HISTTIMEFORMAT="%h/%d - %H:%M:%S "
PROMPT_COMMAND="history -a; history -n; $PROMPT_COMMAND"
