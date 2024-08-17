#!/bin/bash

#
# Install script
#

# apt
config_apt() {
    sudo apt update -y
    sudo apt install -y build-essential git neovim tmux ruby

    echo 'Configured apt!'
}


# tmux, see: https://github.com/tmux-plugins/tpm/issues/6#issuecomment-54520698
config_tmux() {
    # start a server but don't attach to it
    tmux start-server
    # create a new session but don't attach to it either
    tmux new-session -d
    # install the plugins
    ~/.tmux/plugins/tpm/scripts/install_plugins.sh
    # killing the server is not required, I guess
    tmux kill-server

    echo 'Configured tmux!'
}

# systemd
config_systemd() {
    systemd_dir="$HOME/.config/systemd/user"
    mkdir -p $systemd_dir
    cp ./systemd/*.service $systemd_dir/

    echo 'Configured systemd!'
}

# ubuntu 24.04
config_ubuntu() {
    config_apt
    config_systemd
    config_tmux
    config_git

    echo 'Configured ubuntu!'
}

if [[ $@ == *"ubuntu"* ]]; then
    config_ubuntu
fi

if [[ $@ == *"gem"* ]]; then
    gem install --user-install coderay rouge highlight
fi

