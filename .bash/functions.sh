#!/bin/bash

daily(){
  if [[ -z "$DOTFILES_PATH" ]]; then
    echo "DOTFILES_PATH environment variable is not set."
    return 1
  fi
  cd ${DOTFILES_PATH};
  git fetch --all --prune && git reset --hard origin/master;
  find . -type f -not -regex "./.git.*" | xargs -L 1 -I {} sh -c "mkdir -p \`dirname ~/{}\`; cp {} ~/{};";
  vim +PlugInstall +PlugClean +PlugUpdate +PlugUpgrade +qall;
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
  "mps-youtube"
  "youtube-dl"
  )
  pip install --user ${pip[@]};
  sudo snap install rg;
  nvm-check;
  nvm install --lts;
  local npm_packages=(
  "create-react-app"
  "create-react-library"
  "diff-so-fancy"
  "np"
  "tldr"
  )
  npm i -G ${npm_packages[@]};
  cat ~/.config/dconf/palette | dconf load /org/gnome/terminal/ | dconf update;
}

pomodoro(){
  if [[ -z $1 ]]; then
    echo "Specify duration"
    return 1
  fi
  if [[ -z $2 ]]; then
    echo "Specify message"
    return 1
  fi
  sleep $1 && notify-send $2 &>/dev/null &disown;
}

pomodoro-work(){
  pomodoro 1500 "Start working!"
}

pomodoro-short(){
  pomodoro 300 "Short break"
}

pomodoro-long(){
  pomodoro 3600 "Long break"
}

nvm-check(){
  if ! [ -x "$(command -v nvm)" ]; then
    nvm-install
  else
    nvm-update
  fi
}

deploy(){
  DESTINATION=$1
  if [[ -n $1 ]]; then
    echo "Deploying to $1...";
    echo "Date: $DATE    Commit: $HEAD    User: $(git config user.name)" >> ".history"
    DATE=`date '+%Y-%m-%d %H:%M:%S'`
    HEAD=`git rev-parse HEAD`
    rsync -a --stats --progress ./ $1
    return 0
  fi
  echo "Specify the destination point"
  return 1
}

nvm-install(){
  rm -Rf "$NVM_DIR";
  git clone https://github.com/creationix/nvm.git "$NVM_DIR";
  cd "$NVM_DIR";
  git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`;
  \. "$NVM_SH";
  cd -;
}

nvm-update(){
  cd "$NVM_DIR";
  git fetch --tags origin;
  git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`;
  \. "$NVM_SH";
  cd -;
}

git-fetch-all(){
  local current=$(pwd);
  cd "$PROJECT_DIR";
  for dir in $(find . -name ".git")
  do cd ${dir%/*}
      echo "Fetching $PWD"
      git fa
      echo ""
      cd - > /dev/null
  done
  cd "$current";
}
