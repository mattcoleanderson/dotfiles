#!/bin/bash

start_main () {
  # Constants
  SESSION_NAME="main"
  SESSION_DEFAULT_DIR=~/

  # Start new session with the name, or attach if it already exists
  tmux new-session -ds $SESSION_NAME -c $SESSION_DEFAULT_DIR || tmux attach -t $SESSION_NAME

  # Create new windows
  tmux rename-window -t $SESSION_NAME:0 "zsh" # The 0-indexed window is created by default, so we use the rename command instead
  # tmux new-window -t $SESSION_NAME:1 -n "test" # example command to create a new window

  # Run commands in each window
  # tmux send-keys -t $SESSION_NAME:0 'cd ~' C-m

  tmux attach -t $SESSION_NAME
}

start_acc () {
  # Constants
  SESSION_NAME="acc"
  SESSION_DEFAULT_DIR=~/repos/work/AutoCallCenter/
  
  WINDOW_0_DIR=~/repos/work/AutoCallCenter/acc-terraform/
  WINDOW_1_DIR=~/repos/work/AutoCallCenter/acc-webhook-lambda/
  WINDOW_2_DIR=~/repos/work/AutoCallCenter/acc-auto-call-worker/

  # Start new session with the name, or attach if it already exists
  tmux new-session -ds $SESSION_NAME -c $SESSION_DEFAULT_DIR || tmux attach -t $SESSION_NAME

  # Create a new window
  tmux rename-window -t $SESSION_NAME:0 "terraform"
  tmux new-window -t $SESSION_NAME:1 -n "lambda" -c $WINDOW_1_DIR
  tmux new-window -t $SESSION_NAME:2 -n "worker" -c $WINDOW_2_DIR

  # Run commands in each window
  tmux send-keys -t $SESSION_NAME:0 "cd $WINDOW_0_DIR && nvim" C-m
  # tmux send-keys -t $SESSION_NAME:0 'cd ~/repos/work/AutoCallCenter/acc-terraform && nvim' C-m
  tmux send-keys -t $SESSION_NAME:1 'nvim' C-m
  tmux send-keys -t $SESSION_NAME:2 'nvim' C-m

  tmux attach -t $SESSION_NAME
}

run_prompt () {
  # Start sessions
  echo "Please choose a tmux session to start:"
  echo -e "\t0 - Main (general purpose)"
  echo -e "\t1 - Automated Call Center (First Orion project)"

  read -p "Enter a number from above: " choice
  case "$choice" in
    0)
      start_main
      ;;
    1)
      start_acc
      ;;
    *)
      echo "$choice is not a valid option"
      run_prompt
      ;;
  esac
}

run_prompt

