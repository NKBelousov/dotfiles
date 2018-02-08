let mapleader=","
nnoremap <F3> :PrettierAsync<CR>
nnoremap <F4> :Find <c-r>=expand("<cword>")<CR><CR>
nnoremap <F9> :Sass<CR>
nnoremap <F12> :!ctags -R --exclude=node_modules .<cr>
nnoremap <leader><space> :noh<CR>
nnoremap <leader>F :Find<space>
nnoremap <leader>f /
nnoremap <leader>g :GFiles<CR>
nnoremap <leader>h :%s/<c-r>=expand("<cword>")<CR>/
nnoremap <leader>j <C-]>
nnoremap <leader>k <C-O>
nnoremap <leader>o :NERDTreeToggle<CR>
nnoremap j gj
nnoremap k gk
nnoremap <leader>" :sp<CR><C-W>J
nnoremap <leader>% :vsp<CR><C-W>L
nmap <leader>c <Plug>Commentor
xmap <leader>c <Plug>Commentor
nmap <leader>cc <Plug>CommentorLine
