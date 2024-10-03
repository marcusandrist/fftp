#!/bin/bash

# Change this to fftp directory path!
export FFTP_PATH=/home/cus/C/fftp

#<------------[   Prompt Generation    ]------------>#

make_prompt(){
	PS1='${debian_chroot:+($debian_chroot)}'

	if [ -n "$VIRTUAL_ENV" ]; then
        PS1+="$(basename $VIRTUAL_ENV)~"  # Add venv name in parentheses
    fi

	PS1+='\[\e[0;36m\]\u'

	PS1+='\[\e[0;0m\]$(usertag)\[\e[0;33m\]\D{%H:%M}'

	colorgit
	PS1+='$(gitbranch)'

	PS1+='\[\e[0;35m\]\W'

	# End Prompt Formatting
	PS1+='\[\033[00m\]:'
}

PROMPT_COMMAND='make_prompt'

#<------------[  Function Definitions  ]------------>#

colorgit(){
	porcelain=$(git status --porcelain=v1 2>/dev/null)
	color_code=$(echo "$porcelain" | $HOME/.fftp/lib/git_parse)
	PS1+='\[\e[0;${color_code}m\]'
}

gitbranch(){
	myvar="($(git branch 2>/dev/null | grep '\*' | sed 's/* //'))"
    if [ ${#myvar} -gt 3 ]; then
        echo $myvar
	else
		exit
	fi
}

# Get user "tag"- needs modularity
usertag(){
	full_user=`uname -n`
	echo ${full_user} | cut -d "-" -f 2
}

#<------------[    Bash Extensionss    ]------------>#

# Aliases
. $HOME/.fftp/lib/aliases
