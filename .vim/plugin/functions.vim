function Sass() range
  if executable('node-sass')
    echo system('echo '.shellescape(join(getline(a:firstline, a:lastline), "\n")).'| node-sass --output-style=expanded')
  else
    echo "node-sass is not installed"
  endif
endfunction
com -range=% -nargs=0 Sass :<line1>,<line2>call Sass()

