#!/bin/sh

ZSHRC="`dirname $0`/zshrc"

echo "Copying zshrc"
cp $ZSHRC $HOME/.zshrc

echo "Install complete"

