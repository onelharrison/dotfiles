#!/usr/bin/env sh

export GIT_USER='onelharrison'
export GIT_HOME="$HOME/github.com/$GIT_USER"

# Setup space for git repos
mkdir -p  $GIT_HOME

# Setup global gitconfig
mv $HOME/.gitconfig $HOME/.gitconfig.old 2>/dev/null
ln -s $SCRIPT_ABS_DIR/conf/git/gitconfig $HOME/.gitconfig

# Setup global gitignore
mv $HOME/.gitignore $HOME/.gitignore.old 2>/dev/null
ln -s $SCRIPT_ABS_DIR/conf/git/gitignore $HOME/.gitignore
