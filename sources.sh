#!/bin/bash

if [[ -e $GIT_COMPLETION ]]; then
  source $GIT_COMPLETION;
fi

if [[ -e $THEME ]]; then
  source $THEME;
fi

if [[ -e $FZF_BASH ]]; then
  source $FZF_BASH;
fi

if [[ -e "$NVM_DIR/nvm.sh" ]]; then
  source "$NVM_DIR/nvm.sh";
fi
