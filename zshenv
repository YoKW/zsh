#-*- mode: shell-script; coding: utf-8; -*-
unlimit
limit stacksize 8192
limit coredumpsize 8192
limit -s

umask 022

export LANG=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8

# Setup command search path
typeset -U path

export RSYNC_RSH=ssh
export CVS_RSH=ssh

for conf in $HOME/.zsh.d/.conf.d/*.conf; do
    source ${conf};
done
