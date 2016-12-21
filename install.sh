#!/bin/bash

find . -maxdepth 1 -type f | grep -v 'install' | xargs -L 1 -I {} cp {} ~/{}
vim +PlugInstall +PlugClean +PlugUpdate +qall
