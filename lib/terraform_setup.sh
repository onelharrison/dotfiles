#!/usr/bin/env sh

echo 'INIT: terraform setup initiated.'

VERSION=0.14.7

wget "https://releases.hashicorp.com/terraform/$VERSION/terraform_${VERSION}_linux_amd64.zip"
unzip "terraform_${VERSION}_linux_amd64.zip"
sudo mv terraform /usr/local/bin/

# Clean up working directory
rm "terraform_${VERSION}_linux_amd64.zip"

# Verify installation
terraform version

echo 'DONE: terraform setup completed.'
echo '--------'
