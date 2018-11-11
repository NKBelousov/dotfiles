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

git-merge-delete(){
  if [ $# -ne 1 ]; then
    echo "git md usage: branch-name"
    echo "    branch-name           branch to merge in and delete"
    return 1
  fi
  BRANCHNAME="$1";
  git merge $BRANCHNAME;
  git bd $BRANCHNAME;
  return 0;
}

git-fetch-all-projects(){
  local CURRENT=$(pwd);
  cd "$PROJECT_DIR";
  local PROJECTS=$(find . -maxdepth 2 -name ".git")
  for dir in $PROJECTS
  do cd ${dir%/*}
      echo "Fetching $PWD"
      git fa
      echo ""
      cd - > /dev/null
  done
  cd "$current";
}
