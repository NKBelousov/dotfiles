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
  # Get battery status
  BATTERY=`acpi`
  # Get current volume
  VOLUME_STATE=`amixer -D pulse get Master | egrep 'Playback.*?\[o' | egrep -o '\[o.+\]' | head -1`
  if [[ $VOLUME_STATE == '[on]' ]]; then
    VOLUME_LEVEL=$(amixer -D pulse get Master | grep 'Left:' | awk -F'[][]' '{ print $2 }')
    VOLUME="♪: $VOLUME_LEVEL"
  else
    VOLUME="♪:  ⃠"
  fi
  echo "$line | $BATTERY | $VOLUME | $LG " || exit 1
done
