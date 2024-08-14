source ./assets/ansi_formatting.sh

PS1='${debian_chroot:+($debian_chroot)}${RED}\u${E}'

echo -e "${CYAN}Launching [..."

echo -e "
${BLK}i
${BLKI}i
${BLKBI}i
${RED}i
${GREEN}i
${YELLOW}i
${PURPLE}i
${CYAN}i
${CYANUL}i
${CYANBGHI}i
${END}
"

#Free PS1-liner:
#PS1='${debian_chroot:+($debian_chroot)}${RED}\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\'
