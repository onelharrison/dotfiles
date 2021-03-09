#!/usr/bin/env sh

echo 'INIT: bash setup initiated.'

# Install npm
check_or_install npm

# Install bash-language-server
npm i -g bash-language-server

echo 'DONE: bash setup completed.'
echo '--------'
