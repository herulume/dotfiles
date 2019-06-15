#!/bin/sh

sudo pacman -S git fzf neovim tmux kitty ttf-dejavu stylish-haskell

mkdir -p ~/.config/nvim/

sudo pip3 install --upgrade neovim

cp tmux.conf ~/.tmux.conf
cp init.vim ~/.config/nvim/init.vim
cp kitty.conf ~/.config/kitty/


git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
