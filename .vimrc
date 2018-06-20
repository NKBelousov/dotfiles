if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'MattesGroeger/vim-bookmarks' " Vim bookmark plugin
Plug 'Quramy/tsuquyomi' " A Vim plugin for TypeScript
Plug 'SirVer/ultisnips' " Ultimate solution for snippets in vim
Plug 'andymass/vim-matchup' " matchit replacement and more
Plug 'ap/vim-css-color' " Color keyword highlighter
Plug 'bronson/vim-trailing-whitespace' " Highlights and removes trailing whitespaces
Plug 'christoomey/vim-tmux-navigator' " Seamless navigation between vim and tmux
Plug 'davidhalter/jedi-vim' " Using the jedi autocompletion library for VIM.
Plug 'joshdick/onedark.vim' " Atom Default Colorscheme
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-plug' " Plugin manager
Plug 'kshenoy/vim-signature' " Plugin to toggle, display and navigate marks 
Plug 'ludovicchabant/vim-gutentags' " A Vim plugin that manages your tag files
Plug 'machakann/vim-sandwich' " The set of operator and textobject plugins to search/select/edit sandwiched textobjects.
Plug 'majutsushi/tagbar' " Vim plugin that displays tags in a window, ordered by scope
Plug 'manasthakur/vim-commentor' " Toggling commends became easier!
Plug 'maralla/completor.vim', { 'do': 'make js' } " Async completion framework made ease
Plug 'mattn/emmet-vim' " Expanding abbreviations for html & xml
Plug 'misterbuckley/vim-definitive' " Vim plugin for finding variable/class/function definitions, without relying on tags
Plug 'morhetz/gruvbox' " Retro groove colorscheme for Vim
Plug 'nvie/vim-flake8' " Flake8 plugin for Vim
Plug 'othree/csscomplete.vim' " Update the bult-in CSS complete function to latest CSS standard.
Plug 'prettier/vim-prettier', { 'do': 'yarn install' } " A vim plugin wrapper for prettier
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } " File Explorer
Plug 'sheerun/vim-polyglot' " Syntax pack
Plug 'tpope/vim-fugitive' " a Git wrapper so awesome, it should be illegal
Plug 'tweekmonster/startuptime.vim' " Track startup time in readable format
Plug 'vim-airline/vim-airline' " Pretty status line
Plug 'w0rp/ale' " Asynchronous Lint Engine
Plug 'xtal8/traces.vim' " Highlight patterns and ranges for ex commands

call plug#end()

augroup prepare
  autocmd VimEnter * Dark
  autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md PrettierAsync
  autocmd FileType css,scss,less setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType php,phtml setlocal omnifunc=phpcomplete#CompletePHP
augroup END
