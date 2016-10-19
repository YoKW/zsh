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
# phpbrewの設定
# -------------------------------------
[[ -e ~/.phpbrew/bashrc ]] && source ~/.phpbrew/bashrc




# PostgreSQL設定（DBの置き場所）
export PGDATA=/usr/local/var/postgres

# -------------------------------------
# Mac用のエイリアス
# -------------------------------------
alias start-postgres="postgres -D /usr/local/var/postgres"
alias g++="g++ -std=c++11"
function findword() {
    grep -r $1 ./
}
function mkpdf() {
    platex $1
    dvipdfmx $1
}

function kotlinrun() {
  name=$(echo "$1" | sed s/\.kt//g)
  kotlinc ${name}.kt -include-runtime -d tmp.jar
  java -jar tmp.jar ${@:2}
  rm -f tmp.jar
}

# -------------------------------------
# その他設定
# -------------------------------------

# portの設定
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export MANPATH=/opt/local/share/man:/opt/local/man:$MANPATH


export PATH=/usr/local/var/nodebrew/node/v6.6.0/bin:$PATH
export NODEBREW_ROOT=/usr/local/var/nodebrew
export NODE_PATH=$NODE_PATH:/usr/local/lib/node_modules
export NODE_PATH=$NODE_PATH:/usr/local/var/nodebrew/node/v6.6.0/lib/node_modules

# goの設定
export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin
export GO15VENDOREXPERIMENT=1
