function Theme(theme,background)
  execute 'colorscheme '.a:theme
  execute 'set background='.a:background
  execute 'AirlineTheme '.a:theme
endfunction
com -nargs=0 Dark :call Theme("onedark","dark")
com -nargs=0 Light :call Theme("gruvbox","light")

function Sass() range
  if executable('node-sass')
    echo system('echo '.shellescape(join(getline(a:firstline, a:lastline), "\n")).'| node-sass --output-style=expanded')
  else
    echo "node-sass is not installed"
  endif
endfunction
com -range=% -nargs=0 Sass :<line1>,<line2>call Sass()

