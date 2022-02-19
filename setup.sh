#!/bin/bash

# set -o errexit

# readlink on macos differs from GNU readlink
# "brew install coreutils" provides greadlink
# which provides GNU readlink behavior
if [ -x "$(command -v greadlink)" ]; then
  export SCRIPT_ABS_PATH=$(greadlink -f $0)
elif [ -x "$(command -v readlink)" ]; then
  export SCRIPT_ABS_PATH=$(readlink -f $0)
fi

export SCRIPT_ABS_DIR=$(dirname $SCRIPT_ABS_PATH)

. $SCRIPT_ABS_DIR/lib/utils.sh

apps=(git tmux vim zsh)
for app in ${apps[@]}; do
  echo "BEGIN: ${app} setup initiated."
  . $SCRIPT_ABS_DIR/lib/${app}_setup.sh
  echo "END: ${app} setup completed."
done

langs=(javascript python)
for lang in ${langs[@]}; do
  echo "BEGIN: ${lang} setup initiated."
  . $SCRIPT_ABS_DIR/lib/${lang}_base_setup.sh
  echo "END: ${lang} setup completed."
done

cd $SCRIPT_ABS_DIR

# git submodule init
# git submodule update
