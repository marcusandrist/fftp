#! /usr/bin/env bash

#Cheeky stuff that shouldn't be done here.


#premode() {
#    while true; do
#        read -p "[" command
#
#        if [[ -z $command ]]; then
#            continue
#        fi
#
#        eval "[$command"
#    done
#}
#End of Cheeky.

echo .

output=`uname -n`
out=$(echo ${output} | cut -d "s" -f 2)

RED="\e[31m"
PURPLE="\e[0;35m"
CYAN="\e[0;36m"
YELLOW="\e[0;33m"
E="\e[0m"

PS1='${debian_chroot:+($debian_chroot)}\e[36m\u\[\e[0m@\e[33m${out}\e[33m\D{[%H:%M]}\e[0m\e[0;35m\W\[\033[00m\]:'
