#!/bin/sh

echo 'INIT: terraform setup initiated.'

TF_VERSION=0.14.7
TF_LSP_VERSION=0.0.11-beta2
INSTALL_DIR="$SCRIPT_ABS_DIR/tmp/terraform"

mkdir -p $INSTALL_DIR

# Install terraform
wget -O "$INSTALL_DIR/terraform_${TF_VERSION}_linux_amd64.zip" \
	"https://releases.hashicorp.com/terraform/$TF_VERSION/terraform_${TF_VERSION}_linux_amd64.zip" && \
	cd $INSTALL_DIR && \
	unzip "$INSTALL_DIR/terraform_${TF_VERSION}_linux_amd64.zip" && \
	mv terraform $SCRIPT_ABS_DIR/bin/ && \
        terraform version && \
	cd -

# Install terraform-lsp
wget -O "$INSTALL_DIR/terraform-lsp_${TF_LSP_VERSION}_linux_amd64.tar.gz" \
	"https://github.com/juliosueiras/terraform-lsp/releases/download/v${TF_LSP_VERSION}/terraform-lsp_${TF_LSP_VERSION}_linux_amd64.tar.gz" && \
	cd $INSTALL_DIR && \
	tar -xvf "terraform-lsp_${TF_LSP_VERSION}_linux_amd64.tar.gz" && \
	mv terraform-lsp $SCRIPT_ABS_DIR/bin/  && \
	cd -

# Clean up install directory
rm -rf $INSTALL_DIR

echo 'DONE: terraform setup completed.'
echo '--------'
