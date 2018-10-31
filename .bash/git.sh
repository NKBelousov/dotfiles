#!/bin/bash

git-rebase-exec(){
  if [ $# -ne 2 ]; then
    echo "git-rebase-exec usage: commit command-to-execute"
    echo "    commit                rebase starting point"
    echo "    command               command to execute on each commit" 
    return 1
  fi
  FROM="$1"
  shift
  git rebase --interactive $FROM -x "$@";
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
