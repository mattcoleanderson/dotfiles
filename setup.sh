#!/usr/bin/env bash

# instructs the script to exit if any command has a non-zero exit status [10]
set -e

# Source Files

# TODO: This script will create a fresh environment when ran. Needs to be written
source ./configs/zsh/zshenv

# +----------------------------------------------------------------------------+
# |                               Confirm Setup                                |
# +----------------------------------------------------------------------------+

run_prompt () {
  # Prompt to continue
  echo -e "This script will delete all your configuration files!"
  read -n1 -sp $'Do you wish to continue? [Y/n]\n' key;
  if [[ "$key" =~ ^([^yY]?)$ ]]; then
    echo "Cancelling Setup."
    exit 1
  fi
}

info () {
  printf "\r $1\n"
}

create_env_config () {
  if ! [ -f env/env.zsh ]
  then
    info 'create env config for sensitive data'

    mkdir -p env
    printf '%s\n' \
      "# Store all sensitive environment variables here" \
      "# This file is unversioned and should NOT be added to version control" \
      > ./env/env.zsh

    info 'env.zsh successfully created'
  else
    info 'env.zsh already exists'
  fi
}

run_installers () {
  cd "$(dirname $0)"/..
  find . -name install.sh | while read installer ; do sh -c "${installer}" ; done
}

run_dotfiles () {
  . "$DOTFILES/setup/setup-zsh.sh"
}


# +----------------------------------------------------------------------------+
# |                                   Setup                                    |
# +----------------------------------------------------------------------------+

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

run_prompt
create_env_config
# run_dotfiles

