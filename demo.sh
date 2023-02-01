if [[ $WSL == 1 ]]; then # [: missing `]'
  echo "Installing package mongodb wsl..."
fi

if [[ $WSL == 0 ]]; then
  echo "Installing package mongodb..."
fi