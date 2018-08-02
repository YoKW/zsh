# -------------------------------------
# プロンプト
# -------------------------------------

autoload -U promptinit; promptinit
autoload -Uz colors; colors
autoload -Uz vcs_info
autoload -Uz is-at-least

# begin VCS
zstyle ":vcs_info:*" enable git svn hg bzr
zstyle ":vcs_info:*" formats "(%s)-[%b]"
zstyle ":vcs_info:*" actionformats "(%s)-[%b|%a]"
zstyle ":vcs_info:(svn|bzr):*" branchformat "%b:r%r"
zstyle ":vcs_info:bzr:*" use-simple true

zstyle ":vcs_info:*" max-exports 6

if is-at-least 4.3.10; then
    zstyle ":vcs_info:git:*" check-for-changes true # commitしていないのをチェック
    zstyle ":vcs_info:git:*" stagedstr "<S>"
    zstyle ":vcs_info:git:*" unstagedstr "<U>"
    zstyle ":vcs_info:git:*" formats "(%b) %c%u"
    zstyle ":vcs_info:git:*" actionformats "(%s)-[%b|%a] %c%u"
fi

function vcs_prompt_info() {
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && echo -n " %{$fg[yellow]%}$vcs_info_msg_0_%f"
}
# end VCS

# begin virtualenv
export VIRTUAL_ENV_DISABLE_PROMPT=1
function virtualenv_prompt_info() {
    if [ -n "$VIRTUAL_ENV" ]; then
        if [ -f "$VIRTUAL_ENV/__name__" ]; then
            local name=`cat $VIRTUAL_ENV/__name__`
        elif [ `basename $VIRTUAL_ENV` = "__" ]; then
            local name=$(basename $(dirname $VIRTUAL_ENV))
        else
            local name=$(basename $VIRTUAL_ENV)
        fi
        echo "($name) "
    fi
}
# end virtualenv

# begin rbenv
FOUND_RBENV=0
rbenvdirs=("$HOME/.rbenv" "/usr/local/rbenv" "/opt/rbenv" "/usr/local/opt/rbenv")
if rbenv_homebrew_path=$(brew --prefix rbenv 2>/dev/null); then
    rbenvdirs=($rbenv_homebrew_path "${rbenvdirs[@]}")
    unset rbenv_homebrew_path
    if [[ $RBENV_ROOT = '' ]]; then
      RBENV_ROOT="$HOME/.rbenv"
    fi
fi

for rbenvdir in "${rbenvdirs[@]}" ; do
  if [ -d $rbenvdir/bin -a $FOUND_RBENV -eq 0 ] ; then
    FOUND_RBENV=1
    if [[ $RBENV_ROOT = '' ]]; then
      RBENV_ROOT=$rbenvdir
    fi
    export RBENV_ROOT
    export PATH=${rbenvdir}/bin:$PATH
    eval "$(rbenv init --no-rehash - zsh)"

    alias rubies="rbenv versions"
    alias gemsets="rbenv gemset list"

    function current_ruby() {
      echo "$(rbenv version-name)"
    }

    function current_gemset() {
      echo "$(rbenv gemset active 2&>/dev/null | sed -e 's/ global//g')"
    }

    function gems {
      local rbenv_path=$(rbenv prefix)
      gem list $@ | sed -E \
        -e "s/\([0-9a-z, \.]+( .+)?\)/$fg[blue]&$reset_color/g" \
        -e "s|$(echo $rbenv_path)|$fg[magenta]\$rbenv_path$reset_color|g" \
        -e "s/$current_ruby@global/$fg[yellow]&$reset_color/g" \
        -e "s/$current_ruby$current_gemset$/$fg[green]&$reset_color/g"
    }

    function rbenv_prompt_info() {
      if [[ -n $(current_gemset) ]] ; then
        echo "<$(current_ruby)@$(current_gemset)> "
      else
        echo "<$(current_ruby)> "
      fi
    }
  fi
done
unset rbenvdir

if [ $FOUND_RBENV -eq 0 ] ; then
  alias rubies='ruby -v'
  function gemsets() { echo '' }
  function rbenv_prompt_info() { echo "<$(ruby -v | cut -f-2 -d ' ')> " }
fi
# end rbenv

# begin docker
function docker_prompt_info() {
    if [[ -f /.dockerenv ]]; then
        echo "%F{magenta}DOCKER%f "
    fi
}
# end docker

# OK="SUCCESS "
# NG="FAILURE "
OK="[%*]"
NG="[%*]"

PROMPT=""
PROMPT+="\$(docker_prompt_info)"
PROMPT+="%(?.%F{green}$OK%f.%F{red}$NG%f) "
PROMPT+="\$(virtualenv_prompt_info)"
PROMPT+="\$(rbenv_prompt_info)"
# PROMPT+="%F{blue}%~%f"
PROMPT+="%K{blue}%~%k"
PROMPT+="\$(vcs_prompt_info)"
PROMPT+="
"
PROMPT+="$ "
# RPROMPT="[%*]"


