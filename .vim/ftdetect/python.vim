" Proper PEP8 indentation
augroup python
  autocmd BufEnter,BufNewFile *.py set tabstop=4
  autocmd BufEnter,BufNewFile *.py set softtabstop=4
  autocmd BufEnter,BufNewFile *.py set shiftwidth=4
  autocmd BufEnter,BufNewFile *.py set textwidth=79
  autocmd BufEnter,BufNewFile *.py set expandtab
  autocmd BufEnter,BufNewFile *.py set autoindent
  autocmd BufEnter,BufNewFile *.py set fileformat=unix
augroup end
