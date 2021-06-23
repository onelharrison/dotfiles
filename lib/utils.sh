#!/usr/bin/env sh

is_installed() {
  [ -x "$(command -v $1)" ]
}

install_software() {
  if [ -x "$(command -v apt-get)" ]; then
    sudo apt-get update
    sudo apt-get install $1 -y
  elif [ -x "$(command -v brew)" ]; then
    brew install $1
  fi
}

check_or_install() {
  if is_installed $1; then
    echo "SKIP: $1 is already installed."
  else
    install_software $1
  fi
}

check_or_set_default_shell() {
  if [ -z "${SHELL##*$1*}" ]; then
    echo "INFO: $1 is the default shell."
  else
    echo "INFO: $1 has been set as the default shell."
    chsh -s $(which $1)
  fi
}
