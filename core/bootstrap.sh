#!/bin/bash
set -e

BASH_RC_GENERATED_FILE="$HOME/.bashrc_profile_generated"

# Restore the backup of the existing .bashrc file
cat $GLOBAL_BASH_RC_BACKUP > $GLOBAL_BASHRC_FILE

# check if $BASH_RC_GENERATED_FILE exists
if [ -f $BASH_RC_GENERATED_FILE ]; then
		rm $BASH_RC_GENERATED_FILE
fi

touch $BASH_RC_GENERATED_FILE

echo "\n# Aliases #" >> $BASH_RC_GENERATED_FILE
cat core/aliases.sh >> $BASH_RC_GENERATED_FILE
echo "\n# Aliases #\n\n" >> $BASH_RC_GENERATED_FILE

echo "\n# Functions #" >> $BASH_RC_GENERATED_FILE
cat core/functions.sh >> $BASH_RC_GENERATED_FILE
echo "\n# Functions #\n\n" >> $BASH_RC_GENERATED_FILE

echo "\n# Prompt #" >> $BASH_RC_GENERATED_FILE
cat core/prompt.sh >> $BASH_RC_GENERATED_FILE
echo "\n# Prompt #\n\n" >> $BASH_RC_GENERATED_FILE

echo "\n# Variables #" >> $BASH_RC_GENERATED_FILE
cat core/variables.sh >> $BASH_RC_GENERATED_FILE
echo "PATH=\"$GLOBAL_CUSTOM_BINS_DIR:$PATH\"" >> $BASH_RC_GENERATED_FILE
echo "\n# Variables #\n\n" >> $BASH_RC_GENERATED_FILE

# Apply bashrc_profile_generated file to .bashrc
if grep -q "source $BASH_RC_GENERATED_FILE" $GLOBAL_BASHRC_FILE; then
	echo "Already exists 'source $BASH_RC_GENERATED_FILE' in $GLOBAL_BASHRC_FILE"
else
	echo "source $BASH_RC_GENERATED_FILE" >> $GLOBAL_BASHRC_FILE
fi