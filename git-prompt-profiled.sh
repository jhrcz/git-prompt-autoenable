#!/bin/bash

case $USER in
	"etndevel")


		script="$( ls /usr/share/doc/git-*/contrib/completion/git-completion.bash 2>/dev/null | head -n 1 )"
		if [ -n "$script" ]
		then
			source $script
		else
			#source /usr/share/git-core/contrib/completion/git-prompt.sh
			source /usr/local/bin/git-prompt.sh
		fi

		declare -fx __git_ps1
		export GIT_PS1_SHOWDIRTYSTATE=1
		export GIT_PS1_SHOWSTASHSTATE=1
		export GIT_PS1_SHOWUNTRACKEDFILES=1
		export GIT_PS1_SHOWCOLORHINTS=1

		PROMPT_COMMAND='__git_ps1 "\u@\h:\w" "\\\$ "'
		export PROMPT_COMMAND

		PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
		export PS1

		;;
	*)
		;;
esac

