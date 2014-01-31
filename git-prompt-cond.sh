#!/bin/bash


### ~/.git-prompt-dirs.list 
#
# /www/xxxx/htdocs/jizdy
#
### ~/.git-prompt-dirs-excludes.list 
#
# /www/xxxx/htdocs/jizdy/pics
#
###
# pwd ...
# /www/xxxx/htdocs            ...standard PS1
# /www/xxxx/htdocs/jizdy      ...git PS1
# /www/xxxx/htdocs/jizdy/pics ...PS1 with GX?
#
###
# [user@xxxx htdocs]$ cd  jizdy
# [user@xxxx jizdy (master *)]$ 
# [user@xxxx jizdy (master *)]$ cd pics
# [user@xxxx pics (GX?)]$ 
# [user@xxxx pics (GX?)]$ 

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWCOLORHINTS=1

EXCLUDES_LIST_FILE=~/.git-prompt-dirs-excludes.list
LIST_FILE=~/.git-prompt-dirs.list

# source configuration
for cfgfile in /etc/git-prompt.conf ~/.git-prompt.conf git-prompt.conf
do
	[ -f "$cfgfile" ] && source "$cfgfile"
done

export GIT_PS1_SHOWDIRTYSTATE
export GIT_PS1_SHOWSTASHSTATE
export GIT_PS1_SHOWUNTRACKEDFILES
export GIT_PS1_SHOWCOLORHINTS

export EXCLUDES_LIST_FILE
export LIST_FILE

rev_grep_start ()
{ #pwd #listfile #exitnofile
	if [ -f "$2" ]
	then
		:
	else
		return $3
	fi
	while read list_line
	do
		[ -n "$list_line" ] || continue
		echo "$1" | grep -q "^$list_line" && return 0
	done < "$2"
	return 1
}
rev_grep_line ()
{ #pwd #listfile #exitnofile
	if [ -f "$2" ]
	then
		:
	else
		return $3
	fi
	while read list_line
	do
		[ -n "$list_line" ] || continue
		echo "$1" | grep -q "^$list_line$" && return 0
	done < "$2"
	return 1
}

PWD="$(pwd)"

if rev_grep_start "$PWD" "$EXCLUDES_LIST_FILE" 1
then
	echo " (###)" 
else
	if rev_grep_start "$PWD" "$LIST_FILE" 0
	then
		__git_ps1 "$1"
	else
		:
	fi
fi

