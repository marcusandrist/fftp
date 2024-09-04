#!/bin/bash

# Change this to fftp directory path!
export FFTP_PATH=/home/cus/fftp

# Deprecated PS1 assignment
#PS1='${debian_chroot:+($debian_chroot)}\e[0;35m\e[36m\u\[\e[0m@\e[30m${out}\D{[%H:%M]}\e[0m\e[0;33m${gitstuff}\e[0;35m\W\[\033[00m\]:'

#<------------[   Prompt Generation    ]------------>#

make_prompt(){
	PS1='${debian_chroot:+($debian_chroot)}'
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
	color_code=$(echo "$porcelain" | $FFTP_PATH/lib/git_parse/main)
	PS1+='\[\e[0;${color_code}m\]'
}

gitbranch(){
    myvar="(`(git branch 2>/dev/null | sed "s/* //")`)"
    if [ ${#myvar} -gt 3 ]; then
        echo $myvar
	else
		exit
	fi
}

#<------------Function Definitions------------>#

# Get user "tag"- needs modularity
usertag(){
	full_user=`uname -n`
	echo ${full_user} | cut -d "-" -f 2
}

# Deprecated PS1 assignment
#PS1='${debian_chroot:+($debian_chroot)}\e[0;35m\e[36m\u\[\e[0m@\e[30m${out}\D{[%H:%M]}\e[0m\e[0;33m${gitstuff}\e[0;35m\W\[\033[00m\]:'
