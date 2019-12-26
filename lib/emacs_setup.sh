#!/usr/bin/env sh

echo 'INIT: emacs setup initiated.'

check_or_install emacs

if [ -e $HOME/.emacs.d.old ]; then
  rm -rf $HOME/.emacs.d.old
fi

if [ -e $HOME/.emacs.d ]; then
  cp $HOME/.emacs.d $HOME/.emacs.d.old 2>/dev/null
  rm -rf $HOME/.emacs.d
fi
ln -s $SCRIPT_ABS_DIR/conf/emacs/emacs.d $HOME/.emacs.d 2>/dev/null

echo 'DONE: emacs setup completed.'
echo '--------'

