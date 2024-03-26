# Git Last Hash. Copies last commit has to clipboard
# Useful for updating go mod versions
alias glh=$'git log --abbrev-commit | head -n 1 | awk \'{print $NF}\' | tr -d \'\n\' | pbcopy'

