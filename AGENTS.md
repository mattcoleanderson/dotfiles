# Repository Notes

macOS dotfiles for bootstrapping a new machine. Configs are grouped by tool/topic directory; `*.symlink` files are installed into XDG-style locations under `~/.local/`.

## Commands

- Install Homebrew dependencies with `brew bundle --file=homebrew/Brewfile`.
- Run `./setup.sh` for full install; it prompts first, creates gitignored `env/env.zsh` if missing, installs the Catppuccin tmux plugin if needed, then force-updates symlinks with `ln -nsf`.
- There is no test suite or CI config in this repo; verify shell changes with targeted syntax checks such as `zsh -n <file>` when practical.

## Setup Behavior

- `setup.sh` only scans `*.symlink` paths up to depth 2 from the repo root.
- `zsh/.zshenv.symlink` installs to `$HOME/.zshenv`; it hard-codes `DOTFILES="$HOME/repos/dotfiles"`, exports XDG vars rooted at `~/.local`, and sets `ZDOTDIR="$XDG_CONFIG_HOME/zsh"`.
- Other symlink destinations are based on filename: `*.sh.symlink` to `$XDG_BIN_HOME`, `*.plist.symlink` to `~/Library/LaunchAgents`, directory symlinks to `$XDG_CONFIG_HOME/<name>`, and nested file symlinks to `$XDG_CONFIG_HOME/<parent>/<name>`.

## Zsh Loading

- `zsh/.zshrc.symlink` glob-collects `$DOTFILES/**/*.zsh` and sources files in this order: all `env.zsh`, all `path.zsh`, everything except `env/path/completion`, `~/.local/src/zsh-autocomplete/zsh-autocomplete.plugin.zsh`, then all `completion.zsh`.
- Topic-level `env.zsh`, `path.zsh`, `config.zsh`, aliases, and completion files are intentionally loaded by filename convention rather than explicit imports.
- `zsh/fpath.zsh` prepends every top-level topic directory to `fpath`, so completions/functions can live beside each tool's config.

## Repo-Specific Constraints

- `env/env.zsh` is intentionally unversioned and gitignored for secrets; do not add it to git.
- `SOURCES.md` numbered links are referenced by comments like `[3]`; append new sources only, never insert or reorder existing entries.
- `prompt/` and `nvim.symlink/` are git submodules; `nvim.symlink/` tracks branch `main` and has its own repository history.
- `git/config.symlink` uses SSH commit signing and includes `git/config-work.symlink` only for repos under `~/repos/work/`.
