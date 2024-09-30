#!/bin/sh
####################################################################################################
#                                             Aliases                                              #
####################################################################################################

# +--- ZSH ----------------------------------------------------------+
# unalias run-help && autoload run-help && alias help=run-help # Setup ZSH run-help function [1]

# +--- ls -----------------------------------------------------------+
if [[ "$OS" == "Darwin" ]]; then
  alias ls='gls --color=auto'                                # Basic list
  alias la='gls --color=auto -A'                             # Basic list, Show Hidden
  alias ll='gls --color=auto --group-directories-first -l'   # Long Format, Directories first
  alias lla='gls --color=auto --group-directories-first -lA' # Long Format, Directories first, Show Hidden
  alias lt='gls --color=auto -lhtr'                          # Long Format, Sort by Oldest
  alias lta='gls --color=auto -lAhtr'                        # Long Format, Sort by Oldest, Show Hidden
else
  alias ls='ls --color=auto'                                # Basic list
  alias la='ls --color=auto -A'                             # Basic list, Show Hidden
  alias ll='ls --color=auto --group-directories-first -l'   # Long Format, Directories first
  alias lla='ls --color=auto --group-directories-first -lA' # Long Format, Directories first, Show Hidden
  alias lt='ls --color=auto -lhtr'                          # Long Format, Sort by Oldest
  alias lta='ls --color=auto -lAhtr'                        # Long Format, Sort by Oldest, Show Hidden
fi 
