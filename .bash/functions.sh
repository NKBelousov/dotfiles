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
  "taskwarrior"
  "thunar"
  "tmux"
  "tree"
  "vim"
  "xfce4"
  )
  sudo apt update --yes;
  sudo apt full-upgrade --yes;
  sudo apt autoremove --yes;
  sudo apt autoclean --yes;
  sudo apt install ${essential[@]};
  sudo snap install rg;
  nvm-check;
  local npm_packages=(
  "create-react-app"
  "create-react-library"
  "diff-so-fancy"
  "np"
  "npx"
  "serve"
  "tldr"
  )
  npm i -g ${npm_packages[@]};
  cat ~/.config/dconf/palette | dconf load /org/gnome/terminal/ | dconf update;
  vim +PlugInstall +PlugClean +PlugUpdate +PlugUpgrade +qall;
  code-uninstall-unused-extensions;
  code-install-extensions;
  notify-send "Ready to work!";
}

code-install-extensions(){
  cat ~/.config/Code/User/extensions | xargs -I {} code --install-extension {} --force
}

code-save-extensions(){
  code --list-extensions > "${DOTFILES_PATH}.config/Code/User/extensions"
}

code-uninstall-unused-extensions(){
  diff ~/.config/Code/User/extensions ~/Projects/dotfiles/.config/Code/User/extensions | grep '<' | cut -d ' ' -f 2 | xargs -I {} code --uninstall-extension {};
}