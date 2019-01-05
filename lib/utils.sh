#!/usr/bin/env sh

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
    echo "SKIP: $1 is installed."
  else
    install_software $1
  fi
}

check_or_set_default_shell() {
  if [ -z "${SHELL##*$1*}" ]; then
    echo "INFO: default shell is $1."
  else
    echo "INFO: default shell has been set to $1."
    chsh -s $(which $1)
  fi
}

