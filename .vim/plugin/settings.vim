set wildmenu " command line completion
set backspace=eol,start,indent " backspace working as intended
set whichwrap+=<,>,h,l " move to next/previous line

set timeoutlen=1000 ttimeoutlen=0 " remove esc delay

set shiftwidth=2 " how many spaces to use for >> and <<
set softtabstop=2 " how many spaces to use when performing editing operations,
" like inserting <TAB> or using <BS>
set expandtab " expand tabs to spaces
set smartindent " automatically indent new line

set foldmethod=indent

set gdefault " automatically sets global flag for substitution
set showmatch " show matching bracket
set ignorecase " ignorecase when all entered characters are lowercase
set smartcase " smartcase for search patterns
set hlsearch " highlight all matches
set incsearch " show matches as I type

set fileformats=unix,dos
set fileencodings=utf-8,cp1251,koi8-r,ucs-2,cp866

set relativenumber " show line numbers relative to current
set colorcolumn=80 " show vertical line over 80 character limit
set showcmd " show partial command in the last line of the screen
set laststatus=2 " always show status line

set clipboard^=unnamed,unnamedplus
set nobackup
set noswapfile
set undodir=~/.vim/undodir " persistent edit history across file closure
set undofile

set guioptions=
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

set background=light
colorscheme desert

let g:jsx_ext_required = 0 " allow jsx in .js files
let NERDTreeShowHidden = 1

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
