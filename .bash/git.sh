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


