#!/usr/bin/env sh

echo 'INIT: haskell base setup initiated.'

# Install stack
# =============
curl -sSL https://get.haskellstack.org/ | sh

# Install haskell code formatters
# ===============================
stack install stylish-haskell

# NOTE: resolver needed due to newer ghci incompatibility issues
# (https://github.com/chrisdone/hindent/issues/563)
stack --resolver lts-14.22 install hindent

# Install haskell linters
# =======================
stack install hlint

# TODO: Migrate to haskell language server when project is more mature
# (https://github.com/haskell/haskell-language-server)
sudo apt install libicu-dev libtinfo-dev libgmp-dev # hie dependencies

git clone https://github.com/haskell/haskell-ide-engine --recurse-submodules
cd haskell-ide-engine
stack ./install.hs hie  # latest haskell-ide-engine and hoogle docs
cd - && rm -rf haskell-ide-engine

echo 'DONE: haskell base setup completed.'
echo '--------'
