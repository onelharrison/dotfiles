#!/usr/bin/env sh

# Get latest anaconda distribution here:
# https://www.anaconda.com/distribution/ 
#
# Get anaconda hash here:
# https://docs.anaconda.com/anaconda/install/hashes/lin-3-64/

ANACONDA=Anaconda3-2019.03-Linux-x86_64.sh
ANACONDA_SHA256_HASH=45c851b7497cc14d5ca060064394569f724b67d9b5f98a926ed49b834a6bb73a

TMP_DIR=/tmp

cd "$TMP_DIR"
curl -sSL -O "https://repo.anaconda.com/archive/$ANACONDA"

DOWNLOAD_SHA256_HASH=sha256sum "$TMP_DIR/$ANACONDA" | cut -d' ' -f1
if [ ! $DOWNLOADED_SHA256_HASH = $ANACONDA_SHA256_HASH ]; then
  echo "Anaconda not installed. Install script tampered"
  exit 1
fi

sh "$TMP_DIR/$ANACONDA" -u
cd -

# TODO: Copy conda config from bashrc to zshrc_extended
# TODO: Re-map python command to regular python

# Auto-installed packages
# - numpy
# - pandas
# - matplotlib
# - seaborn
# - scikit-learn

# TODO: Install bokeh

# TODO: Install deep learning packages
# conda install -c anaconda keras
# conda install -c anaconda tensorflow
# conda install -c anaconda jupyterlab
