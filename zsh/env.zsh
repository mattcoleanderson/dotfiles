####################################################################################################
#                                      ENVIRONMENT VARIABLES                                       #
####################################################################################################
#               NOTE: Environment Variable setup has moved here from './zshenv' [9]                #
####################################################################################################
# TODO: put most of these into invidual folders

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
# |                             Miscellanious                                  |
# +----------------------------------------------------------------------------+

# TODO: Find a way to set these here in the else, but set them to nvr in `neovim-remote`
# this way we don't fail everything if nvr isn't installed
if [ -n "$NVIM_LISTEN_ADDRESS" ]; then
    export VISUAL="nvr -cc split --remote-wait +'set bufhidden=wipe'"
    export EDITOR="nvr -cc split --remote-wait +'set bufhidden=wipe'"
else
    export VISUAL="nvim"
    export EDITOR="nvim"
fi

