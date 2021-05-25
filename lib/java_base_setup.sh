#!/usr/bin/env sh

echo 'INIT: java setup initiated.'

check_or_install default-jre
check_or_install default-jdk

echo 'DONE: java setup completed.'
echo '--------'
