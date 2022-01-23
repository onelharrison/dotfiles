#!/usr/bin/env sh

ANTLR_VERSION=4.9.2

ANTLR_ROOT="$SCRIPT_ABS_DIR/conf/antlr"
ANTLR_HOME="$ANTLR_ROOT/antlr-$ANTLR_VERSION"
ANTLR_JAR="$ANTLR_HOME/antlr-$ANTLR_VERSION-complete.jar"

mkdir -p "$ANTLR_HOME"

# Install prerequisite

check_or_install cmake
check_or_install uuid-dev
check_or_install pkg-config

# Install ANTLR4

curl "https://www.antlr.org/download/antlr-$ANTLR_VERSION-complete.jar" \
	-o "$ANTLR_HOME/antlr-$ANTLR_VERSION-complete.jar"

cat <<TEXT >> $SCRIPT_ABS_DIR/conf/zsh/zshrc_extended
# ANTLR 4
export ANTLR_ROOT="$ANTLR_ROOT"
export ANTLR_HOME="$ANTLR_HOME"
export ANTLR_JAR="$ANTLR_JAR"
export CLASSPATH=".:$ANTLR_JAR:$CLASSPATH"
alias antlr4="java -jar $ANTLR_JAR"
alias antlr4-cpp="java -jar $ANTLR_JAR -Dlanguage=Cpp"
alias grun="java org.antlr.v4.gui.TestRig"
TEXT

. $SCRIPT_ABS_DIR/conf/zsh/zshrc

# Install ANTLR4 C++ Runtime

CPP_RUNTIME_INSTALL_DIR="$SCRIPT_ABS_DIR/tmp/antlr4-cpp-runtime"
mkdir -p $CPP_RUNTIME_INSTALL_DIR

curl "https://www.antlr.org/download/antlr4-cpp-runtime-$ANTLR_VERSION-source.zip" \
	-o "$CPP_RUNTIME_INSTALL_DIR/antlr4-cpp-runtime-$ANTLR_VERSION-source.zip" \
	&& cd $CPP_RUNTIME_INSTALL_DIR \
	&& unzip "antlr4-cpp-runtime-$ANTLR_VERSION-source.zip" \
	&& mkdir -p build \
	&& mkdir -p run \
	&& cd build \
	&& cmake .. \
        && make \
	&& DESTDIR=../run make install \
	&& cd ../run/usr/local/include \
        && sudo cp -r antlr4-runtime /usr/local/include \
        && cd ../lib \
        && sudo cp * /usr/local/lib \
        && sudo ldconfig \
	&& cd $SCRIPT_ABS_DIR

rm -rf $CPP_RUNTIME_INSTALL_DIR 2>/dev/null
