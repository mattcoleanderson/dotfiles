# Claude Code specific environment variables.
# Documentation can be found here:
#   https://code.claude.com/docs/en/settings#environment-variables


# moves the following dirs and files to the XDG config space:
#   - ~/.claude/
#   - ~/.claude.json (and all of its backups)
export CLAUDE_CONFIG_DIR="$XDG_CONFIG_HOME/claude"
