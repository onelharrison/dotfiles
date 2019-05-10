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
  install_software haskell-platform
fi

echo 'DONE: haskell base setup completed.'
echo '--------'

