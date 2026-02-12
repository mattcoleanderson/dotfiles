# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

macOS dotfiles repository for bootstrapping a new machine. Configs are organized by tool into topic folders, with zsh as the shell. Neovim config and the zsh prompt theme (purified) are separate git submodules.

## Setup

Run `./setup.sh` to install. It prompts for confirmation, creates `env/env.zsh` for secrets, then symlinks all `*.symlink` files to their proper locations under `$XDG_CONFIG_HOME` (~/.local/config).

## Architecture

### Topic folder convention

Each top-level directory is a "topic" (e.g., `git/`, `fzf/`, `tmux/`). Within topics, files are named by their role:

- `env.zsh` — environment variables (loaded first)
- `path.zsh` — PATH modifications (loaded second)
- `config.zsh`, `aliases.zsh`, `*.zsh` — general config (loaded third, excludes env/path/completion)
- `completion.zsh` — completion setup (loaded last, after compinit)

### ZSH loading order

`.zshenv.symlink` sets `$DOTFILES`, XDG base directories, and `$ZDOTDIR`. Then `.zshrc.symlink` glob-collects all `**/*.zsh` files and sources them in this order:

1. All `env.zsh` files
2. All `path.zsh` files
3. Everything else (excluding env/path/completion)
4. zsh-autocomplete plugin (from `~/.local/src/zsh-autocomplete/`)
5. All `completion.zsh` files

### Symlink convention

Files ending in `.symlink` get symlinked by `setup.sh`:
- `.zshenv.symlink` → `$HOME/.zshenv`
- `*.sh.symlink` → `$XDG_BIN_HOME/` (scripts)
- `*.plist.symlink` → `~/Library/LaunchAgents/`
- Top-level dir symlinks → `$XDG_CONFIG_HOME/<name>` (e.g., `nvim.symlink` → `~/.local/config/nvim`)
- Nested file symlinks → `$XDG_CONFIG_HOME/<parent-dir>/<name>`

### XDG Base Directories

Everything lives under `~/.local/`:
- Config: `~/.local/config` (`$XDG_CONFIG_HOME`)
- Data: `~/.local/share` (`$XDG_DATA_HOME`)
- Cache: `~/.local/cache` (`$XDG_CACHE_HOME`)
- Binaries: `~/.local/bin` (`$XDG_BIN_HOME`)
- Source: `~/.local/src` (`$XDG_SRC_HOME`)

### Git submodules

- `prompt/` — purified zsh prompt theme (mattcoleanderson/purified)
- `nvim.symlink/` — neovim config (mattcoleanderson/nvim), has its own repo on the `main` branch

### Source references

Numbered references in comments (e.g., `[3]`) correspond to URLs listed in `SOURCES.md`. New sources must be appended (never inserted) to preserve reference integrity.

## Key files

- `env/env.zsh` — unversioned file for sensitive env vars (gitignored)
- `homebrew/Brewfile` — all Homebrew packages and casks
- `git/config.symlink` — git config; uses SSH signing and includes `config-work` for `~/repos/work/` paths
- `aerospace/aerospace.toml.symlink` — AeroSpace tiling window manager config
- `tmux/tmux.conf.symlink` — tmux config (prefix: Ctrl+Space, catppuccin/cyberdream theme)
- `wezterm/wezterm.lua.symlink` — WezTerm terminal config (Iosevka Nerd Font, cyberdream theme)

## Commands

```sh
# Install Homebrew packages
brew bundle --file=homebrew/Brewfile

# Run full setup (symlinks everything)
./setup.sh
```
