shopt -s histappend
shopt -s cmdhist
xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'

source ~/.bash/aliases.sh;
source ~/.bash/functions.sh;
source ~/.bash/sources.sh;
