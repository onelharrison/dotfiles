#!/usr/bin/env sh

echo 'INIT: awscli setup initiated.'

INSTALL_DIR="$SCRIPT_ABS_DIR/tmp/awscli"
mkdir -p $INSTALL_DIR

# Install awscli
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" \
	-o "$INSTALL_DIR/awscliv2.zip" && \
	cd $INSTALL_DIR && \
	unzip awscliv2.zip && \
	sudo ./aws/install --update && \
	aws --version && \
	cd - && \
        rm -rf $INSTALL_DIR && \
        rm -rf $HOME/.aws && \
        ln -s $SCRIPT_ABS_DIR/conf/aws $HOME/.aws

echo 'DONE: awscli setup completed.'
echo '--------'
