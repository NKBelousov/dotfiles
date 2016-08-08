set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'FelikZ/ctrlp-py-matcher'
Plugin 'JulesWang/css.vim'
Plugin 'Shougo/neocomplcache.vim'
Plugin 'SirVer/ultisnips'
Plugin 'ap/vim-css-color'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'flazz/vim-colorschemes'
Plugin 'gcorne/vim-sass-lint'
Plugin 'honza/vim-snippets'
Plugin 'joonty/vim-phpqa'
Plugin 'justinj/vim-react-snippets'
Plugin 'kien/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'mileszs/ack.vim'
Plugin 'mxw/vim-jsx'
Plugin 'othree/html5.vim'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'othree/yajs.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-haml'
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

let NERDTreeShowHidden=1
let g:ctrlp_custom_ignore = 'vendor\|node_modules\|.git'
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_min_syntax_length = 3

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

let mapleader=" "
nnoremap <leader>g :CtrlP<CR>
nnoremap <leader>f /
nnoremap <leader>F :Ack!<space>
nnoremap <leader>h :%s/
nnoremap <leader>o :NERDTreeToggle<CR>
nnoremap <leader><space> :noh<CR>
nnoremap <leader>n :tabn<CR>
nnoremap <leader>p :tabp<CR>
nnoremap j gj
nnoremap k gk
nnoremap <leader>j <C-]>
nnoremap <leader>k <C-O>
nnoremap <F4> :Ack! <cword><CR>
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
set pastetoggle=<F2>

syntax enable
syntax sync minlines=256

set t_Co=256
set background=dark
colorscheme badwolf

function! LintScss()
    set makeprg=scss-lint
    silent make
    copen
    redraw!
endfunction

function! LintJS()
    set makeprg=eslint\ --config\ ~/.eslintrc\ %
    silent make
    copen
    redraw!
endfunction

autocmd VimEnter * AirlineTheme badwolf
autocmd BufWritePre * :%s/\s\+$//e
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd BufWritePost *.scss call LintScss()
autocmd BufWritePost *.js call LintJS()
autocmd BufWritePost *.jsx call LintJS()


if !exists('g:neocomplcache_force_omni_patterns')
  let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_force_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_force_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
