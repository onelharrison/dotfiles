#!/usr/bin/env sh

echo 'INIT: git setup initiated.'

export GIT_USER='onelharrison'
export GIT_HOME="$HOME/github.com/$GIT_USER"

check_or_install git

# Setup space for git repos
mkdir -p  $GIT_HOME

# Setup global gitconfig
mv $HOME/.gitconfig $HOME/.gitconfig.old 2>/dev/null
ln -s $SCRIPT_ABS_DIR/conf/git/gitconfig $HOME/.gitconfig

# Setup global gitignore
mv $HOME/.gitignore $HOME/.gitignore.old 2>/dev/null
ln -s $SCRIPT_ABS_DIR/conf/git/gitignore $HOME/.gitignore


# Add git autocompletion
mkdir -p $SCRIPT_ABS_DIR/conf/zsh/completions

curl -o $SCRIPT_ABS_DIR/conf/zsh/completions/_git https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh

cat <<TEXT >> $SCRIPT_ABS_DIR/conf/zsh/zshrc_extended
zstyle ':completion:*:*:git:*' script $DOTFILES_ROOT/conf/zsh/completions/_git
fpath=($DOTFILES_ROOT/conf/zsh/completions $fpath)

autoload -Uz compinit && compinit
TEXT

echo 'DONE: git setup completed.'
echo '--------'
