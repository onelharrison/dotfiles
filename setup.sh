#!/usr/bin/env sh

export SCRIPT_ABS_PATH=$(readlink -f $0)
export SCRIPT_ABS_DIR=$(dirname $SCRIPT_ABS_PATH)

. $SCRIPT_ABS_DIR/lib/utils.sh

# Core
. $SCRIPT_ABS_DIR/lib/xclip_setup.sh
. $SCRIPT_ABS_DIR/lib/ag_setup.sh
. $SCRIPT_ABS_DIR/lib/git_setup.sh
. $SCRIPT_ABS_DIR/lib/tmux_setup.sh
. $SCRIPT_ABS_DIR/lib/vim_setup.sh
. $SCRIPT_ABS_DIR/lib/emacs_setup.sh
. $SCRIPT_ABS_DIR/lib/zsh_setup.sh

# Language Environments
. $SCRIPT_ABS_DIR/lib/haskell_base_setup.sh
. $SCRIPT_ABS_DIR/lib/javascript_base_setup.sh
. $SCRIPT_ABS_DIR/lib/python_base_setup.sh
. $SCRIPT_ABS_DIR/lib/ruby_base_setup.sh

exec $SHELL
