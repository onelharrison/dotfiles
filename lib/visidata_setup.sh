#!/usr/bin/env sh

case $OSTYPE in
  darwin*)
    check_or_install 'saulpw/vd/visidata'
    ;;
  *)
    check_or_install visidata
    ;;
esac
