#!/bin/bash
set -e

echo "\n# Aliases #" >> $GLOBAL_BASH_RC_GENERATED_FILE
cat core/aliases.sh >> $GLOBAL_BASH_RC_GENERATED_FILE
echo "\n# Aliases #\n\n" >> $GLOBAL_BASH_RC_GENERATED_FILE

echo "\n# Functions #" >> $GLOBAL_BASH_RC_GENERATED_FILE
cat core/functions.sh >> $GLOBAL_BASH_RC_GENERATED_FILE
echo "\n# Functions #\n\n" >> $GLOBAL_BASH_RC_GENERATED_FILE

# Add prompt to macos
# echo "\n# Prompt #" >> $GLOBAL_BASH_RC_GENERATED_FILE
# cat core/prompt.sh >> $GLOBAL_BASH_RC_GENERATED_FILE
# echo "\n# Prompt #\n\n" >> $GLOBAL_BASH_RC_GENERATED_FILE

echo "\n# Variables #" >> $GLOBAL_BASH_RC_GENERATED_FILE
cat core/variables.sh >> $GLOBAL_BASH_RC_GENERATED_FILE
echo "PATH=\"$GLOBAL_CUSTOM_BINS_DIR:$PATH\"" >> $GLOBAL_BASH_RC_GENERATED_FILE
echo "\n# Variables #\n\n" >> $GLOBAL_BASH_RC_GENERATED_FILE
