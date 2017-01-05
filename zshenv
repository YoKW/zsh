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

for conf in $HOME/.zsh.d/conf.d/*.zsh; do
    source ${conf};
done

if [[ $(uname) == Darwin  ]]; then
    # OSX
    source ~/.zsh.d/platform/darwin.zsh
elif [[ $(uname) == Linux  ]]; then
    if [[ -f /.dockerenv ]]; then
        # docker
        source ~/.zsh.d/platform/docker.zsh
    else
        # ubuntu
        source ~/.zsh.d/platform/linux.zsh
    fi
fi
