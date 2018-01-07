filetype off

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'SirVer/ultisnips' " Ultimate solution for snippets in vim
Plug 'andymass/vim-matchup' " matchit replacement and more
Plug 'ap/vim-css-color' " Color keyword highlighter
Plug 'bronson/vim-trailing-whitespace' " Highlights and removes trailing whitespaces
Plug 'christoomey/vim-tmux-navigator' " Seamless navigation between vim and tmux
Plug 'joshdick/onedark.vim' " Atom Default Colorscheme
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-plug' " Plugin manager
Plug 'manasthakur/vim-commentor' " Toggling commends became easier!
Plug 'maralla/completor.vim', { 'do': 'make js' } " Async completion framework made ease
Plug 'mattn/emmet-vim' " Expanding abbreviations for html & xml
Plug 'metakirby5/codi.vim' " The interactive scratchpad for hackers
Plug 'prettier/vim-prettier', { 'do': 'yarn install' } " A vim plugin wrapper for prettier
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } " File Explorer
Plug 'sheerun/vim-polyglot' " Syntax pack
Plug 'tweekmonster/startuptime.vim' " Track startup time in readable format
Plug 'vim-airline/vim-airline' " Pretty status line
Plug 'w0rp/ale' " Asynchronous Lint Engine
Plug 'xtal8/traces.vim' " Highlight patterns and ranges for ex commands

call plug#end()

filetype plugin indent on " enable loading indent files and plugins

set wildmenu " command line completion
set backspace=eol,start,indent " backspace working as intended
set whichwrap+=<,>,h,l " move to next/previous line

set noerrorbells " no beeping
set novisualbell " no flashes
set t_vb= " never flash the screen
set timeoutlen=1000 ttimeoutlen=0 " remove esc delay

set tabstop=2 " how many spaces to show instead of tab
set shiftwidth=2 " how many spaces to use for >> and <<
set smarttab " smart addition and deletion of tabs
set expandtab " expand tabs to spaces
set smartindent " automatically indent new line

set foldmethod=indent

set gdefault " automatically sets global flag for substitution
set showmatch " show matching bracket
set ignorecase " ignorecase when all entered characters are lowercase
set smartcase " smartcase for search patterns
set hlsearch " highlight all matches
set incsearch " show matches as I type

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

if executable('rg')
  set grepprg=rg\ --vimgrep
  set grepformat=%f:%l:%c:%m
  command! -bang -nargs=* Find
    \ call fzf#vim#grep('rg --column --line-number --no-heading --color=always '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
else
  echo "ripgrep is not installed"
endif

let g:jsx_ext_required = 0 " allow jsx in .js files
let NERDTreeShowHidden=1
let g:acp_enableAtStartup = 0

let g:ale_sign_column_always = 1
let g:ale_sign_error = '⨉'
let g:ale_sign_warning = '⚠'

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Change html attributes in jsx files
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
  \      'extends' : 'jsx',
  \  },
  \}
let g:prettier#exec_cmd_async = 1

highlight OverLength ctermbg=red ctermfg=white guibg=#592929

let mapleader=","
set pastetoggle=<F2>
nnoremap <F12> :!ctags -R --exclude=node_modules .<cr>
nnoremap <F2> :UndotreeToggle<CR>
nnoremap <F3> :PrettierAsync<CR>
nnoremap <F4> :Find <c-r>=expand("<cword>")<CR><CR>
nnoremap <F9> :Sass<CR>
nnoremap <leader><space> :noh<CR>
nnoremap <leader>F :Find<space>
nnoremap <leader>f /
nnoremap <leader>g :GFiles<CR>
nnoremap <leader>h :%s/<c-r>=expand("<cword>")<CR>/
nnoremap <leader>j <C-]>
nnoremap <leader>k <C-O>
nnoremap <leader>o :NERDTreeToggle<CR>
nnoremap Q @q
nnoremap j gj
nnoremap k gk
nmap <leader>c <Plug>Commentor
xmap <leader>c <Plug>Commentor
nmap <leader>cc <Plug>CommentorLine
nnoremap / /\v
vnoremap / /\v
cnoremap %s/ %smagic/
cnoremap >s/ >smagic/
nnoremap :g/ :g/\v
nnoremap :g// :g//

set t_Co=256 " 8 for xterm and screen, 256 for xterm-256color and screen-256color
set background=dark
set t_ut= " disable background color erase so that colorschemes render properly
" when inside tmux
colorscheme onedark
syntax enable
syntax sync minlines=256

function Sass() range
  if executable('node-sass')
    echo system('echo '.shellescape(join(getline(a:firstline, a:lastline), "\n")).'| node-sass --output-style=expanded')
  else
    echo "node-sass is not installed"
  endif
endfunction
com -range=% -nargs=0 Sass :<line1>,<line2>call Sass()

augroup prepare
  autocmd BufWritePre * :%s/\s\+$//e
  autocmd BufWritePre * :match OverLength /\%81v.\+/
  autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md PrettierAsync
  autocmd FileType css,scss,less setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType php,phtml setlocal omnifunc=phpcomplete#CompletePHP
  autocmd VimEnter * AirlineTheme onedark
augroup END
