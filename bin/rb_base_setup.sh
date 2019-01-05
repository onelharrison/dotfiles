#!/usr/bin/env sh

# Install rbenv

check_or_install_ruby_build_prereqs() {
  echo 'Checking/Installing rbenv prereqs...'
  check_or_install autoconf
  check_or_install bison
  check_or_install build-essential
  check_or_install libssl-dev
  check_or_install libyaml-dev
  check_or_install libreadline6-dev
  check_or_install zlib1g-dev
  check_or_install libncurses5-dev
  check_or_install libffi-dev
  check_or_install libgdbm5
  # check_or_install libgdbm3
  echo 'Done checking/installing rbenv prereqs.'
}

RBENV_ROOT="$SCRIPT_ABS_DIR/conf/rbenv"

echo 'INIT: ruby base setup initiated.'

if [ ! -d "$RBENV_ROOT" ]; then

  echo 'RUNNING: Installing rbenv...'
  git clone git@github.com:rbenv/rbenv.git $SCRIPT_ABS_DIR/conf/rbenv

  $SCRIPT_ABS_DIR/conf/rbenv/src/configure
  make -C $SCRIPT_ABS_DIR/conf/rbenv/src

  echo "export RBENV_ROOT=\"$RBENV_ROOT\"" \
      >> $SCRIPT_ABS_DIR/conf/zsh/zshrc_extended

  echo "export PATH=\"\$PATH:$RBENV_ROOT/bin\"" \
      >> $SCRIPT_ABS_DIR/conf/zsh/zshrc_extended
  echo '--> done installing rbenv.'

  check_or_install_ruby_build_prereqs

  mkdir -p $SCRIPT_ABS_DIR/conf/rbenv/plugins
  rm -rf $SCRIPT_ABS_DIR/conf/rbenv/plugins/ruby-build

  git clone git@github.com:rbenv/ruby-build.git \
      $SCRIPT_ABS_DIR/conf/rbenv/plugins/ruby-build

  . $SCRIPT_ABS_DIR/conf/zsh/zshrc_extended
else
  echo 'SKIP: rbenv is installed.'
fi

echo 'DONE: ruby base setup completed.'
echo '--------'

