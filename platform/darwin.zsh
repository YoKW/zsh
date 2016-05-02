# -------------------------------------
# Macの設定
# -------------------------------------
# iTerm2のタブ名を変更する
function title {
    echo -ne "\033]0;"$*"\007"
}

# エディタ
export EDITOR=/usr/local/bin/vim

# ページャ
export PAGER=/usr/local/bin/vimpager
export MANPAGER=/usr/local/bin/vimpager

# -------------------------------------
# macvimの設定
# -------------------------------------
alias gvim="open -a MacVim.app"

# -------------------------------------
# pyenvの設定
# -------------------------------------
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# -------------------------------------
# rbenvの設定
# -------------------------------------
export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# -------------------------------------
# phpenvの設定
# -------------------------------------
export PATH="$HOME/.phpenv/bin:$PATH"
if which phpenv > /dev/null; then eval "$(phpenv init -)"; fi




# PostgreSQL設定（DBの置き場所）
export PGDATA=/usr/local/var/postgres

# -------------------------------------
# Mac用のエイリアス
# -------------------------------------
alias start-postgres="postgres -D /usr/local/var/postgres"
function findword() {
    grep -r $1 ./
}
function mkpdf() {
    platex $1
    dvipdfmx $1
}

# -------------------------------------
# その他設定
# -------------------------------------

# portの設定
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export MANPATH=/opt/local/share/man:/opt/local/man:$MANPATH


export PATH=$HOME/.nodebrew/current/bin:$PATH
export NODEBREW_ROOT=/usr/local/var/nodebrew

NODE_PATH=$PATH://usr/local/node-v0.10.0/lib/node_modules
export NODE_PATH

# goの設定
export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin
export GO15VENDOREXPERIMENT=1
