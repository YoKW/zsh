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
#export PATH="$HOME/.rbenv/versions/2.2.3/bin:$PATH"


# -------------------------------------
# phpbrewの設定
# -------------------------------------
[[ -e ~/.phpbrew/bashrc ]] && source ~/.phpbrew/bashrc

# CUDA
export CUDA_HOME=/usr/local/cuda
export DYLD_LIBRARY_PATH="$DYLD_LIBRARY_PATH:$CUDA_HOME/lib"
export PATH="$CUDA_HOME/bin:$PATH"


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
  while [ $# -ne 0 ]; do
    name=$(echo "$1" | sed -e s/\.tex$//g)
    platex -output-directory=$(dirname ${name:="report"}) ${name:="report"}
    if [ $? -eq 0 ]
    then
        platex -output-directory=$(dirname ${name:="report"}) ${name:="report"}
        pbibtex ${name:="report"}
        platex -output-directory=$(dirname ${name:="report"}) ${name:="report"}
        platex -output-directory=$(dirname ${name:="report"}) ${name:="report"}
        dvipdfmx -o ${name:="report"}.pdf ${name:="report"}
    fi
    shift
  done
}
function mkpdf_dist() {
  while [ $# -ne 0 ]; do
    name=$(echo "$1" | sed -e s/\.tex$//g)
    platex -output-directory=$(dirname ${name:="report"}) ${name:="report"}
    if [ $? -eq 0 ]
    then
        platex -output-directory=$(dirname ${name:="report"}) ${name:="report"}
        pbibtex ${name:="report"}
        platex -output-directory=$(dirname ${name:="report"}) ${name:="report"}
        platex -output-directory=$(dirname ${name:="report"}) ${name:="report"}
        dvipdfmx -o ${name:="report"}.tmp ${name:="report"}
        gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dNOPAUSE -dQUIET -dBATCH -sOutputFile=${name:="report"}$(date +"_okawara_%Y%m%d").pdf ${name:="report"}.tmp
        rm ${name:="report"}.tmp
    fi
    shift
  done
}
function compresse_pdf() {
  while [ $# -ne 0 ]; do
    name=$(echo "$1" | sed -e "s/\(_compressed\)*\.pdf$//g")
    gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dNOPAUSE -dQUIET -dBATCH -sOutputFile=${name:="report"}_compressed.pdf ${name:="report"}.pdf
    shift
  done
}

alias code='/Applications/Visual\ Studio\ Code.app/Contents/MacOS/Electron'
alias airport='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport'

function runkotlin() {
  name=$(echo "$1" | sed s/\.kt//g)
  kotlinc ${name}.kt -include-runtime -d tmp.jar
  java -jar tmp.jar ${@:2}
  rm -f tmp.jar
}
function runts() {
  name=$(echo "$1" | sed s/\.ts//g)
  tsc ${name}.ts --outFile tmp.js
  node tmp.js ${@:2}
  rm -f tmp.js
}
function runrust() {
  name=$(echo "$1" | sed s/\.rs//g)
  rustc ${name}.rs -o tmp
  ./tmp ${@:2}
  rm -f tmp
}

function open() {
  name=$(echo "$1")
  if [ -e ${name:='report.pdf'} ] ; then
    /usr/bin/open ${name:='report.pdf'}
  fi
}

# cdしたあとで、自動的に ls する
function chpwd() {
  ls -1
  git config --get remote.origin.url > /dev/null 2>&1 \
    && [[ ! "git@git.uci-sys.jp" == $(git config --get remote.origin.url | sed -e 's/\(.*\):.*/\1/g') ]] \
    && [[ ! $(git config --local user.name) == $(git config --get remote.origin.url | sed -e 's/.*com:\(.*\)\/.*\.git/\1/g') ]] \
    && git config --local user.name "$(git config --get remote.origin.url | sed -e 's/.*.com:\(.*\)\/.*\.git/\1/g')" \
    && git config --local user.email "$(git config --get remote.origin.url | sed -e 's/.*.com:\(.*\)\/.*\.git/\1/g')@gmail.com" \
    && echo "$fg[green]====================================================
$fg[yellow]Set Git Local Account to $(git config --get remote.origin.url | sed -e 's/.*.com:\(.*\)\/.*\.git/\1/g')$fg[green]

git config --local user.name $fg[red]$(git config --local user.name)$fg[green]
git config --local user.email $fg[red]$(git config --local user.email)$fg[green]
====================================================
"
  git config --get remote.origin.url > /dev/null 2>&1 \
    && [[ "git@git.uci-sys.jp" == $(git config --get remote.origin.url | sed -e 's/\(.*\):.*/\1/g') ]] \
    && [[ ! $(git config --local user.name) == "okawara" ]] \
    && git config --local user.name  "okawara" \
    && git config --local user.email "ookawara@osaka-univ.coop" \
    && echo "$fg[green]====================================================
$fg[yellow]Set Git Local Account to $(git config --get remote.origin.url | sed -e 's/.*.com:\(.*\)\/.*\.git/\1/g')$fg[green]

git config --local user.name $fg[red]$(git config --local user.name)$fg[green]
git config --local user.email $fg[red]$(git config --local user.email)$fg[green]
====================================================
"
}

# -------------------------------------
# その他設定
# -------------------------------------

# portの設定
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export MANPATH=/opt/local/share/man:/opt/local/man:$MANPATH


export PATH=/usr/local/var/nodebrew/node/v6.10.3/bin:$PATH
export NODEBREW_ROOT=/usr/local/var/nodebrew
export NODE_PATH=$NODE_PATH:/usr/local/lib/node_modules
export NODE_PATH=$NODE_PATH:/usr/local/var/nodebrew/node/v6.10.3/lib/node_modules

# goの設定
export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin
export GO15VENDOREXPERIMENT=1
export PATH=/usr/local/opt/go/libexec/bin:$PATH
# direnv
eval "$(direnv hook zsh)"

# cling
export CLING_PATH=$HOME/.cling
export PATH=$PATH:$CLING_PATH/bin

# Rust
export CARGO_PATH=$HOME/.cargo
export PATH=$PATH:$CARGO_PATH/bin

# Haskell
export HASKELL_PATH=$HOME/.local
export PATH=$PATH:$HASKELL_PATH/bin

# ANTLR
export CLASSPATH=/usr/local/lib/antlr-4.7-complete.jar:$CLASSPATH
alias antlr4='java -Xmx500M -cp "/usr/local/lib/antlr-4.7-complete.jar:$CLASSPATH" org.antlr.v4.Tool'
alias grun='java org.antlr.v4.gui.TestRig'

# Scheme
alias scheme="rlwrap -r -c -f $HOME/mit_scheme_bindings.txt scheme"

# Nim
export NIMBLE_PATH=$HOME/.nimble
export PATH=$PATH:$NIMBLE_PATH/bin

alias clock="watch -n 1 -t 'date +\"%Y/%m/%d %H:%M:%S\"'"

function mkmd() {
  touch $(date +'%m%d.md')
}

# Here, with vim, ignore .(aux|log|pdf) files
zstyle ':completion:*:*:vim:*' file-patterns '^*.(aux|log|pdf|bbl|dvi|blg):source-files' '*:all-files'
zstyle ':completion:*:*:open:*' file-patterns '^*.(aux|log|tex|bbl|dvi|blg):source-files' '*:all-files'
zstyle ':completion:*:*:mkpdf:*' file-patterns '^*.(aux|log|pdf|bbl|dvi|blg):source-files' '*:all-files'
