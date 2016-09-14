set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim' " Plugin Manager
Plugin 'FelikZ/ctrlp-py-matcher' " Faster CtrlP matcher based on python
Plugin 'JulesWang/css.vim' " Vim CSS syntax file
Plugin 'Valloric/YouCompleteMe' " A code completion engine for vim
Plugin 'ap/vim-css-color' " Color keyword highlighter
Plugin 'bronson/vim-trailing-whitespace' " Highlights and removes trailing whitespaces
Plugin 'christoomey/vim-tmux-navigator' " Seamless navigation between vim and tmux
Plugin 'flazz/vim-colorschemes' " Colorscheme pack
Plugin 'gcorne/vim-sass-lint' " sass-lint syntastic syntax checker
Plugin 'jlanzarotta/bufexplorer' " Faster buffer swapping & exploring
Plugin 'kien/ctrlp.vim' " Fuzzy search for files, buffers, mru, tags, etc...
Plugin 'kshenoy/vim-signature' " Plugin to place, toggle and display marks
Plugin 'mattn/emmet-vim' " Expanding abbreviations for html & xml
Plugin 'mileszs/ack.vim' " Better project search
Plugin 'mxw/vim-jsx' " Syntax highlighting and indenting for JSX
Plugin 'othree/html5.vim' " HTML5 omnicomplete and syntax
Plugin 'othree/javascript-libraries-syntax.vim' " Syntax for javascript libraries: jQuery, Underscore/lo-dash, Backbone, Angular, React, etc...
Plugin 'othree/yajs.vim' " Javascript syntax file
Plugin 'scrooloose/nerdcommenter' " Useful shortcuts for commentary management
Plugin 'scrooloose/nerdtree' " File explorer
Plugin 'scrooloose/syntastic' " Syntax checking hacks for vim
Plugin 'tpope/vim-fugitive' " git wrapper
Plugin 'tpope/vim-haml' " Haml, Sass, SCSS
Plugin 'tpope/vim-repeat' " dot command for plugins
Plugin 'tpope/vim-surround' " tags/brackets/quotes management made simple
Plugin 'vim-airline/vim-airline' " Pretty status line
Plugin 'vim-airline/vim-airline-themes' " Themes for vim-airline

call vundle#end()

filetype plugin on " enable loading plugin files
filetype plugin indent on " enable loading indent files

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
