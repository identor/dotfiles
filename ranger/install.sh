#!/bin/sh

DIR="`dirname $0`"
CONFIG=$DIR/config/*
DEST=$HOME/.config/ranger

echo "$CONFIG"

init () {
    ranger --copy-config=scope
    mkdir -p $DEST
}

echo "Copying to $DEST"
cp $CONFIG $DEST

echo "Install complete"

