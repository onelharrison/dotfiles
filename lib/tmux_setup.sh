#!/usr/bin/env sh

check_or_install tmux

mv $HOME/.tmux.conf $HOME/.tmux.conf.old 2>/dev/null
ln -s $SCRIPT_ABS_DIR/conf/tmux/tmux.conf $HOME/.tmux.conf
