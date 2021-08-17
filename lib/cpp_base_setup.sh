#!/usr/bin/env sh

echo 'INIT: cpp setup initiated.'

check_or_install build-essential
check_or_install libssl-dev
check_or_install cmake

echo 'DONE: cpp setup completed.'
echo '--------'
