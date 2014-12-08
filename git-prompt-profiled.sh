#!/bin/bash

go ()
{
	script="$( ls /usr/share/doc/git-*/contrib/completion/git-completion.bash 2>/dev/null | head -n 1 )"
	if [ -z "$script" ]
	then
		script="$( ls /usr/share/doc/git-*/contrib/completion/git-completion.bash 2>/dev/null | head -n 1 )"
	fi
	if grep -q __git_ps1 $script
	then
		:
	else
		script=""
	fi
	if [ -n "$script" ]
	then
		source $script
	else
		#source /usr/share/git-core/contrib/completion/git-prompt.sh
		source $BINDIR/git-prompt.sh
	fi

	declare -fx __git_ps1
	declare -fx __gitdir

	# PS1 setting without wrapper
	#PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
	PS1='[\u@\h \W$($BINDIR/git-prompt-cond.sh " (%s)")]\$ '
	export PS1

	if [ "$USE_PROMPT" = "YES" ]
	then
		PROMPT_COMMAND="$BINDIR"'/git-prompt-cond.sh "\u@\h:\w" "\\\$ "'
		export PROMPT_COMMAND
	fi
}

# sane defaults
USERS=(gituser)
USE_PROMPT=NO
BINDIR=/usr/bin

# source configuration
for cfgfile in /etc/git-prompt.conf ~/.git-prompt.conf git-prompt.conf
do
	[ -f "$cfgfile" ] && source "$cfgfile"
done

# enable git-prompt only for configured users
for user in ${USERS[@]}
do
	if [ "$user" = "$USER" ]
	then
		go
	fi
done

