#!/bin/bash -e

# Create a .gitconfig file
if [ -f "$HOME/.gitconfig" ]; then
	cat $HOME/.gitconfig > $HOME/.gitconfig.backup
fi

cat config/.gitconfig > $HOME/.gitconfig

# Create a .gitignore_global file
if [ -f "$HOME/.gitignore_global" ]; then
	cat $HOME/.gitignore_global > $HOME/.gitignore_global.backup
fi

cat config/.gitignore_global > $HOME/.gitignore_global

# Create a .vimrc file
if [ -f "$HOME/.vimrc" ]; then
	cat $HOME/.vimrc > $HOME/.vimrc.backup
fi

cat config/.vimrc > $HOME/.vimrc
