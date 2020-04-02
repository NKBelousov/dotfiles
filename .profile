source ~/.bash/env.sh;

if [ -n "$BASH_VERSION" ]; then
  if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
  fi
fi

xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
