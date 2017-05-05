PATH=${PATH}:~/current/bin
TERM=xterm-256color
EDITOR=vim
VISUAL=$EDITOR
SESSION=`basename $PWD`

daily(){
    sudo apt-get --yes --force-yes update;
    sudo apt-get --yes --force-yes upgrade;
    sudo apt-get --yes --force-yes autoremove;
    sudo apt-get --yes --force-yes autoclean;
    pushd ~/Projects/dotfiles;
    git fetch --all --prune;
    git reset --hard origin/master;
    sh install.sh;
    popd;
}

dev(){
    tmux new-session -d -s $SESSION
    tmux rename-window -t $SESSION:1 vim
    tmux split-window -h
    tmux select-pane -t 0
    tmux resize-pane -R 50
    tmux select-pane -t 1
    tmux split-window -v
    tmux select-pane -t 1
    tmux clock-mode
    tmux select-pane -t 0
    tmux attach -t $SESSION
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
alias ll='ls -alh'
alias grep='ack'

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
