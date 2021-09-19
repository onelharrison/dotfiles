#!/usr/bin/env sh

echo 'INIT: python setup initiated.'

PYENV_ROOT="$SCRIPT_ABS_DIR/conf/pyenv"

install_pyenv() {
  echo 'INFO: Installing pyenv.'
  git clone https://github.com/pyenv/pyenv.git $PYENV_ROOT

  echo "# pyenv" >> $SCRIPT_ABS_DIR/conf/zsh/zshrc_extended

  echo "export PYENV_ROOT=\"$PYENV_ROOT\"" \
      >> $SCRIPT_ABS_DIR/conf/zsh/zshrc_extended

  echo "export PATH=\"$PYENV_ROOT/bin:\$PATH\"" \
      >> $SCRIPT_ABS_DIR/conf/zsh/zshrc_extended

  echo 'if command -v pyenv 1>/dev/null 2>&1; then eval "$(pyenv init -)"; fi' \
      >> $SCRIPT_ABS_DIR/conf/zsh/zshrc_extended

  . $SCRIPT_ABS_DIR/conf/zsh/zshrc

  echo 'INFO: Done installing pyenv.'
}

check_or_install_python_system_dependencies() {
  check_or_install make
  check_or_install build-essential
  check_or_install libssl-dev
  check_or_install zlib1g-dev
  check_or_install libbz2-dev
  check_or_install libreadline-dev
  check_or_install libsqlite3-dev
  check_or_install wget
  check_or_install curl
  check_or_install llvm
  check_or_install libncurses5-dev
  check_or_install xz-utils
  check_or_install tk-dev
  check_or_install libxml2-dev
  check_or_install libxmlsec1-dev
  check_or_install libffi-dev
  check_or_install liblzma-dev
}

if [ ! -d "$PYENV_ROOT" ]; then
  check_or_install_python_system_dependencies

  install_pyenv

  pyenv install 3.9.0
  pyenv global 3.9.0
fi

# update the pip installation
python -m pip install -U pip

# virtual env and package management
python -m pip install pipenv

# syntax linters and fixers
python -m pip install flake8
python -m pip install pydocstyle
python -m pip install bandit
python -m pip install mypy
python -m pip install black
python -m pip install isort


echo 'DONE: python base setup completed.'
echo '--------'
