#!/bin/sh

X11="`dirname $0`/xresources"
EXT="`dirname $0`/ext"

init () {
    # Clean
    rm -rf ~/.urxvt/ext
    mkdir -p $HOME/.urxvt/ext
}

init

echo "Copying xresources to ~/.Xresources"
cp $X11 $HOME/.Xresources
cp -r $EXT $HOME/.urxvt

echo "Install complete"

