#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")"

if ! command -v brew >/dev/null 2>&1; then
  echo "[INFO] Installing Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if [ -f "./Brewfile" ]; then
  brew bundle --file="./Brewfile"
  echo "[SUCCESS] Finished"
else
  echo "[ERROR] Brewfile does not exist"
fi
