#!/usr/bin/env sh

echo 'INIT: javascript setup initiated.'

export N_PREFIX="$SCRIPT_ABS_DIR/conf/n"

check_or_install npm

git clone https://github.com/tj/n.git 2>/dev/null

cd n
PREFIX="$N_PREFIX" make uninstall
PREFIX="$N_PREFIX" make install
cd -

rm -rf n

echo "export PATH=\"\$PATH:$N_PREFIX\"" \
      >> $SCRIPT_ABS_DIR/conf/zsh/zshrc_extended

. $SCRIPT_ABS_DIR/conf/zsh/zshrc

n lts

echo 'DONE: javascript setup completed.'
echo '--------'

# Node packages 
# npm install -g prettier
