#!/bin/sh

# Initialize bashrc
ln .bashrc ../
source ../.bashrc
mkdir -p ../bin

# Set up vim+neobundle
ln .vimrc ../
mkdir -p ~/.vim/bundle
git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

# Set up Leiningen
mkdir -p ../.lein
ln profiles.clj ../.lein/
curl -o ../bin https://raw.github.com/technomancy/leiningen/stable/bin/lein
chmod +x ../bin/lein
