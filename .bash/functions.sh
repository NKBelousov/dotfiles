#!/bin/bash

source ~/.bash/nvm.sh;

daily(){
  if [[ -z "$DOTFILES_PATH" ]]; then
    echo "DOTFILES_PATH environment variable is not set."
    return 1
  fi
  ssh-add;
  cd ${DOTFILES_PATH};
  git fetch --all --prune && git reset --hard origin/master;
  find . -type f -not -regex "./.git.*" | xargs -L 1 -I {} sh -c "mkdir -p \`dirname ~/{}\`; cp {} ~/{};";
  cd -;
  \. ~/.bashrc;
  local essential=(
  "curl"
  "fonts-powerline"
  "git"
  "htop"
  "iotop"
  "snapd"
  "thunar"
  "tmux"
  "vim"
  "xfce4"
  "xfce4-terminal"
  )
  sudo apt update --yes;
  sudo apt full-upgrade --yes;
  sudo apt autoremove --yes;
  sudo apt autoclean --yes;
  sudo apt install ${essential[@]};
  sudo snap install rg;
  nvm-check;
  vim +PlugInstall +PlugClean +PlugUpdate +PlugUpgrade +qall;
  notify-send "Ready to work!";
}
