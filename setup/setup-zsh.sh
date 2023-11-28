#!/usr/bin/env zsh

mkdir -p "$ZDOTDIR"

# Symlink ZSH DOTFILES to respective locations
ln -sf "$DOTFILES/configs/zsh/zshenv" "$HOME/.zshenv"
ln -sf "$DOTFILES/configs/zsh/zshrc" "$ZDOTDIR/.zshrc"
