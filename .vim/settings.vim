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
set t_Co=256 " 8 for xterm and screen, 256 for xterm-256color and screen-256color
set t_ut= " disable background color erase so that colorschemes render properly
" when inside tmux
syntax enable
syntax sync minlines=256

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
