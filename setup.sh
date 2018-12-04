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
  if [ is_installed $1 ]; then;
    echo "$1 is installed."
  else
    install_software $1
  fi
}

check_or_set_default_shell() {
  if [ -z "${SHELL##*$1*}" ] ;then
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

cp ~/.tmux.conf ~/.tmux.conf.old
printf "source-file ~/dotfiles/tmux/tmux.conf" > ~/.tmux.conf

cp ~/.vimrc ~/.vimrc.old
printf "so ~/dotfiles/vim/vimrc.vim" > ~/.vimrc

cp ~/.zshrc ~/.zshrc.old
printf "source ~/dotfiles/zsh/zshrc" > ~/.zshrc

echo
echo "Log out and log back in for default shell to be initialized."
