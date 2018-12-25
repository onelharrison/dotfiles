#!/usr/bin/env bash

is_installed() {
  [ -x "$(command -v $1)" ]
}

install_software() {
  if [ -x "$(command -v apt-get)" ]; then
    sudo apt-get update
    sudo apt-get install $1 -y
  fi
}

check_or_install() {
  if is_installed $1; then
    echo "$1 is installed."
  else
    install_software $1
  fi
}

check_or_set_default_shell() {
  if [ -z "${SHELL##*$1*}" ]; then
    echo "Default shell is $1."
  else
    echo "Default shell has been set to $1."
    chsh -s $(which $1)
  fi
}

check_or_install git
echo
check_or_install tmux
echo
check_or_install vim
echo
check_or_install zsh
echo

check_or_set_default_shell zsh

cp ~/.tmux.conf ~/.tmux.conf.old 2>/dev/null
printf "source-file ~/git/dotfiles/tmux/tmux.conf" > ~/.tmux.conf

cp ~/.vimrc ~/.vimrc.old 2>/dev/null
printf "so ~/git/dotfiles/vim/vimrc.vim" > ~/.vimrc
rm -rf ~/.vim.old 2>/dev/null
mv ~/.vim ~/.vim.old 2>/dev/null
cp -r ~/git/dotfiles/vim/vim ~/.vim

cp ~/.zshrc ~/.zshrc.old 2>/dev/null
printf "source ~/git/dotfiles/zsh/zshrc" > ~/.zshrc

rbenv/src/configure && make -C rbenv/src

echo
echo "Log out and log back in for default shell to be initialized."
