#!/bin/sh

# Initialize bashrc
ln .bashrc $HOME
source $HOME/.bashrc
mkdir -p $HOME/bin

# Set up vim+neobundle
ln .vimrc $HOME
mkdir -p $HOME/.vim/bundle
git clone git://github.com/Shougo/neobundle.vim $HOME/.vim/bundle/neobundle.vim

# Set up Leiningen
mkdir -p $HOME/.lein
ln profiles.clj $HOME/.lein/
curl -o $HOME/bin https://raw.github.com/technomancy/leiningen/stable/bin/lein
chmod +x $HOME/bin/lein

# Set up gitconfig
ln .gitconfig $HOME
