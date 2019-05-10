#!/usr/bin/env sh

RBENV_ROOT="$SCRIPT_ABS_DIR/conf/rbenv"
RBENV_ROOT_PLUGINS=$RBENV_ROOT/plugins

install_rbenv() {
  echo 'INFO: Installing rbenv.'
  git clone git@github.com:rbenv/rbenv.git $SCRIPT_ABS_DIR/conf/rbenv

  $SCRIPT_ABS_DIR/conf/rbenv/src/configure
  make -C $SCRIPT_ABS_DIR/conf/rbenv/src

  echo "export RBENV_ROOT=\"$RBENV_ROOT\"" \
      >> $SCRIPT_ABS_DIR/conf/zsh/zshrc_extended

  echo "export PATH=\"\$PATH:$RBENV_ROOT/bin\"" \
      >> $SCRIPT_ABS_DIR/conf/zsh/zshrc_extended

  . $SCRIPT_ABS_DIR/conf/zsh/zshrc_extended

  echo 'INFO: Done installing rbenv.'
}

check_or_install_ruby_build_dependencies() {
  echo 'INFO: Checking/installing ruby-build dependencies.'
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
  # INFO: use libgdbm3 if libgdbm5 is not available
  # check_or_install libgdbm3
  echo 'INFO: Done checking/installing ruby-build dependencies.'
}

install_rbenv_plugin() {
  echo 'INFO: Installing rbenv ruby-build plugin.'
  mkdir -p $RBENV_ROOT_PLUGINS
  rm -rf $RBENV_ROOT_PLUGINS/plugins/$1
  git clone git@github.com:rbenv/$1.git $RBENV_ROOT/plugins/$1
  echo 'INFO: Done installing rbenv ruby-build plugin.'
}

echo 'INIT: ruby base setup initiated.'

if [ ! -d "$RBENV_ROOT" ]; then
  install_rbenv
  check_or_install_ruby_build_dependencies
  install_rbenv_plugin ruby-build
else
  echo 'SKIP: rbenv is installed.'
fi

echo 'DONE: ruby base setup completed.'
echo '--------'

