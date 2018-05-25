#! /bin/bash

sed -i "/HISTSIZE/ s|=.*|=-1|g" $HOME/.bashrc
sed -i "/HISTFILESIZE/ s|=.*|=-1|g" $HOME/.bashrc
# Identical to
# sed -i "s|\(HISTSIZE=\).*|\1-1|g" $HOME/.bashrc
# sed -i "s|\(HISTFILESIZE=\).*|\1-1|g" $HOME/.bashrc


cp ../init-files/.bash_aliases $HOME/.bash_aliases
