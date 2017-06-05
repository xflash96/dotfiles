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
alias pcd='pushd'
alias pop='popd'
alias vi='vim'
alias st='stree'
alias skim='open -a Skim'
#alias ls='ls --color'
#alias tmp='cd /tmp2/powei'

export EDITOR='vim'
# color highlighting for manpages
export MANPAGER='bash -c "vim -MRn -c \"set ft=man nomod nolist nospell nonu\" -c \"nm q :qa!<CR>\" -c \"nm <end> G\" -c \"nm <home> gg\"</dev/tty <(col -b)"'
#export PAGER="$HOME/bin/vim-pager"
alias backtrace=gdb-backtrace
alias bt=gdb-backtrace

export CVS_RSH=ssh

export GNOME_DISABLE_CRASH_DIALOG=1
export KDE_DEBUG=1
ulimit -c unlimited

export MANSECT='0p:3p:1p:3:2:1:4:5:6:7:8:9:l'#:n #tcl

#[ -f $HOME/pyenv.env ] && source $HOME/pyenv.env

#shopt -s histappend
#history -a

# Source global definitions
#if [ -f /etc/bashrc ]; then
#	. /etc/bashrc
#fi

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

# readline
export INPUTRC=$HOME/.inputrc

# mercurial
#export HG=$(which hg)
#export TORTOISEHG_PATH=$HOME/work/tortoisehg/thg-hg-crew-tip
#export TORTOISEHG_PATH=$HOME/work/tortoisehg/stable

# bash completion
# source /etc/bash_completion.d/mercurial.sh
#export GOROOT=$HOME/repos/go
export GOPATH=$HOME/gopkg
export IACAPATH=$HOME/repos/iaca-mac64

export PATH=$HOME/bin:$GOROOT/bin:$IACAPATH/bin:$HOME/gopkg/bin:/usr/local/bin:$PATH
export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:$IACAPATH/lib

#source $HOME/bin/git-prompt.bash

if [ -n "$SSH_CLIENT" ]; then
	prompt_host="\[\e[00;32m\]\h "
fi;
export PS1="${prompt_host}\[\e[00;33m\]\A \[\e[00;34m\]\w \[\e[0m\]"
export HISTTIMEFORMAT="%h/%d - %H:%M:%S "
#PROMPT_COMMAND='history -a; history -n'

shopt -s histappend
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"

alias dstat='dstat -cdlmnpsy'
alias webenv='source ~/app/env/bin/activate'
#export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH
#if [ -f /usr/local/etc/bash_completion ]; then
#	. /usr/local/etc/bash_completion
#fi
export CC=gcc
export CXX=g++
export ASAN_SYMBOLIZER_PATH=/usr/local/bin/llvm-symbolizer-3.4
export PATH=/usr/local/sbin:$PATH
export LANG=en_US.UTF-8 
export LC_CTYPE="en_US.UTF-8"
unset ignoreeof
export DISPLAY=:0
