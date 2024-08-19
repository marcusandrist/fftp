#!bash
# Set new PS1 w/

# Get user "tag"
fullusername=`uname -n`
out=$(echo ${fullusername} | cut -d "-" -f 2)

PS1='${debian_chroot:+($debian_chroot)}\e[0;35m\e[36m\u\[\e[0m@\e[30m${out}\D{[%H:%M]}\e[0m\e[0;33m${gitstuff}\e[0;35m\W\[\033[00m\]:'

gitstufffunc(){
    myvar="(`(git branch 2>/dev/null | sed "s/* //")`)"
    if [ ${#myvar} -gt 3 ]; then
        echo $myvar
	else
		exit
	fi
}

gitcheck(){
    read -r input
    if echo $input | grep -q -e D -e M; then
	echo found
    else
        echo not found
    fi
}

#echo `(git status --porcelain=v1)` | gitcheck

#inp="\[\e[0;35m\]Purple\[\e[0m\]"

PROMPT_COMMAND='gitstuff=$(gitstufffunc)'

#Note- create func then call it to update each time?
#set_prompt(){
#some logic
#PS1+='expand PS1'
#var=somefuncton()
#PS1+='var'
#PROMPT_COMMAND='set_prompt'

#Go to user's home directory (customizable in settings)
inp="${HOME}/.vim"
echo $inp
echo "hi" >> "${HOME}/.bashrc"
echo "cd ${HOME}/C" >> "${HOME}/.bashrc"

#<------------Function Definitions------------>#

