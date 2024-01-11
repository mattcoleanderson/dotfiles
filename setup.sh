#!/usr/bin/env bash

set -e # instructs the script to exit if any command has a non-zero exit status [10]

# Source Files

# TODO: This script will create a fresh environment when ran. Needs to be written
source ./configs/zsh/zshenv

cat << "EOF"
         88                               
         88              ,d               
         88              88               
 ,adPPYb,88  ,adPPYba, MM88MMM ,adPPYba,  
a8"    `Y88 a8"     "8a  88    I8[    ""  
8b       88 8b       d8  88     `"Y8ba,   
"8a,   ,d88 "8a,   ,a8"  88,   aa    ]8I  
 `"8bbdP"Y8  `"YbbdP"'   "Y888 `"YbbdP"'
EOF

# Prompt to continue

echo -e "This script will delete all your configuration files!"
read -n1 -sp $'Do you wish to continue? [Y/n]\n' key;
if [[ "$key" =~ ^([^yY]?)$ ]]; then
  echo "Cancelling Setup."
  exit 1
fi

# Setup

. "$DOTFILES/setup/setup-zsh.sh"

