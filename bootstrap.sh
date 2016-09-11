#!/bin/bash -eu

echo "Clone dotfiles repository..."
git clone --recursive https://github.com/nishik20/dotfiles.git $HOME/.dotfiles

echo "Symlink dotfiles..."
for f in $(find $HOME/.dotfiles -name ".*" -maxdepth 1); do
    name=$(echo $f | sed -e 's|\.\/||')
    if [ $name != "." -o $name != ".git" ]; then
        ln -sf $HOME/.dotfiles/$name $HOME/$name
    fi
done
