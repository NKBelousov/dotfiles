#!/bin/bash

pomodoro(){
  if [[ -z $1 ]]; then
    echo "Specify duration"
    return 1
  fi
  if [[ -z $2 ]]; then
    echo "Specify message"
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
