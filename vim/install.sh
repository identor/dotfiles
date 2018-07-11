#!/bin/sh

VIMRC="`dirname $0`/vimrc"
FILES_DIR=`dirname $0`
VIMHOME=$HOME/.vim
VIMHOME_WINDOWS=$HOME/vimfiles
VIMPLUG=$VIMHOME/autoload/plug.vim
VIMPLUG_URL=https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

init () {
    if [ -d $VIMHOME_WINDOWS ]; then
        rm -Rf $VIMHOME_WINDOWS
    fi

    # VIMPLUG
    if [ ! -f $VIMPLUG ]; then
        curl -fLo $VIMPLUG --create-dirs $VIMPLUG_URL
    fi

    # create vim dirs
    echo "Creating default directories"
    mkdir -p $HOME/.vimswap

    mkdir -p $VIMHOME/sessions
    mkdir -p $VIMHOME/bundle
    mkdir -p $VIMHOME/ftplugin
    mkdir -p $VIMHOME/syntax
}

init

echo "Copying files dir"
cp -r $FILES_DIR/mclinica $VIMHOME/.
cp -r $FILES_DIR/snippets $VIMHOME/.
cp -r $FILES_DIR/ftplugin $VIMHOME/.
cp -r $FILES_DIR/syntax $VIMHOME/.

# Copy vimrc
echo "Copying .vimrc"
cp $VIMRC $HOME/.vimrc

ln -Ts $VIMHOME $VIMHOME_WINDOWS

# Install Bundles
vim +PlugInstall +qa

echo "Install complete"

