source ~/env.sh;

shopt -s histappend
shopt -s cmdhist

alias vi='vim'
alias svim='sudo -e'
alias ll='ls -alh'

daily(){
  cd ${DOTFILES_PATH};
  git fetch --all --prune && git reset --hard origin/master;
  find . -type f -not -regex "./.git.*" | xargs -L 1 -I {} sh -c "mkdir -p \`dirname ~/{}\`; cp {} ~/{};";
  vim +PlugInstall +PlugClean +PlugUpdate +PlugUpgrade +qall;
  cd -;
  \. ~/.bashrc;
  local essential=(
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
  "tmux"
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
  pip install ${pip[@]};
  sudo snap install rg;
  nvm-check;
  nvm install --lts;
}

nvm-check(){
  if ! [ -x "$(command -v nvm)" ]; then
    nvm-install
  else
    nvm-update
  fi
}

nvm-install(){
  rm -Rf "$NVM_DIR";
  git clone https://github.com/creationix/nvm.git "$NVM_DIR";
  cd "$NVM_DIR";
  git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`;
  \. "$NVM_DIR/nvm.sh";
  cd -;
}

nvm-update(){
  cd "$NVM_DIR";
  git fetch --tags origin;
  git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`;
  \. "$NVM_DIR/nvm.sh";
  cd -;
}

if [ -e $GIT_COMPLETION ]; then
  source $GIT_COMPLETION;
fi

if [[ -f $THEME ]]; then
  source $THEME;
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
