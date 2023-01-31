#!/bin/bash

# check if custom bins dir exists
if [ -d "$GLOBAL_CUSTOM_BINS_DIR" ]; then
		rm -r $GLOBAL_CUSTOM_BINS_DIR
fi

mkdir -p "$GLOBAL_CUSTOM_BINS_DIR"

cp bin/clean_ram.sh "$GLOBAL_CUSTOM_BINS_DIR/clean_ram"
chmod u+x "$GLOBAL_CUSTOM_BINS_DIR/clean_ram"
