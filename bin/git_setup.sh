#!/usr/bin/env sh

echo 'INIT: git setup initiated.'

check_or_install git

mv $HOME/.gitconfig $HOME/.gitconfig.old 2>/dev/null
ln -s $SCRIPT_ABS_DIR/conf/git/gitconfig ~/.gitconfig

mv $HOME/.gitignore $HOME/.gitignore.old 2>/dev/null
ln -s $SCRIPT_ABS_DIR/conf/git/gitignore_global ~/.gitignore_global

git config --global core.excludesfile ~/.gitignore_global


echo 'DONE: git setup completed.'
echo '--------'

