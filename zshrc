# .zsh.d/conf.d/内の*.zshファイルを読み込む
for conf in $HOME/.zsh.d/conf.d/*.zsh; do
    source ${conf};
done


if [[ $(uname) == Darwin  ]]; then
    # OSX
    source ~/.zsh.d/platform/darwin.zsh
elif [[ $(uname) == Linux  ]]; then
    # ubuntu
    source ~/.zsh.d/platform/linux.zsh
fi
