#!/bin/bash

sudo pacman -Syu
sudo pacman -S neovim feh dmenu i3status otf-fira-code xorg-xinput arandr cmake libtool ledger tmux light pulsemixer slock rxvt-unicode yay fzf
yay -S cwm

sudo cp battery /usr/local/bin
sudo chmod +x /usr/local/bin

[ ! -d "$HOME/Pictures/Wallpapers/" ] && mkdir -p "$HOME/Pictures/Wallpapers"
[ ! -d "$HOME/.config/nvim/" ] && mkdir -p        "$HOME/.config/nvim"

ln -sfT "$HOME/dev/dotfiles/bashrc"       "$HOME/.bashrc"
ln -sfT "$HOME/dev/dotfiles/bash_profile" "$HOME/.bash_profile"
ln -sfT "$HOME/dev/dotfiles/gitconfig"    "$HOME/.gitconfig"
ln -sfT "$HOME/dev/dotfiles/cwmrc"        "$HOME/.cwmrc"
ln -sfT "$HOME/dev/dotfiles/Xresources"   "$HOME/.Xresources"
ln -sfT "$HOME/dev/dotfiles/xsession"     "$HOME/.xsession"
ln -sfT "$HOME/dev/dotfiles/init.vim"     "$HOME/.config/nvim/init.vim"
ln -sfT "$HOME/dev/dotfile/tmux.conf"     "$HOME/.tmux.conf"


git clone https://github.com/asdf-vm/asdf.git "$HOME/.asdf" --branch v0.7.2

curl -sSL https://get.haskellstack.org/ | sh
