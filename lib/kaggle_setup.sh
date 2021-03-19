#!/usr/bin/env sh

echo 'INIT: python setup initiated.'

python -m pip install kaggle

rm $HOME/.kaggle.old 2>/dev/null
mv $HOME/.kaggle $HOME/.kaggle.old 2>/dev/null
ln -s $SCRIPT_ABS_DIR/conf/kaggle $HOME/.kaggle

echo 'DONE: python base setup completed.'
echo '--------'
