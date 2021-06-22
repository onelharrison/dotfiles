#!/usr/bin/env sh

echo 'INIT: ag setup initiated.'

case $OSTYPE in
	darwin*)
		pkg_name="the_silver_searcher"
		;;
	*)
		pkg_name="silversearcher-ag"
		;;
esac

check_or_install $pkg_name

echo 'DONE: ag setup completed.'
echo '--------'
