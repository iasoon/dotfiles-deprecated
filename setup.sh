#!/usr/bin/bash
function setmode(){
    REPO=$1
    DEST=$2
    if [[ -d $DEST ]]; then
        cd $DEST && git pull origin master && cd -
    else
        echo "cloning repo: $REPO into dir: $DEST"
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

setmode "https://github.com/TovenaarKlus/dotfiles.git" "$HOME/.dotfiles"
link vimrc "$HOME/.vimrc"

setmode "https://github.com/TovenaarKlus/prezto.git" "$HOME/.zprezto"
link runcoms/zprofile $HOME/.zprofile
link runcoms/zlogout $HOME/.zlogout
link runcoms/zlogin $HOME/.zlogin
link runcoms/zshenv $HOME/.zshenv
link runcoms/zshrc $HOME/.zshrc
link runcoms/zpreztorc $HOME/.zpreztorc


if [[ -d $HOME/.vim/bundle/neobundle.vim ]]; then
    echo "NeoBundle is installed"
else
    echo "Setting up Neobundle"
    curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
fi
