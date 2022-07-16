#!/bin/bash

set -e

NODE_VERSION="17.4.0"

# Install nodejs with nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

# NVM variables
NVM_DIR="$HOME/.nvm"
NVM_SH="$NVM_DIR/nvm.sh"

# Load nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Install nodejs with nvm
nvm install $NODE_VERSION
nvm use $NODE_VERSION
nvm alias default $NODE_VERSION