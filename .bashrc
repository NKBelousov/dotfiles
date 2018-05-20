PATH=${PATH}:~/current/bin
TERM=xterm-256color
EDITOR=vim
VISUAL=$EDITOR
SESSION=`basename $PWD`

export HISTFILESIZE=20000
export HISTSIZE=10000
shopt -s histappend
shopt -s cmdhist
HISTCONTROL=ignoredups
export HISTIGNORE="&:ls:[bf]g:exit"

daily(){
  cd ~/Projects/dotfiles;
  git fetch --all --prune && git reset --hard origin/master;
  find . -type f -not -regex "./.git.*" | xargs -L 1 -I {} sh -c "mkdir -p \`dirname ~/{}\`; cp {} ~/{};";
  vim +PlugInstall +PlugClean +PlugUpdate +PlugUpgrade +qall;
  cd -;
  . ~/.bashrc;
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
}

nvm-check(){
  if ! [ -x "$(command -v nvm)" ]; then
    nvm-install
  else
    nvm-update
  fi
}

nvm-install(){
  export NVM_DIR="$HOME/.nvm" && (
    rm -Rf "$NVM_DIR";
    git clone https://github.com/creationix/nvm.git "$NVM_DIR"
    cd "$NVM_DIR"
    git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
  ) && \. "$NVM_DIR/nvm.sh"
}

nvm-update(){
  export NVM_DIR="$HOME/.nvm" && (
    cd "$NVM_DIR"
    git fetch --tags origin
    git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
  ) && \. "$NVM_DIR/nvm.sh"
}

GIT="/etc/bash_completion.d/git-prompt"

if [ -e $GIT ];
then
  source $GIT
fi

alias vi='vim'
alias svim='sudo -e'
alias ll='ls -alh'

export THEME=$HOME/.bash/themes/agnoster-bash/agnoster.bash
if [[ -f $THEME ]]; then
  export DEFAULT_USER=`whoami`
  source $THEME
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
