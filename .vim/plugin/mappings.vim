let mapleader=","
nnoremap <F2> :FindDefinition<CR>
nnoremap <F3> :PrettierAsync<CR>
nnoremap <F4> :Find <c-r>=expand("<cword>")<CR><CR>
nnoremap <F9> :Sass<CR>
nnoremap <F12> :Tagbar<CR>
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

" Commentor
nmap <leader>c <Plug>Commentor
xmap <leader>c <Plug>Commentor
nmap <leader>cc <Plug>CommentorLine

" Bookmarks
nmap <Leader>bt <Plug>BookmarkToggle
nmap <Leader>ba <Plug>BookmarkAnnotate
nmap <Leader>bl <Plug>BookmarkShowAll
nmap <Leader>bn <Plug>BookmarkNext
nmap <Leader>bp <Plug>BookmarkPrev
nmap <Leader>bc <Plug>BookmarkClear
nmap <Leader>bca <Plug>BookmarkClearAll
nmap <Leader>bmu <Plug>BookmarkMoveUp
nmap <Leader>bmd <Plug>BookmarkMoveDown
nmap <Leader>bml <Plug>BookmarkMoveToLine
