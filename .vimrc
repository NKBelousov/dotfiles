set nocompatible
filetype off

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'FelikZ/ctrlp-py-matcher' " Faster CtrlP matcher based on python
Plug 'Valloric/YouCompleteMe', { 'do': 'cd ~/.vim/plugged/YouCompleteMe/third_party/ycmd/third_party/tern_runtime && npm install --production && cd ~/.vim/plugged/YouCompleteMe/ && ./install.py --all' } " A code completion engine for vim
Plug 'ap/vim-css-color' " Color keyword highlighter
Plug 'bronson/vim-trailing-whitespace' " Highlights and removes trailing whitespaces
Plug 'christoomey/vim-tmux-navigator' " Seamless navigation between vim and tmux
Plug 'joshdick/onedark.vim' " Atom Default Colorscheme
Plug 'junegunn/vim-plug' " Plugin manager
Plug 'kien/ctrlp.vim' " Fuzzy search for files, buffers, mru, tags, etc...
Plug 'kshenoy/vim-signature' " Plugin to place, toggle and display marks
Plug 'mattn/emmet-vim' " Expanding abbreviations for html & xml
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' } " Undotree management
Plug 'mileszs/ack.vim' " Better project search
Plug 'morhetz/gruvbox' " Gruvbox colorscheme
Plug 'mxw/vim-jsx' " Syntax highlighting and indenting for JSX
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } " File Explorer
Plug 'sheerun/vim-polyglot' " Syntax pack
Plug 'tpope/vim-fugitive' " git wrapper
Plug 'tpope/vim-surround' " tags/brackets/quotes management made simple
Plug 'tweekmonster/startuptime.vim' " Track startup time in readable format
Plug 'vim-airline/vim-airline' " Pretty status line
Plug 'w0rp/ale' " Asynchronous Lint Engine

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

set nobackup
set noswapfile

set guioptions=

let NERDTreeShowHidden=1
let g:acp_enableAtStartup = 0
let g:ctrlp_custom_ignore = 'vendor\|node_modules\|.git'
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

let g:ale_sign_column_always = 1
let g:ale_sign_error = '⨉'
let g:ale_sign_warning = '⚠'
" Disable tab navigation in YCM
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]
" YCM only supports python 2
let g:ycm_server_python_interpreter = '/usr/bin/python2.7'

highlight OverLength ctermbg=red ctermfg=white guibg=#592929

inoremap <C-h> <C-o>h
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-l> <C-o>l
let mapleader=","
map <Leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR>
nnoremap <F12> :!ctags -R --exclude=node_modules .<cr>
nnoremap <F2> :UndotreeToggle<CR>
nnoremap <F3> vi{=vi{:sort<CR>
nnoremap <F4> :Ack! <cword><CR>
nnoremap <F5> :redraw!<CR>
nnoremap <leader><space> :noh<CR>
nnoremap <leader>F :Ack!<space>
nnoremap <leader>f /
nnoremap <leader>g :CtrlP<CR>
nnoremap <leader>h :%s/
nnoremap <leader>j <C-]>
nnoremap <leader>k <C-O>
nnoremap <leader>o :NERDTreeToggle<CR>
nnoremap Q @q
nnoremap j gj
nnoremap k gk
nnoremap zz :w<CR>:bd<CR>
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
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType css,scss,less setlocal tabstop=2 shiftwidth=2 expandtab
    autocmd FileType css,scss,less setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html setlocal tabstop=2 shiftwidth=2 expandtab
    autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
augroup END
