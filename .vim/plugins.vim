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
Plug 'morhetz/gruvbox' " Retro groove colorscheme for Vim
Plug 'prettier/vim-prettier', { 'do': 'yarn install' } " A vim plugin wrapper for prettier
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } " File Explorer
Plug 'sheerun/vim-polyglot' " Syntax pack
Plug 'tweekmonster/startuptime.vim' " Track startup time in readable format
Plug 'vim-airline/vim-airline' " Pretty status line
Plug 'w0rp/ale' " Asynchronous Lint Engine
Plug 'xtal8/traces.vim' " Highlight patterns and ranges for ex commands

call plug#end()
