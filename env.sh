#!/bin/sh

export DEFAULT_USER=`whoami`
export DOTFILES_PATH="~/Projects/dotfiles/"
export EDITOR=vim
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
export GIT_COMPLETION="/etc/bash_completion.d/git-prompt"
export HISTCONTROL=ignoredups
export HISTFILESIZE=20000
export HISTIGNORE="&:ls:[bf]g:exit"
export HISTSIZE=10000
export NVM_DIR="$HOME/.nvm"
export PATH=$PATH:$HOME/bin:$HOME/.local/bin:~/current/bin
export SESSION=`basename $PWD`
export TERM=xterm-256color
export THEME=$HOME/.bash/themes/agnoster-bash/agnoster.bash
export VISUAL=$EDITOR
