#!/bin/bash

source ~/.bash/nvm.sh;
source ~/.bash/pomodoro.sh;
source ~/.bash/pwd.sh;

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
  "acpi"
  "composer"
  "curl"
  "exuberant-ctags"
  "fonts-powerline"
  "git"
  "htop"
  "iotop"
  "keepassx"
  "menulibre"
  "numix-gtk-theme"
  "python-pip"
  "python3-pip"
  "ranger"
  "snapd"
  "taskwarrior"
  "thunar"
  "tmux"
  "tree"
  "vim"
  "xfce4"
  )
  sudo apt update --yes --force-yes;
  sudo apt full-upgrade --yes --force-yes;
  sudo apt autoremove --yes --force-yes;
  sudo apt autoclean --yes --force-yes;
  sudo apt install ${essential[@]};
  local pip=(
  "flake8"
  "jedi"
  )
  pip install --user ${pip[@]};
  sudo snap install rg;
  nvm-check;
  local npm_packages=(
  "create-react-app"
  "create-react-library"
  "diff-so-fancy"
  "np"
  "tldr"
  )
  npm i -g ${npm_packages[@]};
  cat ~/.config/dconf/palette | dconf load /org/gnome/terminal/ | dconf update;
  vim +PlugInstall +PlugClean +PlugUpdate +PlugUpgrade +qall;
  notify-send "Ready to work!";
}
