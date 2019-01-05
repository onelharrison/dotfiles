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
. $SCRIPT_ABS_DIR/bin/hs_base_setup.sh
. $SCRIPT_ABS_DIR/bin/js_base_setup.sh
. $SCRIPT_ABS_DIR/bin/py_base_setup.sh
. $SCRIPT_ABS_DIR/bin/rb_base_setup.sh

exec $SHELL
