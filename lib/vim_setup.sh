#!/usr/bin/env sh

echo 'INIT: vim setup initiated.'

check_or_install vim

mv $HOME/.vimrc $HOME/.vimrc.old 2>/dev/null
ln -s $SCRIPT_ABS_DIR/conf/vim/vimrc.vim $HOME/.vimrc

rm -rf $HOME/.vim.old/ 2>/dev/null
mv $HOME/.vim/ $HOME/.vim.old/ 2>/dev/null
rm -rf $HOME/.vim
ln -s $SCRIPT_ABS_DIR/conf/vim/vimruntime/ $HOME/.vim

# Install CoC
mkdir -p $SCRIPT_ABS_DIR/conf/vim/vimruntime/pack/plugins/start/
cd $SCRIPT_ABS_DIR/conf/vim/vimruntime/pack/plugins/start/
curl --fail -L https://github.com/neoclide/coc.nvim/archive/release.tar.gz \
  | tar xzfv -

echo 'DONE: vim setup completed.'
echo '--------'
