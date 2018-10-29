#!/bin/bash

nvm-check(){
  if command -v "nvm" > /dev/null 2>&1; then
    nvm-update;
  else
    nvm-install;
  fi
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
