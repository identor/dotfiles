#!/bin/sh

VIMRC="`dirname $0`/vimrc"
FILES_DIR=`dirname $0`
VIMHOME=$HOME/.vim
VIMHOME_WINDOWS=$HOME/vimfiles
VIMPLUG=$VIMHOME/autoload/plug.vim
VIMPLUG_URL=https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

init () {
    if ! hash tsserver; then
        echo 'typescript is please make sure that it is installed ([sudo] npm i -g typescript)'
    fi

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
    mkdir -p $VIMHOME/plugin
}

init

echo "Copying files dir"
cp -r $FILES_DIR/mclinica $VIMHOME/.
cp -r $FILES_DIR/snippets $VIMHOME/.
cp -r $FILES_DIR/ftplugin $VIMHOME/.
cp -r $FILES_DIR/syntax $VIMHOME/.
cp -r $FILES_DIR/plugin $VIMHOME/.

# Copy vimrc
echo "Copying .vimrc"
cp $VIMRC $HOME/.vimrc

ln -Ts $VIMHOME $VIMHOME_WINDOWS

# Install Bundles
if command -v vim; then
    vim +PlugInstall +qa
else
    nvim +PlugInstall +qa
    if [ ! -d $HOME/.config/coc/extensions/node_modules/coc-tsserver ]; then
        nvim +CocInstall coc-tsserver
    fi
fi

echo "Install complete"

