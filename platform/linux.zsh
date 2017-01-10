# ページャ
export PAGER=/usr/bin/vimpager
export MANPAGER=/usr/bin/vimpager


# -------------------------------------
# zshのオプション
# -------------------------------------

export WORKON_HOME=$HOME/.virtualenvs
source `which virtualenvwrapper.sh`
export PIP_RESPECT_VIRTUALENV=true

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

alias ls='ls --color=auto'
alias runserver='python manage.py runserver'
alias wdiff='git diff --color-words'
alias rmpyc='find . -name "*.pyc" -exec rm -rf {} \;'
alias rmswp='find . -name "*.swp" -exec rm -rf {} \;'
alias rmun='find . -name "*.*~" -exec rm -rf {} \;'
alias findword="find ./ -type f -print | xargs grep '' | grep$1"

alias mkbranch='~/mkbranch.sh$1'
alias gitchangelog='git log --date=short --pretty=format:"%ad %an <%ae>%n%n%s%n%b "'
alias mntsharedfolder='~/mntsharedfolder.sh'
alias ww='workon'
alias gith="git checkout"
alias test="python manage.py test"
alias x="xmodmap ~/.Xmodmap"

mkb(){~/mkbranch.sh feat/#$1}
mkbf(){~/mkbranch.sh fix/#$1}
gitresetbranch(){
  git branch -r --merged develop | grep -v -e master -e develop | sed -e 's%[0-9]*: *%%' | xargs -I% git branch -d -r %
  git branch --merged develop | grep -vE '^\*|master$|develop$' | sed -e 's%[0-9]*: *%%' | xargs -I % git branch -d %
  git branch -a
}

case $TERM in
  xterm*)
    precmd () {print -Pn "\e]0;%~\a"}
    ;;
esac

bindkey ";5C" forward-word
bindkey ";5D" backward-word

alias pathaddupdir='export PYTHONPATH=../:$PYTHONPATH'
