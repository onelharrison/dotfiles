#!/usr/bin/env sh

echo 'INIT: python setup initiated.'

check_or_install python3
check_or_install python3-pip

# virtual env and package management
pip3 install pipenv

# syntax linters and fixers
pip3 install flake8
pip3 install pydocstyle
pip3 install bandit
pip3 install mypy
pip3 install black
pip3 install isort

echo 'DONE: python base setup completed.'
echo '--------'
