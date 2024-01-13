#!/usr/bin/env bash

# instructs the script to exit if any command has a non-zero exit status [10]
set -e

DOTFILES=$(pwd -P)
XDG_CONFIG_HOME=$HOME/.local/config

# Source Files
source $DOTFILES/system/colors.sh # Colors for formatting printf commands

# +----------------------------------------------------------------------------+
# |                                 Functions                                  |
# +----------------------------------------------------------------------------+

info () {
  printf "[ ${light_blue}..${default} ] %s\n" "$1"
}

success () {
  printf "[ ${light_green}OK${default} ] %s\n" "$1"
}

fail () {
  printf "[${light_red}FAIL${default}] %s\n" "$1"
}

run_prompt () {
  # Prompt to continue
  echo -e "This script will delete all your configuration files!"
  read -n1 -sp $'Do you wish to continue? [Y/n]\n' key;
  if [[ "$key" =~ ^([^yY]?)$ ]]; then
    echo "Cancelling Setup."
    exit 1
  fi
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

    success 'env.zsh successfully created'
  else
    success 'env.zsh already exists'
  fi
}

run_installers () {
  cd "$(dirname $0)"/..
  find . -name install.sh | while read installer ; do sh -c "${installer}" ; done
}

link_file () {
  local src=$1 dst=$2

  mkdir -p $(dirname $dst)

  ln -sf "$src" "$dst"
  success "linked $src to $dst"
}

run_dotfiles () {
  # . "$DOTFILES/setup/setup-zsh.sh"

  info 'installng dotfiles'

  for src in $(find -H "$DOTFILES" -maxdepth 2 -name '*.symlink')
  do
    if [[ $(basename $src .symlink) == 'zshenv' ]]
    then
      dst="$HOME/.$(basename $src .symlink)"
    else
      dst="$XDG_CONFIG_HOME/$(basename $(dirname $src))/.$(basename $src .symlink)"
    fi

    link_file "$src" "$dst"
  done
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
run_dotfiles

