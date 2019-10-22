# define pyenv environment vars
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
# add `pyenv init` to shell
# if command -v pyenv 1>/dev/null 2>&1; then eval "$(pyenv init -)" fi
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi
