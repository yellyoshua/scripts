
## Bun ##
BUN_INSTALL="$HOME/.bun"

# Create a symlink to the bun executable
ln -s $BUN_INSTALL/bin/bun /usr/bin/bun

## Node Version Manager ##
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[[ -r $NVM_DIR/bash_completion ]] && \. $NVM_DIR/bash_completion
