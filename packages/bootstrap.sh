#!/bin/bash

apt update -y && apt upgrade -y

echo "Installing packages base..."
sh packages/base.sh
echo "Installing packages base... [DONE]"

echo "Installing package nodejs..."
sh packages/nodejs.sh
echo "Installing package nodejs... [DONE]"

echo "Installing package bunjs..."
sh packages/bunjs.sh
echo "Installing package bunjs... [DONE]"