let mapleader=","
set pastetoggle=<F2>
nnoremap <F12> :!ctags -R --exclude=node_modules .<cr>
nnoremap <F2> :UndotreeToggle<CR>
nnoremap <F3> :PrettierAsync<CR>
nnoremap <F4> :Find <c-r>=expand("<cword>")<CR><CR>
nnoremap <F9> :Sass<CR>
nnoremap <leader><space> :noh<CR>
nnoremap <leader>F :Find<space>
nnoremap <leader>f /
nnoremap <leader>g :GFiles<CR>
nnoremap <leader>h :%s/<c-r>=expand("<cword>")<CR>/
nnoremap <leader>j <C-]>
nnoremap <leader>k <C-O>
nnoremap <leader>o :NERDTreeToggle<CR>
nnoremap Q @q
nnoremap j gj
nnoremap k gk
nmap <leader>c <Plug>Commentor
xmap <leader>c <Plug>Commentor
nmap <leader>cc <Plug>CommentorLine
