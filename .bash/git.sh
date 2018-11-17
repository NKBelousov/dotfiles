#!/bin/bash

describe-usage(){
  if [ $# -lt 2 ]; then
    echo "Invalid describe-usage invokation"
    return 1
  fi
  ITEM="$1"
  MESSAGE="$@"
  echo "    $ITEM                    $MESSAGE"
  return 0
}

git-rebase-exec(){
  if [ $# -lt 2 ]; then
    echo "git rbx usage: commit command-to-execute"
    describe-usage "commit" "rebase starting point"
    describe-usage "command" "command to execute on each commit"
    return 1
  fi
  FROM="$1"
  shift
  git rebase --interactive $FROM -x "$@";
}

git-merge-delete(){
  if [ $# -ne 1 ]; then
    echo "git md usage: branch-name"
    describe-usage "branch-name" "branch to merge in and delete"
    return 1
  fi
  BRANCHNAME="$1";
  git merge $BRANCHNAME;
  git bd $BRANCHNAME;
  return 0;
}

git-cherry-pick-delete(){
  if [ $# -ne 1 ]; then
    echo "git cpd usage: branch-name"
    describe-usage "branch-name" "branch to cherry-pick and delete"
    return 1
  fi
  COMMITHASH="$1";
  git cp $COMMITHASH;
  git bd $COMMITHASH;
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
