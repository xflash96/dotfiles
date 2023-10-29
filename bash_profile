#!/usr/bin/env bash

# general
export LANG=en_US.UTF-8
export LC_CTYPE="en_US.UTF-8"
export TERM=screen-256color
unset ignoreeof
export DISPLAY=:0

export EDITOR='vim'
# color highlighting for manpages
export MANPAGER='bash -c "vim -MRn -c \"set ft=man nomod nolist nospell nonu\" -c \"nm q :qa!<CR>\" -c \"nm <end> G\" -c \"nm <home> gg\"</dev/tty <(col -b)"'
#export PAGER="$HOME/bin/vim-pager"
export CVS_RSH=ssh

ulimit -c unlimited
export MANSECT='0p:3p:1p:3:2:1:4:5:6:7:8:9:l'#:n #tcl


# history
shopt -s histappend
export HISTCONTROL=ignoreboth:erasedups
export HISTTIMEFORMAT="%h/%d - %H:%M:%S "
export HISTSIZE=50000
export HISTFILESIZE=50000
export CLICOLOR=1


# paths
export PATH=$HOME/.local/bin:$HOME/bin:$GOROOT/bin:$IACAPATH/bin:$HOME/gopkg/bin:/usr/local/sbin:/usr/local/bin:$PATH
export INPUTRC=$HOME/.inputrc
export CC=gcc
export CXX=g++


# alias
if [ "$(uname)" == "Darwin" ]; then
 	:
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
 	alias ls='ls --color'
fi

alias py='python'
alias ipy='ipython'
alias gpy='ipython --gthread -c "import gtk, gobject"'
alias vi='vim'
alias st='stree'
alias skim='open -a Skim'
alias backtrace=gdb-backtrace
alias bt=gdb-backtrace
alias dstat='dstat -cdlmnpsy'

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



# git-prompt
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
[[ -f ~/.arc-completion.bash ]] && source ~/.arc-completion.bash


# Sovle stale ssh auth https://www.revsys.com/tidbits/ssh_auth_sock-tmux-and-you/
function _check_ssh_agent() {
        return $( ssh-add -l >& /dev/null )
}

function set_ssh_agent() {

        local SAS=${SSH_AUTH_SOCK}

        _check_ssh_agent &&
                local SSH_AUTH_SOCK=${HOME}/.ssh/ssh_auth_sock
                _check_ssh_agent ||
                        ln -sf ${SAS} $HOME/.ssh/ssh_auth_sock

        # recall, "||" and "&&" operate on the 0/non-0 property
        # of the called function's return value. If the check succeeds
        # with the alternative socket path, the "ssh-add" call returns
        # 0, so there is nothing more to do. It is only if the alternative
        # path does not have a functional agent that a non-0 value will
        # be returned.  "&&" proceeds if 0 is returned. "||" proceeds
        # if non-0 is returned, thus, "||" is the correct glyph to
        # use since we have additional work to do.
}

set_ssh_agent
