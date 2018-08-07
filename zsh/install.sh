#!/bin/sh

# Install oh-my-zsh from github
if ! [ -d $HOME/.oh-my-zsh ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

ZSHRC="`dirname $0`/zshrc"

echo "Copying zshrc"
cp $ZSHRC $HOME/.zshrc

echo "Install complete"

