#!/usr/bin/env sh

RBENV_ROOT="$SCRIPT_ABS_DIR/conf/rbenv"

install_rbenv() {
  echo 'INFO: Installing rbenv.'
  git clone https://github.com/rbenv/rbenv.git $RBENV_ROOT

  $SCRIPT_ABS_DIR/conf/rbenv/src/configure
  make -C $RBENV_ROOT/src

  echo "# rbenv" >> $SCRIPT_ABS_DIR/conf/zsh/zshrc_extended

  echo "export RBENV_ROOT=\"$RBENV_ROOT\"" \
      >> $SCRIPT_ABS_DIR/conf/zsh/zshrc_extended

  echo "export PATH=\"$RBENV_ROOT/shims:\$PATH\"" \
      >> $SCRIPT_ABS_DIR/conf/zsh/zshrc_extended

  echo "export PATH=\"$RBENV_ROOT/bin:\$PATH\"" \
      >> $SCRIPT_ABS_DIR/conf/zsh/zshrc_extended

  $SCRIPT_ABS_DIR/conf/rbenv/bin/rbenv init

  echo 'eval "(rbenv init -)"' >> $SCRIPT_ABS_DIR/conf/zsh/zshrc_extended

  . $SCRIPT_ABS_DIR/conf/zsh/zshrc

  echo 'INFO: Done installing rbenv.'
}

check_or_install_ruby_build_dependencies() {
  echo 'INFO: Checking/installing ruby-build dependencies.'
  check_or_install autoconf
  check_or_install bison
  check_or_install build-essential
  check_or_install libssl-dev
  check_or_install libssl1.0-dev
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

RBENV_ROOT_PLUGINS=$RBENV_ROOT/plugins

install_rbenv_plugin() {
  echo "INFO: Installing rbenv $2 plugin."
  mkdir -p $RBENV_ROOT_PLUGINS
  rm -rf $RBENV_ROOT_PLUGINS/$2
  git clone https://github.com/$1/$2.git $RBENV_ROOT_PLUGINS/$2
  echo 'INFO: Done installing rbenv ruby-build plugin.'
}

if [ ! -d "$RBENV_ROOT" ]; then
  install_rbenv
  check_or_install_ruby_build_dependencies
  install_rbenv_plugin 'rbenv' 'ruby-build'

  rbenv install 2.7.1
  rbenv rehash

  rbenv global 2.7.1

  gem install bundler
  rbenv rehash

  # verify rbenv installation
  curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash
  curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | zsh
else
  echo 'SKIP: rbenv is installed.'
fi

install_rbenv_plugin 'rbenv' 'rbenv-vars'
