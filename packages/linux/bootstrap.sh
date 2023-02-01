#!/bin/bash

apt update -y && apt upgrade -y

echo "Installing packages base..."
./packages/linux/base.sh
echo "Installing packages base... [DONE]"

echo "Installing package nodejs..."
./packages/nodejs.sh
echo "Installing package nodejs... [DONE]"

echo "Installing package bunjs..."
./packages/bunjs.sh
echo "Installing package bunjs... [DONE]"

echo "Installing package wkhtmltopdf v0.12.3..."
./packages/linux/wkhtmltopdf_v0.12.3.sh
echo "Installing package wkhtmltopdf v0.12.3... [DONE]"

# If WSL environment is detected, install the following packages
if [[ " $WSL " == " 1 "]]; then
  echo "Installing package mongodb wsl..."
  ./packages/linux/mongodb_wsl.sh
  echo "Installing package mongodb wsl... [DONE]"
fi

# If WSL environment is not detected, install the following packages
if [[ " $WSL " == " 0 "]]; then
  echo "Installing package mongodb..."
  ./packages/linux/mongodb.sh
  echo "Installing package mongodb... [DONE]"
fi
