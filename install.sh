#!/bin/bash
set -e

if [ "$EUID" -ne 0 ]; then
	echo "Please run as root"
	exit
fi

export GLOBAL_BASHRC_FILE="$HOME/.bashrc"
export GLOBAL_BASH_RC_BACKUP="$HOME/.bashrc.backup"
export GLOBAL_CUSTOM_BINS_DIR="$HOME/.bin"
export GLOBAL_BASH_RC_GENERATED_FILE="$HOME/.bashrc_profile_generated"

# Create a backup of the existing .bashrc file
cat $GLOBAL_BASHRC_FILE > $GLOBAL_BASH_RC_BACKUP

if grep -q "source $GLOBAL_BASH_RC_GENERATED_FILE" $GLOBAL_BASHRC_FILE; then
	# Remove the line from the .bashrc file "source $GLOBAL_BASH_RC_GENERATED_FILE"
  sed -i "/source $GLOBAL_BASH_RC_GENERATED_FILE/d" $GLOBAL_BASHRC_FILE
fi

# Create the .bashrc_profile_generated file
touch $GLOBAL_BASH_RC_GENERATED_FILE

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

# Restore the backup of the existing .bashrc file
cat $GLOBAL_BASH_RC_BACKUP > $GLOBAL_BASHRC_FILE

# Add the line "source $GLOBAL_BASH_RC_GENERATED_FILE" to the .bashrc file
echo "Applying changes..."
echo "source $GLOBAL_BASH_RC_GENERATED_FILE" >> $GLOBAL_BASHRC_FILE
echo "Applying changes... [DONE]"

echo ""
echo ""
echo "For applying changes, please run 'source $GLOBAL_BASHRC_FILE'"
echo ""
echo ""