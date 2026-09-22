#!/bin/bash

SOURCE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VSCODE_USER_DIR="$HOME/Library/Application Support/Code/User"
FILES=("settings.json" "keybindings.json")

mkdir -p "$VSCODE_USER_DIR"

for file in "${FILES[@]}"; do
  src="$SOURCE_DIR/$file"
  dest="$VSCODE_USER_DIR/$file"

  if [ ! -f "$src" ]; then
    echo "[ERROR] $src does not exist"
    continue
  fi

  if [ -L "$dest" ] && [ "$(readlink "$dest")" = "$src" ]; then
    echo "[INFO] $dest is already symlinked to $src"
  elif [ -e "$dest" ] || [ -L "$dest" ]; then
    echo "[ERROR] $dest already exists (but is not symlinked to $src)"
  else
    if ln -s "$src" "$dest"; then
      echo "[SUCCESS] Symlinked $dest -> $src"
    else
      echo "[ERROR] Failed to create symlink for $dest"
    fi
  fi
done

# Enable key repeating
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
