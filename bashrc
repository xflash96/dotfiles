# .bashrc

# User specific aliases and functions
export HISTSIZE=50000

alias py='python'
alias ipy='ipython'
alias gpy='ipython --gthread -c "import gtk, gobject"'

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

[ -f $HOME/pyenv.env ] && source $HOME/pyenv.env

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# grep
alias egrep='egrep --color=tty -d skip'
alias egrpe='egrep --color=tty -d skip'
alias fgrep='fgrep --color=tty -d skip'
alias fgrpe='fgrep --color=tty -d skip'
alias grep='grep --color=tty -d skip'
alias grpe='grep --color=tty -d skip'

alias g=gvfs-open
alias ev=evince

# readline
export INPUTRC=$HOME/.inputrc

# mercurial
#export HG=$(which hg)
#export TORTOISEHG_PATH=$HOME/work/tortoisehg/thg-hg-crew-tip
export TORTOISEHG_PATH=$HOME/work/tortoisehg/stable

# bash completion
# source /etc/bash_completion.d/mercurial.sh
export PATH=$HOME/go/bin:$PATH

export GOROOT=$HOME/go/bin
export GOOS=
export GOARCH=
export GOBIN=
export GOPATH=$HOME/repos/go

source $HOME/bin/git-prompt.bash
PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] '
export HISTTIMEFORMAT="%h/%d - %H:%M:%S "
#PROMPT_COMMAND='history -a; history -n'
alias dstat='dstat -cdlmnpsy'
alias webenv='source ~/app/env/bin/activate'
