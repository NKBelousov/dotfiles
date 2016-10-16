#!/bin/bash

find . -maxdepth 1 -type f | grep -v 'install' | xargs -L 1 -I {} cp {} ~/{}
mkdir -p ~/.vim/UltiSnips/ && cp -r ./UltiSnips/ ~/.vim/
