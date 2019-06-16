#!/bin/sh

sudo dnf install git feh redshit fzf neovim tmux

mkdir -p ~/.config/nvim/
mkdir ~/.i3
mkdir -p ~/Pictures/Wallpapers

sudo pip3 install --upgrade neovim

cp tmux.conf ~/.tmux.conf
cp init.vim ~/.config/nvim/init.vim
cp kitty.conf ~/.config/kitty/
cp config ~/.i3/config


git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.2
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
curl -sSL https://get.haskellstack.org/ | sh
