# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
PATH="$PATH:$(ruby -e 'print Gem.user_dir')/bin"
export PATH="$PATH:$HOME/.rvm/bin"
