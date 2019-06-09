#!/bin/sh

# Install oh-my-zsh from github
if ! [ -d $HOME/.oh-my-zsh ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

K_ALIAS_HOME=$HOME/.kubectl_aliases
# Install kubectl-aliases
if ! [ -f $K_ALIAS_HOME ]; then
  curl https://raw.githubusercontent.com/ahmetb/kubectl-aliases/master/.kubectl_aliases -o $K_ALIAS_HOME
fi

ZSHRC="`dirname $0`/zshrc"

echo "Copying zshrc"
cp $ZSHRC $HOME/.zshrc

echo "Install complete"

