#!/bin/bash

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

for file in "$DOTFILES_DIR"/.*; do
  filename=$(basename "$file")
  dest="$HOME/$filename"

  case "$filename" in .|..|.git|.gitignore|.gitmodules|.DS_Store) continue ;; esac

  if [ -L "$dest" ] && [ "$(readlink "$dest")" = "$file" ]; then
    echo "[INFO] $dest is already symlinked to $file"
  elif [ -e "$dest" ] || [ -L "$dest" ]; then
    echo "[ERROR] $dest already exists (but is not symlinked to $file)"
  else
    if ln -s "$file" "$dest"; then
      echo "[SUCCESS] Symlinked $dest -> $file"
    else
      echo "[ERROR] Failed to create symlink for $dest"
    fi
  fi
done
