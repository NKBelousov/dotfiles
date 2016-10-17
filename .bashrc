PATH=${PATH}:~/current/bin
TERM=xterm-256color
EDITOR=vim
VISUAL=gvim

daily(){
    sudo apt update && sudo apt upgrade;
    pushd ~/Projects/dotfiles;
    git pull origin master;
    sh install.sh;
    popd;
}

alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias diff='colordiff'
alias vi='vim'
alias svim='sudo vim'
alias ll='ls -al'
alias grep='ack'

alias gs='git status'
alias gl='git lga'
alias gf='git fa'
alias gb='git branch -vv'

# Custom prompt
Color_Off="\[\033[0m\]"
Green="\[\033[0;32m\]"
Red="\[\033[0;91m\]"
Yellow="\[\033[0;33m\]"
BYellow="\[\033[1;33m\]"

Time12h="\T"
Time12a="\@"
PathShort="\w"
PathFull="\W"
NewLine="\n"
Jobs="\j"

export PS1=[$Green$Time12h$Color_Off]' $(git branch &>/dev/null;\
if [ $? -eq 0 ]; then \
  echo "$(echo `git status` | grep "nothing to commit" > /dev/null 2>&1; \
  if [ "$?" -eq "0" ]; then \
    # @4 - Clean repository - nothing to commit
    echo "'$Green'"$(__git_ps1 " (%s)"); \
  else \
    # @5 - Changes to working tree
    echo "'$Red'"$(__git_ps1 " {%s}"); \
  fi) '$BYellow$PathShort$Color_Off'\$ "; \
else \
  # @2 - Prompt when not in GIT repo
  echo "'$Yellow$PathShort$Color_Off'\$ "; \
fi)'
