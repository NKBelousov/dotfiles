set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'FelikZ/ctrlp-py-matcher'
Plugin 'JulesWang/css.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ap/vim-css-color'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'flazz/vim-colorschemes'
Plugin 'gcorne/vim-sass-lint'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'kien/ctrlp.vim'
Plugin 'kshenoy/vim-signature'
Plugin 'mattn/emmet-vim'
Plugin 'mileszs/ack.vim'
Plugin 'mxw/vim-jsx'
Plugin 'othree/html5.vim'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'othree/yajs.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-repeat'
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

set relativenumber
set cursorline
set showcmd
set laststatus=2
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

set nobackup
set noswapfile

set guioptions=

let NERDTreeShowHidden=1
let g:ctrlp_custom_ignore = 'vendor\|node_modules\|.git'
let g:acp_enableAtStartup = 0

let g:user_emmet_leader_key=','

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

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

let mapleader=" "
nnoremap <leader>g :CtrlP<CR>
nnoremap <leader>f /
nnoremap <leader>F :Ack!<space>
nnoremap <leader>h :%s/
nnoremap <leader>o :NERDTreeToggle<CR>
nnoremap <leader><space> :noh<CR>
nnoremap j gj
nnoremap k gk
nnoremap <leader>j <C-]>
nnoremap <leader>k <C-O>
nnoremap <F4> :Ack! <cword><CR>
nnoremap <F5> :redraw!<CR>
nnoremap <F12> :!ctags -R --exclude=node_modules .<cr>
inoremap <C-h> <C-o>h
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-l> <C-o>l
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
map <Leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR>
set pastetoggle=<F2>

syntax enable
syntax sync minlines=256

set t_Co=256
set background=dark
colorscheme badwolf

autocmd VimEnter * AirlineTheme badwolf
autocmd BufWritePre * :%s/\s\+$//e
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
