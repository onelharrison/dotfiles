#!/usr/bin/env sh

echo 'INIT: emacs setup initiated.'

check_or_install emacs

if [ -d ~/.emacs.d.old ]; then
  rm -r ~/.emacs.d.old
fi

# mv $HOME/.emacs $HOME/.emacs.old 2>/dev/null
# ln -s $SCRIPT_ABS_DIR/conf/emacs/emacs $HOME/.emacs

# install evil mode
if [ -e $HOME/.emacs.d.old ]; then
  rm -rf $HOME/.emacs.d.old
fi
mv $HOME/.emacs.d $HOME/.emacs.old 2>/dev/null
ln -s $SCRIPT_ABS_DIR/conf/emacs/emacs.d $HOME/.emacs.d 2>/dev/null

echo 'DONE: emacs setup completed.'
echo '--------'

