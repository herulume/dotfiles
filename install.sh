#!/bin/sh

sudo dnf install git fzf neovim tmux

mkdir -p ~/.config/nvim/
mkdir ~/.i3


sudo pip3 install --upgrade neovim

cp tmux.conf ~/.tmux.conf
cp init.vim ~/.config/nvim/init.vim
cp kitty.conf ~/.config/kitty/
cp config ~/.i3/config

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
