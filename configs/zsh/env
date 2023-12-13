#!/bin/sh
####################################################################################################
#                                      ENVIRONMENT VARIABLES                                       #
####################################################################################################
#               NOTE: Environment Variable setup has moved here from './zshenv' [9]                #
####################################################################################################

export REPOS="$HOME/repos" # Location of all my version controlled projects

# +----------------------------------------------------------------------------+
# |                                    ZSH                                     |
# +----------------------------------------------------------------------------+
# +--- ZSH Run-Help Variables ---------------------------------------+
export HELPDIR="/usr/share/zsh/$ZSH_VERSION/help" # Help files for zsh builtins [1]

# +--- History Variables [8] ----------------------------------------+
export HISTFILE="$ZDOTDIR/.zhistory" # Path to zsh history file
export HISTSIZE=10000                # Number of commands loadded into memory from history file
export SAVEHIST=10000                # Number of commands stored in zsh history file

# +----------------------------------------------------------------------------+
# |                        Manually Installed Packages                         |
# +----------------------------------------------------------------------------+

# +--- NVM (Node Version Manager) -----------------------------------+
export NVM_DIR="$XDG_DATA_HOME/nvm" # NVM Root

# +--- Cargo (Rust Package Manager)----------------------------------+
export CARGO_HOME="$XDG_DATA_HOME"/cargo # Cargo Root

# +----------------------------------------------------------------------------+
# |                        Homebrew Installed Packages                         |
# +----------------------------------------------------------------------------+

# +--- Homebrew -----------------------------------------------------+
export HOMEBREW_PREFIX="/opt/homebrew" # Homebrew Root [6]

# +--- Pyenv --------------------------------------------------------+
export PYENV_ROOT="$XDG_DATA_HOME/pyenv" # Pyenv Root

# +----------------------------------------------------------------------------+
# |                             Path Modification                              |
# +----------------------------------------------------------------------------+

PATH="$CARGO_HOME/bin:$PATH"                            # Cargo
PATH="$HOMEBREW_PREFIX/bin:$HOMEBREW_PREFIX/sbin:$PATH" # Homebrew [7]
