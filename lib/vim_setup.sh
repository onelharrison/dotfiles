#!/usr/bin/env sh

check_or_install vim

# vimrc
mv $HOME/.vimrc $HOME/.vimrc.old 2>/dev/null
ln -s $SCRIPT_ABS_DIR/conf/vim/vimrc.vim $HOME/.vimrc

# vimruntime
rm $HOME/.vim.old 2>/dev/null
mv $HOME/.vim $HOME/.vim.old 2>/dev/null
ln -s $SCRIPT_ABS_DIR/conf/vim/vimruntime/ $HOME/.vim

# coc
mkdir -p $SCRIPT_ABS_DIR/conf/vim/vimruntime/pack/plugins/start/
cd $SCRIPT_ABS_DIR/conf/vim/vimruntime/pack/plugins/start/
curl --fail -L https://github.com/neoclide/coc.nvim/archive/release.tar.gz \
  | tar xzfv -

mv $HOME/.config/coc $HOME/.config/coc.old 2>/dev/null
ln -s $SCRIPT_ABS_DIR/conf/coc/ $HOME/.config/coc

mkdir -p $SCRIPT_ABS_DIR/conf/coc/extensions/
cd $SCRIPT_ABS_DIR/conf/coc/extensions
if [ ! -f package.json ]; then
  echo '{"dependencies":{}}' > package.json
fi

check_or_install npm

npm install --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod \
  coc-marketplace \
  coc-explorer \
  coc-pyright \
  coc-git \
  coc-go \
  coc-ccls \
  coc-json \
  coc-tsserver \
  coc-groovy \
  coc-solargraph \
  coc-html \
  coc-css \
  coc-yaml \
  coc-sh \
  coc-spell-checker

cd -
