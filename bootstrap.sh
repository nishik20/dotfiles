#!/bin/bash -eux

echo "Clone dotfiles repository..."
git clone --recursive https://github.com/nishik20/dotfiles.git $HOME/.dotfiles

echo "Symlink dotfiles..."
pushd $HOME/.dotfiles
for f in $(find . -name ".*" -maxdepth 1); do
    name=$(echo $f | sed -e 's|\.\/||')
    if [ $name != "." ] && [ $name != ".git" ]; then
        ln -sf $HOME/.dotfiles/$name $HOME/$name
    fi
done
popd

echo "Installing package..."
if [ -f /etc/debian_version ]; then
    sudo apt-get install -y zsh silversearcher-ag
elif [ -f /etc/redhat-release ]; then
    sudo yum install -y zsh the_silver_searcher
fi
