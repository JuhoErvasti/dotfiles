#!/bin/bash

function show_help {
  echo "Usage: $1 <directory>"
}

CPP=false

for var in "$@"; do
  if [ "$var" == "--c++" ]; then
    CPP=true
  fi
done

if [ ! -d $1 ] || [ "$1" == "" ]; then
  show_help
  exit
fi

cd $1

if [ "$TMUX" = "" ]; then
  tmux new-session -d
  tmux send 'nvim' ENTER

  if [ $CPP = true ]; then
    tmux split-pane
    tmux resize-pane -t 1 -D 100
    tmux select-pane -t 1
  fi

  tmux a
else
  cd $1

  if [ $CPP = true ]; then
    tmux split-pane
    tmux resize-pane -t 1 -D 100
    tmux select-pane -t 1
  fi

  nvim
fi
