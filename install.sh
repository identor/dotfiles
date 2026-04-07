#!/bin/bash

#
# Install script
#

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# apt — shared between ubuntu and debian
config_apt() {
    sudo apt-get update -y
    sudo apt-get install -y \
        build-essential git curl zsh neovim tmux ruby \
        unzip fontconfig xclip

    echo 'Configured apt!'
}

# tmux, see: https://github.com/tmux-plugins/tpm/issues/6#issuecomment-54520698
config_tmux() {
    ln -sf $DOTFILES_DIR/tmux/tmux.conf ~/.tmux.conf
    if [ ! -d ~/.tmux/plugins/tpm ]; then
        git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    fi

    # start a server but don't attach to it
    tmux start-server
    # create a new session but don't attach to it either
    tmux new-session -d
    # install the plugins
    ~/.tmux/plugins/tpm/scripts/install_plugins.sh
    tmux kill-server

    echo 'Configured tmux!'
}

# systemd
config_systemd() {
    systemd_dir="$HOME/.config/systemd/user"
    mkdir -p $systemd_dir
    cp $DOTFILES_DIR/systemd/*.service $systemd_dir/

    echo 'Configured systemd!'
}

# zsh + oh-my-zsh
config_zsh() {
    sh $DOTFILES_DIR/zsh/install.sh
    echo 'Configured zsh!'
}

# vim/neovim
config_vim() {
    sh $DOTFILES_DIR/vim/install.sh
    echo 'Configured vim!'
}

# ubuntu 24.04
config_ubuntu() {
    config_apt
    config_systemd
    config_tmux
    config_zsh
    config_vim

    echo 'Configured ubuntu!'
}

# debian 13 (trixie) — same base as ubuntu, no universe repo needed
config_debian() {
    config_apt
    config_systemd
    config_tmux
    config_zsh
    config_vim

    # Set zsh as default shell
    if [ "$SHELL" != "$(which zsh)" ]; then
        chsh -s $(which zsh)
        echo 'Default shell set to zsh — re-login to apply'
    fi

    echo 'Configured debian!'
}

if [[ $@ == *"ubuntu"* ]]; then
    config_ubuntu
fi

if [[ $@ == *"debian"* ]]; then
    config_debian
fi

if [[ $@ == *"gem"* ]]; then
    gem install --user-install coderay rouge highlight
fi

