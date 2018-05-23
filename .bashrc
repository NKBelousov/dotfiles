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
  "snapd"
  "tmux"
  "vim"
  "xfce4"
  )
  sudo apt-get --yes --force-yes upgrade;
  sudo apt-get --yes --force-yes update;
  sudo apt-get --yes --force-yes autoclean;
  sudo apt-get --yes --force-yes autoremove;
  sudo apt-get install ${essential[@]} --yes --force-yes;
  pip install flake8;
  pip install jedi;
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
