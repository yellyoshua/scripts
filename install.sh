#!/bin/bash
set -e

if [ "$EUID" -ne 0 ]; then
	echo "Please run as root"
	exit
fi

export GLOBAL_BASHRC_FILE="$HOME/.bashrc"
export GLOBAL_BASH_RC_BACKUP="$HOME/.bashrc.backup"
export GLOBAL_CUSTOM_BINS_DIR="$HOME/.bin"

# Create a backup of the existing .bashrc file
cat $GLOBAL_BASHRC_FILE > $GLOBAL_BASH_RC_BACKUP

echo "Adding custom binaries to PATH..."
sh bin/bootstrap.sh
echo "Adding custom binaries to PATH... [DONE]"

echo "Configure settings..."
sh config/bootstrap.sh
echo "Configure settings... [DONE]"

echo "Installing custom packages..."
sh packages/bootstrap.sh
echo "Installing custom packages... [DONE]"

echo "Creating custom aliases, variables and functions..."
sh core/bootstrap.sh
echo "Creating custom aliases, variables and functions... [DONE]"

echo ""
echo ""
echo "For applying changes, please run 'source $GLOBAL_BASHRC_FILE'"
echo ""
echo ""