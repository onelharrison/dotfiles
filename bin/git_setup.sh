#!/usr/bin/env sh

echo 'INIT: git setup initiated.'

export GIT_USER='onelharrison'
export GIT_HOME="$HOME/github.com/$GIT_USER"

check_or_install git

# Setup space for git repos
mkdir -p  $HOME/github.com
mkdir -p  $HOME/github.com/$GIT_USER

# Setup global gitconfig
mv $HOME/.gitconfig $HOME/.gitconfig.old 2>/dev/null
ln -s $SCRIPT_ABS_DIR/conf/git/gitconfig $HOME/.gitconfig

# Setup global gitignore
mv $HOME/.gitignore $HOME/.gitignore.old 2>/dev/null
ln -s $SCRIPT_ABS_DIR/conf/git/gitignore_global $HOME/.gitignore

echo 'DONE: git setup completed.'
echo '--------'

