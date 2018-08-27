#!/bin/bash

i3status --config ~/.config/i3/.i3status.conf | while :
do
  read line
  # Get current keyboard layout
  MASK=$(xset -q | grep -A 0 'LED' | cut -c59-67)
  if [ $MASK -gt 0 ]
  then
    LG='RU'
  else
    LG='EN'
  fi
  # Get current volume
  VOLUME=$(amixer -D pulse get Master | grep 'Left:' | awk -F'[][]' '{ print $2 }')
  echo "$line | ♪: $VOLUME | $LG " || exit 1
done
