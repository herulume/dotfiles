#!/bin/bash

sudo pacman -Syu
sudo pacman -S neovim feh dmenu i3status otf-fira-code xorg-xinput arandr cmake libtool ledger
tmux
light pulsemixer slock rxvt-unicode yay fzf lemonbar
yay -S cwm

[ ! -d "~/Pictures/Wallpapers/" ] && mkdir -p ~/Pictures/Wallpapers
[ ! -d "~/.config/nvim/" ] && mkdir -p ~/.config/nvim

ln -sfT $HOME/dev/dotfiles/bashrc ~/.bashrc
ln -sfT $HOME/dev/dotfiles/bash_profile ~/.bash_profile
ln -sfT $HOME/dev/dotfiles/gitconfig ~/.gitconfig
ln -sfT $HOME/dev/dotfiles/cwmrc ~/.cwmrc
ln -sfT $HOME/dev/dotfiles/Xresources ~/.Xresources
ln -sfT $HOME/dev/dotfiles/xsession ~/.xsession
ln -sfT $HOME/dev/dotfiles/init.vim ~/.config/nvim/init.vim
ln -sfT $HOME/dev/dotfile/tmux.conf ~/.tmux.conf


git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.2

#curl -sSL https://get.haskellstack.org/ | sh
