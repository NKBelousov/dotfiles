#!/bin/bash

i3status --config ~/.config/i3/.i3status.conf | while :
do
  read line
  MASK=$(xset -q | grep -A 0 'LED' | cut -c59-67)
  if [ $MASK -gt 0 ]
  then
    LG='RU'
  else
    LG='EN'
  fi
  echo "$line | $LG" || exit 1
done
