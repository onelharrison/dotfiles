#!/bin/sh

set -o errexit

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

apps=(unzip
      xclip
      ag
      jq
      git
      tmux
      vim
      emacs
      zsh
      aws
      terraform)

for app in ${apps[@]}; do
  . $SCRIPT_ABS_DIR/lib/${app}_setup.sh
done

langs=(haskell
       javascript
       python
       ruby
       golang)

for lang in ${langs[@]}; do
  . $SCRIPT_ABS_DIR/lib/${lang}_base_setup.sh
done

cd $SCRIPT_ABS_DIR

git submodule init
git submodule update
