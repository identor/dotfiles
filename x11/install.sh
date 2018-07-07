#!/bin/sh

X11="`dirname $0`/xresources"

echo "Copying xresources to ~/.Xresources"
cp $X11 $HOME/.Xresources

echo "Install complete"

