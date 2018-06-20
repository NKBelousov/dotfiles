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
set cursorline " highlight current line
set cursorcolumn " highlight current column
set colorcolumn=80 " show vertical line over 80 character limit
set showcmd " show partial command in the last line of the screen
set laststatus=2 " always show status line

set nobackup
set noswapfile

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

let g:jsx_ext_required = 0 " allow jsx in .js files
let NERDTreeShowHidden=1
let g:acp_enableAtStartup = 0

let g:ale_sign_column_always = 1
let g:ale_sign_error = 'E'
let g:ale_sign_warning = 'W'
let g:ale_completion_enabled = 1

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

let g:bookmark_annotation_sign = '☰'
let g:bookmark_auto_close = 1
let g:bookmark_auto_save = 1
let g:bookmark_show_toggle_warning = 0
let g:bookmark_show_warning = 0
let g:bookmark_sign = '☰'

let g:completor_css_omni_trigger = '([\w-]+|@[\w-]*|[\w-]+:\s*[\w-]*)$'
let g:completor_scss_omni_trigger = '([\w-]+|@[\w-]*|[\w-]+:\s*[\w-]*)$'

let g:definitive_definitions = {
  \ 'javascript': '\<\(\(class\|const\|let\|var\)\s\+%1\>\|\(function\s\+\)\=%1\s*(.*)\s*{\|class\s\+%1\s*{\)',
  \ 'javascript.jsx': '\<\(\(class\|const\|let\|var\)\s\+%1\>\|\(function\s\+\)\=%1\s*(.*)\s*{\|class\s\+%1\s*{\)',
  \}

" Change html attributes in jsx files
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
  \      'extends' : 'jsx',
  \  },
  \}
let g:prettier#exec_cmd_async = 1

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
