set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'mattn/emmet-vim'
Plugin 'mhinz/vim-startify'
Plugin 'scrooloose/nerdtree'
Plugin 'sickill/vim-monokai'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()

filetype plugin on
filetype indent on
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

let mapleader=" "
nnoremap <leader>f :CtrlP<CR>
nnoremap <leader>o :NERDTreeToggle<CR>
nnoremap <leader>c :TagbarToggle<CR>
nnoremap <space> :noh<CR>
nnoremap j gj
nnoremap k gk
nnoremap <leader>n :tabn<CR>
nnoremap <leader>p :tabp<CR>

syntax enable
set background=dark
colorscheme monokai
" echo 'TERM=xterm-256color' >>  ~/.bashrc

" Run these commands before startup
autocmd VimEnter * AirlineTheme dark
autocmd BufWritePre * :%s/\s\+$//e
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType html,xhtml setl ofu=htmlcomplete#CompleteTags
