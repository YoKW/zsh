# .zsh.d/.conf.d/内の*.confファイルを読み込む
for conf in $HOME/.zsh.d/.conf.d/*.conf; do
    source ${conf};
done
