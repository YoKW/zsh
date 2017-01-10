# -------------------------------------
# zshのオプション
# -------------------------------------

alias ls='ls --color=auto'
alias runserver='python manage.py runserver'
alias test="python manage.py test"
alias wdiff='git diff --color-words'
alias rmpyc='find . -name "*.pyc" -exec rm -rf {} \;'
alias rmswp='find . -name "*.swp" -exec rm -rf {} \;'
alias rmun='find . -name "*.*~" -exec rm -rf {} \;'
alias findword="find ./ -type f -print | xargs grep '' | grep$1"

alias gitchangelog='git log --date=short --pretty=format:"%ad %an <%ae>%n%n%s%n%b "'

case $TERM in
  xterm*)
    precmd () {print -Pn "\e]0;%~\a"}
    ;;
esac

bindkey ";5C" forward-word
bindkey ";5D" backward-word

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
