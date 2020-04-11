#!/usr/bin/env sh

echo 'INIT: awscli setup initiated.'

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

rm -rf awscliv2.zip
rm -rf ./aws

echo 'DONE: awscli setup completed.'
echo '--------'

