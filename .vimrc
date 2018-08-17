if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'Quramy/tsuquyomi' " A Vim plugin for TypeScript
Plug 'SirVer/ultisnips' " Ultimate solution for snippets in vim
Plug 'ap/vim-css-color' " Color keyword highlighter
Plug 'christoomey/vim-tmux-navigator' " Seamless navigation between vim and tmux
Plug 'heavenshell/vim-jsdoc' " Generate JSDoc to your JavaScript code.
Plug 'itchyny/lightline.vim' " A light and configurable statusline/tabline plugin for Vim
Plug 'joshdick/onedark.vim' " A dark Vim/Neovim color scheme inspired by Atom's One Dark syntax theme.
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-plug' " Plugin manager
Plug 'kshenoy/vim-signature' " Plugin to toggle, display and navigate marks 
Plug 'ludovicchabant/vim-gutentags' " A Vim plugin that manages your tag files
Plug 'manasthakur/vim-commentor' " Toggling commends became easier!
Plug 'maralla/completor.vim', { 'do': 'make js' } " Async completion framework made ease
Plug 'mattn/emmet-vim' " Expanding abbreviations for html & xml
Plug 'misterbuckley/vim-definitive' " Vim plugin for finding variable/class/function definitions, without relying on tags
Plug 'othree/csscomplete.vim' " Update the bult-in CSS complete function to latest CSS standard.
Plug 'prettier/vim-prettier', { 'do': 'yarn install' } " A vim plugin wrapper for prettier
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } " File Explorer
Plug 'sheerun/vim-polyglot' " Syntax pack
Plug 'stephpy/vim-php-cs-fixer' " Integrate php-cs-fixer
Plug 'tpope/vim-abolish' " abolish.vim: easily search for, substitute, and abbreviate multiple variants of a word
Plug 'tpope/vim-fugitive' " a Git wrapper so awesome, it should be illegal
Plug 'tweekmonster/startuptime.vim' " Track startup time in readable format
Plug 'w0rp/ale' " Asynchronous Lint Engine
Plug 'xtal8/traces.vim' " Highlight patterns and ranges for ex commands
Plug 'yardnsm/vim-import-cost', { 'do': 'npm install' } " Display the import size of the JavaScript packages in Vim!

call plug#end()

augroup prepare
  autocmd!
  autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md PrettierAsync
  autocmd FileType css,scss,less setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType php,phtml setlocal omnifunc=phpcomplete#CompletePHP
augroup END
