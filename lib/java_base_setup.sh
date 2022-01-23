#!/usr/bin/env sh

check_or_install default-jre
check_or_install default-jdk

cat <<TEXT >> $SCRIPT_ABS_DIR/conf/zsh/zshrc_extended
export JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64/"
TEXT

. $SCRIPT_ABS_DIR/conf/zsh/zshrc
