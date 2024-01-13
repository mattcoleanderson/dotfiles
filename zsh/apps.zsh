#!/usr/bin/env zsh
####################################################################################################
#                                                                                                  #
#                                       Applications & Tools                                       #
#                                                                                                  #
####################################################################################################
#          For configuring all third-party apps and tools. This file is sourced by zshrc           #
####################################################################################################

# +----------------------------------------------------------------------------+
# |                                   Python                                   |
# +----------------------------------------------------------------------------+
# +--- Pyenv (Python Version Manager) -------------------------------+
eval "$(pyenv init -)" # Initialize pyenv as a shell function

# +----------------------------------------------------------------------------+
# |                                  Node.js                                   |
# +----------------------------------------------------------------------------+
# +--- NVM (Node Version Manager) -----------------------------------+
source "$NVM_DIR/nvm.sh" # Source NVM Shell Script
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # Load nvm bash_completion

# +----------------------------------------------------------------------------+
# |                                    Rust                                    |
# +----------------------------------------------------------------------------+
# +--- Cargo (Rust Package Manager)----------------------------------+
source "$CARGO_HOME/env"

# +----------------------------------------------------------------------------+
# |                                                                            |
# +----------------------------------------------------------------------------+