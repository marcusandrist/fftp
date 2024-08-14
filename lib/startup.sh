#! /usr/bin/env bash

#Cheeky stuff that shouldn't be done here.
premode() {
    while true; do
        read -p "[" command

        if [[ -z $command ]]; then
            continue
        fi

        eval "[$command"
    done
}
#End of Cheeky.


echo .
RED="\e[31m"
PS1='${debian_chroot:+($debian_chroot)}\e[36m\u\[\e[0m@\e[33m\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
E="\e[0m"
CYAN="\e[0;36m"
YELLOW="\e[0;33m"
#PS1='${debian_chroot:+($debian_chroot)}${RED}]\u${E}'


#Injected commands
alias [ls="pwd"
alias [[=premode
