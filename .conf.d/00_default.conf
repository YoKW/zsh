# -------------------------------------
# 環境変数
# -------------------------------------

# SSHで接続した先で日本語が使えるようにする
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# エディタ
# export EDITOR=/usr/local/bin/vim

# ページャ
# export PAGER=/usr/local/bin/vimpager #
# export MANPAGER=/usr/local/bin/vimpager #
export PAGER=/usr/bin/less


# -------------------------------------
# zshのオプション
# -------------------------------------

## 補完機能の強化
# autoload -U compinit
# compinit

autoload -Uz compinit && compinit -u
zstyle ':completion:*' menu select interactive
setopt menu_complete


zmodload zsh/complist                                         # "bindkey -M menuselect"設定できるようにするためのモジュールロード
bindkey -v '^a' beginning-of-line                             # 行頭へ(menuselectでは補完候補の先頭へ)
bindkey -v '^b' backward-char                                 # 1文字左へ(menuselectでは補完候補1つ左へ)
bindkey -v '^e' end-of-line                                   # 行末へ(menuselectでは補完候補の最後尾へ)
bindkey -v '^f' forward-char                                  # 1文字右へ(menuselectでは補完候補1つ右へ)
bindkey -v '^h' backward-delete-char                          # 1文字削除(menuselectでは絞り込みの1文字削除)
bindkey -v '^i' expand-or-complete                            # 補完開始
bindkey -M menuselect '^g' .send-break                        # send-break2回分の効果
bindkey -M menuselect '^i' forward-char                       # 補完候補1つ右へ
bindkey -M menuselect '^j' .accept-line                       # accept-line2回分の効果
bindkey -M menuselect '^k' accept-and-infer-next-history      # 次の補完メニューを表示する
bindkey -M menuselect '^n' down-line-or-history               # 補完候補1つ下へ
bindkey -M menuselect '^p' up-line-or-history                 # 補完候補1つ上へ
bindkey -M menuselect '^r' history-incremental-search-forward # 補完候補内インクリメンタルサーチ





## 補完で大文字小文字の区別をしない
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' '+m:{A-Z}={a-z}' '+r:|[-_.]=**'

## 入力しているコマンド名が間違っている場合にもしかして：を出す。
# setopt correct

# ビープを鳴らさない
setopt nobeep

## 色を使う
setopt prompt_subst
zstyle ':completion:*' list-colors 'di=44' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

## ^Dでログアウトしない。
setopt ignoreeof

## バックグラウンドジョブが終了したらすぐに知らせる。
setopt no_tify

# 補完
## タブによるファイルの順番切り替えをしない
unsetopt auto_menu

# cd -[tab]で過去のディレクトリにひとっ飛びできるようにする
setopt auto_pushd

# ディレクトリ名を入力するだけでcdできるようにする
setopt auto_cd



# -------------------------------------
# エイリアス
# -------------------------------------

# -n 行数表示, -I バイナリファイル無視, svn関係のファイルを無視
alias grep="grep --color -n -I --exclude='*.svn-*' --exclude='entries' --exclude='*/cache/*'"

# ls
export LSCOLORS=xefxcxdxbxegedabagacad
alias ls="ls -G" # color for darwin
alias l="ls -la"
alias la="ls -a"
alias l1="ls -1"

# tree
alias tree="tree -NC" # N: 文字化け対策, C:色をつける


# -------------------------------------
# キーバインド
# -------------------------------------

bindkey -e

function cdup() {
   echo
   cd ..
   zle reset-prompt
}
zle -N cdup
bindkey '^K' cdup

# -------------------------------------
# その他
# -------------------------------------

# cdしたあとで、自動的に ls する
function chpwd() { ls -1 }



# -------------------------------------
# マイエイリアス
# -------------------------------------

alias freeze="pip freeze"
alias runserver="python manage.py runserver"

