#!/bin/bash

apt update -y && apt upgrade -y

echo "Installing packages base..."
./packages/macos/base.sh
echo "Installing packages base... [DONE]"

echo "Installing package nodejs..."
./packages/nodejs.sh
echo "Installing package nodejs... [DONE]"

echo "Installing package bunjs..."
./packages/bunjs.sh
echo "Installing package bunjs... [DONE]"