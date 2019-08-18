#!/usr/bin/env sh

echo 'INIT: docker setup initiated.'

sudo apt-get update

# Install packages to allow apt to use a repository over HTTPS
sudo apt-get install apt-transport-https \
                     ca-certificates \
                     software-properties-common

# Add Docker's official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

if [ ! $(sudo apt-key fingerprint 0EBFCD88  | fgrep 'docker@docker.com' | wc -l) -eq 1 ]; then
  exit 1
fi

sudo apt-add-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

check_or_install docker-ce

echo 'DONE: docker setup completed.'
echo '--------'

