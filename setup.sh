#!/usr/bin/env sh

export SCRIPT_ABS_PATH=$(readlink -f $0)
export SCRIPT_ABS_DIR=$(dirname $SCRIPT_ABS_PATH)

. $SCRIPT_ABS_DIR/lib/utils.sh

# Core
. $SCRIPT_ABS_DIR/bin/git_setup.sh
. $SCRIPT_ABS_DIR/bin/tmux_setup.sh
. $SCRIPT_ABS_DIR/bin/vim_setup.sh
. $SCRIPT_ABS_DIR/bin/zsh_setup.sh

# Language Environments
. $SCRIPT_ABS_DIR/bin/haskell_base_setup.sh
. $SCRIPT_ABS_DIR/bin/javascript_base_setup.sh
. $SCRIPT_ABS_DIR/bin/python_base_setup.sh
. $SCRIPT_ABS_DIR/bin/ruby_base_setup.sh

exec $SHELL
