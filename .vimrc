set nocompatible
filetype off

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-plug' " Plugin manager
Plug 'FelikZ/ctrlp-py-matcher' " Faster CtrlP matcher based on python
Plug 'JulesWang/css.vim' " Vim CSS syntax file
Plug 'Valloric/YouCompleteMe', { 'do': 'cd ~/.vim/plugged/YouCompleteMe/third_party/ycmd/third_party/tern_runtime && npm install --production && cd ~/.vim/plugged/YouCompleteMe/ && ./install.py --all' } " A code completion engine for vim
Plug 'ap/vim-css-color' " Color keyword highlighter
Plug 'bronson/vim-trailing-whitespace' " Highlights and removes trailing whitespaces
Plug 'christoomey/vim-tmux-navigator' " Seamless navigation between vim and tmux
Plug 'joshdick/onedark.vim' " Atom Default Colorscheme
Plug 'kien/ctrlp.vim' " Fuzzy search for files, buffers, mru, tags, etc...
Plug 'kshenoy/vim-signature' " Plugin to place, toggle and display marks
Plug 'mattn/emmet-vim' " Expanding abbreviations for html & xml
Plug 'mbbill/undotree', { 'on': 'UndoTreeToggle' } " Undotree management
Plug 'mileszs/ack.vim' " Better project search
Plug 'mxw/vim-jsx' " Syntax highlighting and indenting for JSX
Plug 'othree/html5.vim' " HTML5 omnicomplete and syntax
Plug 'othree/javascript-libraries-syntax.vim' " Syntax for javascript libraries: jQuery, Underscore/lo-dash, Backbone, Angular, React, etc...
Plug 'othree/yajs.vim' " Javascript syntax file
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } " File Explorer
Plug 'scrooloose/syntastic' " Syntax checking hacks for vim
Plug 'tpope/vim-fugitive' " git wrapper
Plug 'tpope/vim-haml' " Haml, Sass, SCSS
Plug 'tpope/vim-repeat' " dot command for plugins
Plug 'tpope/vim-surround' " tags/brackets/quotes management made simple
Plug 'vim-airline/vim-airline' " Pretty status line

call plug#end()

filetype plugin on " enable loading plugin files
filetype plugin indent on " enable loading indent files

set wildmenu " command line completion
set backspace=eol,start,indent " backspace working as intended
set whichwrap+=<,>,h,l " move to next/previous line
set lazyredraw

set noerrorbells " no beeping
set novisualbell " no flashes
set t_vb= " never flash the screen

set tabstop=4 " how many spaces to show instead of tab
set shiftwidth=4 " how many spaces to use for >> and <<
set smarttab " smart addition and deletion of tabs
set expandtab " expand tabs to spaces
set smartindent " automatically indent new line

set foldmethod=indent " fold blocks based on indentation
set nofoldenable " open folds by default

set gdefault " automatically sets global flag for substitution
set showmatch " show matching bracket
set smartcase " smartcase for search patterns
set hlsearch " highlight all matches
set incsearch " show matches as I type
" Damian Conway's Die Blinkënmatchen: highlight matches
nnoremap <silent> n n:call HLNext(0.1)<cr>
nnoremap <silent> N N:call HLNext(0.1)<cr>
function! HLNext (blinktime)
  let target_pat = '\c\%#'.@/
  let ring = matchadd('ErrorMsg', target_pat, 101)
  redraw
  exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
  call matchdelete(ring)
  redraw
endfunction

set fileformats=unix,dos,mac
set fileencodings=utf-8,cp1251,koi8-r,ucs-2,cp866

set relativenumber " show line numbers relative to current
set cursorline " highlight current line
set cursorcolumn " highlight current column
set colorcolumn=80 " show vertical line over 80 character limit
set showcmd " show partial command in the last line of the screen
set laststatus=2 " always show status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

set nobackup
set noswapfile

set guioptions=

let NERDTreeShowHidden=1
let g:ctrlp_custom_ignore = 'vendor\|node_modules\|.git'
let g:acp_enableAtStartup = 0

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_sass_checkers = ['sass_lint']
let g:syntastic_scss_checkers = ['sass_lint']

let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'

" Disable tab navigation in YCM
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn
highlight OverLength ctermbg=red ctermfg=white guibg=#592929

let mapleader=" "
nnoremap j gj
nnoremap k gk
nnoremap Q @q
nnoremap <leader>g :CtrlP<CR>
nnoremap <leader>f /
nnoremap <leader>F :Ack!<space>
nnoremap <leader>h :%s/
nnoremap <leader>o :NERDTreeToggle<CR>
nnoremap <leader><space> :noh<CR>
nnoremap <leader>j <C-]>
nnoremap <leader>k <C-O>
nnoremap <F2> :UndotreeToggle<CR>
nnoremap <F3> vi{:sort<CR>vi{==
nnoremap <F4> :Ack! <cword><CR>
nnoremap <F5> :redraw!<CR>
nnoremap <F12> :!ctags -R --exclude=node_modules .<cr>
inoremap <C-h> <C-o>h
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-l> <C-o>l
map <Leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR>
set pastetoggle=<F2>

set t_Co=256 " 8 for xterm and screen, 256 for xterm-256color and screen-256color
set background=dark
set t_ut= " disable background color erase so that colorschemes render properly
" when inside tmux
colorscheme onedark
syntax enable
syntax sync minlines=256

augroup prepare
    autocmd VimEnter * AirlineTheme onedark
    autocmd BufWritePre * :%s/\s\+$//e
    autocmd BufWritePre * :match OverLength /\%81v.\+/
    autocmd FileType php,phtml setlocal omnifunc=phpcomplete#CompletePHP
    autocmd FileType php,phtml setlocal tabstop=4 shiftwidth=4 expandtab
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType javascript setlocal tabstop=4 shiftwidth=4 expandtab
    autocmd FileType css,scss,less setlocal tabstop=2 shiftwidth=2 expandtab
    autocmd FileType css,scss,less setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html setlocal tabstop=2 shiftwidth=2 expandtab
    autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
augroup END
