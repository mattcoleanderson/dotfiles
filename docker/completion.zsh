# Use Docker's current completion, including Compose support.
if (( $+commands[docker] )); then
  source <(docker completion zsh)
fi
