if [ -d ~/.local/aliases.d ]; then
    for file in ~/.local/aliases.d/*; do
        source $file
    done
fi
