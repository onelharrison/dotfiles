#!/usr/bin/env sh

haskell_platform_installed() {
  [ ! "$(apt list --installed haskell-platform \
      | grep 'haskell-platform' \
      | wc -l)" -eq "0" ]
}

echo 'INIT: haskell base setup initiated.'

if haskell_platform_installed; then
  echo 'SKIP: haskell-platform is installed.'
else
  # install haskell-platform
  install_software haskell-platform
  # install stack
  curl -sSL https://get.haskellstack.org/ | sh
  # install hindent
  stack install hindent
fi

echo 'DONE: haskell base setup completed.'
echo '--------'

