
## Bun ##
BUN_INSTALL="$HOME/.bun"
PATH="$BUN_INSTALL/bin:$PATH"

## Node Version Manager ##
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[[ -r $NVM_DIR/bash_completion ]] && \. $NVM_DIR/bash_completion
