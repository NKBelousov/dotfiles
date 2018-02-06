PATH=${PATH}:~/current/bin
TERM=xterm-256color
EDITOR=vim
VISUAL=$EDITOR
SESSION=`basename $PWD`

daily(){
  cd ~/Projects/dotfiles;
  git fetch --all --prune && git reset --hard origin/master;
  find . -type f -not -regex "./.git.*" | xargs -L 1 -I {} sh -c "mkdir -p \`dirname ~/{}\`; cp {} ~/{};";
  vim +PlugInstall +PlugClean +PlugUpdate +PlugUpgrade +qall;
  cd -;
  . ~/.bashrc;
  local essential=(
  "git"
  "htop"
  "tmux"
  "vim"
  )
  sudo apt-get install ${essential[@]} --yes --force-yes;
  sudo apt-get --yes --force-yes update;
  sudo apt-get --yes --force-yes upgrade;
  sudo apt-get --yes --force-yes autoremove;
  sudo apt-get --yes --force-yes autoclean;
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
