#!/bin/bash
function getfiles(){
    REPO=$1
    DEST=$2
    if [[ -d $DEST ]]; then
        cd $DEST && git pull origin master && cd -
    else
        echo "Cloning repo: $REPO into dir: $DEST"
        git clone --recursive $REPO $DEST
    fi
}

function link(){
    SRC="$1"
    DST="$2"
    echo "Linking $SRC to $DST"
    mkdir -p $(dirname "$DST")
    ln -sfn "$DEST/$SRC" "$DST"
}

echo "Setting up Prezto"
getfiles "https://github.com/Iasoon/prezto.git" "$HOME/.zprezto"
link runcoms/zprofile $HOME/.zprofile
link runcoms/zlogout $HOME/.zlogout
link runcoms/zlogin $HOME/.zlogin
link runcoms/zshenv $HOME/.zshenv
link runcoms/zshrc $HOME/.zshrc
link runcoms/zpreztorc $HOME/.zpreztorc

echo "Setting up dotfiles"
getfiles "https://github.com/Iasoon/dotfiles.git" "$HOME/.dotfiles"
link vimrc "$HOME/.vimrc"
link muttrc "$HOME/.muttrc"
link tmux.conf "$HOME/.tmux.conf"

echo "Setting up Vundle"
if [[ -d $HOME/.vim/bundle/vundle ]]; then
    echo "Vundle already installed"
else
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

echo "Updating Bundles"
vim +BundleInstall! +qall
