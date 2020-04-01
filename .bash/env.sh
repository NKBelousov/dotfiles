#!/bin/bash

export DEFAULT_USER=`whoami`
export DOTFILES_PATH=$HOME/Projects/dotfiles/
export EDITOR=vim
export FZF_BASH='~/.fzf.bash'
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
export GIT_COMPLETION="/usr/share/bash-completion/completions/git"
export HISTCONTROL=ignoredups
export HISTFILESIZE=20000
export HISTIGNORE="&:ls:[bf]g:exit"
export HISTSIZE=10000
export NVM_DIR="$HOME/.nvm"
export NVM_SH="$NVM_DIR/nvm.sh"
export PATH=$PATH:$HOME/bin:$HOME/.local/bin:~/current/bin
export PROJECT_DIR=$HOME/Projects/
export SESSION=`basename $PWD`
export TERM=xterm-256color
export THEME=$HOME/.bash/theme.sh
export VISUAL=$EDITOR
