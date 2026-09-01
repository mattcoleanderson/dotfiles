asdf_golang_env="${ASDF_DATA_DIR:-$HOME/.asdf}/plugins/golang/set-env.zsh"
[[ -f "$asdf_golang_env" ]] && . "$asdf_golang_env"
unset asdf_golang_env
