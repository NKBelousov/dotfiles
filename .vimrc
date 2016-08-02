set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'JulesWang/css.vim'
Plugin 'Shougo/neocomplete.vim'
Plugin 'SirVer/ultisnips'
Plugin 'Valloric/MatchTagAlways'
Plugin 'ap/vim-css-color'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'honza/vim-snippets'
Plugin 'justinj/vim-react-snippets'
Plugin 'gcorne/vim-sass-lint'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'mattn/emmet-vim'
Plugin 'mhinz/vim-startify'
Plugin 'mickaobrien/vim-stackoverflow'
Plugin 'mileszs/ack.vim'
Plugin 'morhetz/gruvbox'
Plugin 'mxw/vim-jsx'
Plugin 'othree/html5.vim'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'othree/yajs.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'sjl/gundo.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()

filetype plugin on
filetype plugin indent on

set autoread
set wildmenu
set ruler
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set lazyredraw

set noerrorbells
set novisualbell
set t_vb=
set tm=500

set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set smartindent
set autoindent

set gdefault
set showmatch
set hlsearch
set incsearch
set ignorecase

set ffs=unix,dos,mac
set fencs=utf-8,cp1251,koi8-r,ucs-2,cp866

set number
set cursorline
set showcmd
set laststatus=2
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

set nobackup
set noswapfile

let NERDTreeShowHidden=1
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:ctrlp_custom_ignore = 'vendor\|node_modules\|.git'
let g:neocomplete#enable_at_startup = 1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_css_checkers = ['csslint']
let g:syntastic_sass_checkers = ['sass_lint']
let g:syntastic_scss_checkers = ['sass_lint']
let g:syntastic_php_checkers = ['php']

let mapleader=" "
nnoremap <leader>g :CtrlP<CR>
nnoremap <leader>G :silent Ack<space>
nnoremap <leader>f /
nnoremap <leader>F :silent Ggrep<space>
nnoremap <leader>h :%s/
nnoremap <leader>o :NERDTreeToggle<CR>
nnoremap <leader>c :TagbarToggle<CR>
nnoremap <leader><space> :noh<CR>
nnoremap <leader>n :tabn<CR>
nnoremap <leader>p :tabp<CR>
nnoremap j gj
nnoremap k gk
nnoremap <leader>j <C-]>
nnoremap <leader>k <C-O>
nnoremap <F4> <C-]>
nnoremap <F12> :!ctags -R --exclude=node_modules .<cr>
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
inoremap <C-h> <C-o>h
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-l> <C-o>l
map <Leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR>
nnoremap <leader>s :StackOverflow<space>

syntax enable
set t_Co=256
set background=light
colorscheme gruvbox
" echo 'TERM=xterm-256color' >>  ~/.bashrc

" Run these commands before startup
autocmd VimEnter * AirlineTheme gruvbox
autocmd BufWritePre * :%s/\s\+$//e
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
