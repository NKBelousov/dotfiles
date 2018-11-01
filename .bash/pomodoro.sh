#!/bin/bash

pomodoro(){
  if [ $# -ne 2 ]; then
    echo "pomodoro usage: duration message"
    echo "    duration            number of seconds to wait"
    echo "    message             message to display"
    return 1
  fi
  sleep $1 && notify-send $2 &>/dev/null &disown;
}

pomodoro-work(){
  pomodoro 1500 "Start working!"
}

pomodoro-short(){
  pomodoro 300 "Short break"
}

pomodoro-long(){
  pomodoro 3600 "Long break"
}
