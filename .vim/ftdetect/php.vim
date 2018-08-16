" https://www.php-fig.org/psr/psr-2/
augroup php
  autocmd BufEnter,BufNewFile *.php set expandtab
  autocmd BufEnter,BufNewFile *.php set shiftwidth=4
  autocmd BufEnter,BufNewFile *.php set softtabstop=4
  autocmd BufEnter,BufNewFile *.php set tabstop=4
  autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()
augroup end
