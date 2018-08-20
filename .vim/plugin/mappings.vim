let mapleader=","
nnoremap <F2> :FindDefinition<CR>
nnoremap <F3> :PrettierAsync<CR>
nnoremap <F4> :Find <c-r>=expand("<cword>")<CR><CR>
nnoremap <leader>" :sp<CR><C-W>J
nnoremap <leader>% :vsp<CR><C-W>L
nnoremap <leader><space> :noh<CR>
nnoremap <leader>F :Find<space>
nnoremap <leader>G :Files<CR>
nnoremap <leader>H :%s/<c-r>=expand("<cword>")<CR>/
nnoremap <leader>I :ImportCost<CR>
nnoremap <leader>f /
nnoremap <leader>g :GFiles<CR>
nnoremap <leader>h :s/<c-r>=expand("<cword>")<CR>/
nnoremap <leader>i :ImportCostSingle<CR>
nnoremap <leader>o :NERDTreeToggle<CR>
nnoremap <leader>s :Startify<CR>
nnoremap j gj
nnoremap k gk

" Commentor
nmap <leader>c <Plug>Commentor
xmap <leader>c <Plug>Commentor
nmap <leader>cc <Plug>CommentorLine
