#!/usr/bin/env sh

pkg_name='the_silver_searcher'

if is_installed 'lsb_release'; then
	if [ $(lsb_release -a | grep 'Ubuntu') ]; then
		pkg_name='silversearcher-ag'
	fi
fi

check_or_install $pkg_name
