#!/bin/sh

ln -sf /home/yunishik/dotfiles/.vim ~/.vim
ln -sf /home/yunishik/dotfiles/.vimrc ~/.vimrc
ln -sf /home/yunishik/dotfiles/.zshrc ~/.zshrc
ln -sf /home/yunishik/dotfiles/.zsh_profile ~/.zsh_profile

sudo rpm -ivh http://swiftsignal.com/packages/centos/6/x86_64/the-silver-searcher-0.14-1.el6.x86_64.rpm
