#!/usr/bin/env bash

install_g() {
  echo 'INFO: Installing g'

  curl -sSL https://git.io/g-install | sh -s -- bash zsh

  echo 'INFO: Done installing g'
}

install_g
