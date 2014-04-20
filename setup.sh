#!/usr/bin/bash
REPO=https://github.com/TovenaarKlus/dotfiles.git
DEST="$HOME/.dotfiles"

if [[ -d $DEST ]]; then
    cd $DEST && git pull origin master && cd -
else
    echo "cloning repo: $REPO into dir: $DEST"
    git clone $REPO $DEST
fi

function link(){
    SRC="$1"
    DST="$2"
    echo "Linking $SRC"
    mkdir -p $(dirname "$DST")
    ln -sfn "$DEST/$SRC" "$DST"
}

link vimrc "$HOME/.vimrc"

if [[ -d $HOME/.vim/bundle/neobundle.vim ]]; then
    echo "NeoBundle is installed"
else
    echo "Setting up Neobundle"
    curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
fi
