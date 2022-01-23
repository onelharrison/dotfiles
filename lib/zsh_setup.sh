#!/usr/bin/env sh

check_or_install zsh
check_or_set_default_shell zsh

mv $HOME/.zshrc $HOME/.zshrc.old 2>/dev/null
ln -s $SCRIPT_ABS_DIR/conf/zsh/zshrc $HOME/.zshrc
