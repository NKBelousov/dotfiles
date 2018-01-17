source ~/.vim/plugins.vim
source ~/.vim/settings.vim
source ~/.vim/functions.vim
source ~/.vim/mappings.vim

augroup prepare
  autocmd VimEnter * Dark
  autocmd BufWritePre * :%s/\s\+$//e
  autocmd BufWritePre * :match OverLength /\%81v.\+/
  autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md PrettierAsync
  autocmd FileType css,scss,less setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType php,phtml setlocal omnifunc=phpcomplete#CompletePHP
augroup END
