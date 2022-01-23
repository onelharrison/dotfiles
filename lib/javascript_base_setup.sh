#!/usr/bin/env sh

# Install n
# =========
git clone https://github.com/tj/n.git 2>/dev/null

export N_PREFIX="$SCRIPT_ABS_DIR/conf/n"
echo "export N_PREFIX=\"$SCRIPT_ABS_DIR/conf/n\"" >> $SCRIPT_ABS_DIR/conf/zsh/zshrc_extended

cd n
PREFIX="$N_PREFIX" make uninstall
PREFIX="$N_PREFIX" make install
cd -

rm -rf n 2>/dev/null

echo "export PATH=\"$N_PREFIX/bin:\$PATH\"" \
      >> $SCRIPT_ABS_DIR/conf/zsh/zshrc_extended

. $SCRIPT_ABS_DIR/conf/zsh/zshrc

# Install node and npm
# ====================
n lts

mv $HOME/.npmrc $HOME/.npmrc.old 2>/dev/null
ln -s $SCRIPT_ABS_DIR/conf/npm/npmrc ~/.npmrc

NPM_PACKAGES=$SCRIPT_ABS_DIR/conf/npm/packages
mkdir -p $NPM_PACKAGES

echo "export NPM_PACKAGES=\"$NPM_PACKAGES\"" >> $SCRIPT_ABS_DIR/conf/zsh/zshrc_extended

npm config set prefix $NPM_PACKAGES

echo "export NODE_PATH=\"\$NPM_PACKAGES/lib/node_modules:\$NODE_PATH\"" \
  >> $SCRIPT_ABS_DIR/conf/zsh/zshrc_extended

echo "export PATH=\"\$NPM_PACKAGES/bin:\$PATH\"" \
  >> $SCRIPT_ABS_DIR/conf/zsh/zshrc_extended

. $SCRIPT_ABS_DIR/conf/zsh/zshrc

# Install prettier
# ================
npm install -g prettier
