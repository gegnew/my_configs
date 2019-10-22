#make neovim default text editor
export EDITOR='nvim'
export VISUAL='nvim'
set -o vi

#alias vim to nvim, unless it isn't installed
if type nvim > /dev/null 2>&1; then
    alias vim='nvim'
fi
