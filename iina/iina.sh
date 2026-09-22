#!/bin/bash

set -xe

killall IINA 2>/dev/null || true

IINA_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
INPUT_CONF_DIR="$HOME/Library/Application Support/com.colliderli.iina/input_conf"

mkdir -p "$INPUT_CONF_DIR"
ln -sf "$IINA_DIR/custom.conf" "$INPUT_CONF_DIR/custom.conf"

# Custom keybindings
defaults write com.colliderli.iina currentInputConfigName -string "custom"

# Use the mpv.conf in this iina directory
defaults write com.colliderli.iina enableAdvancedSettings -bool true
defaults write com.colliderli.iina useUserDefinedConfDir -bool true
defaults write com.colliderli.iina userDefinedConfDir -string "$IINA_DIR"

# On-screen display (the annotations that appear at the top left corner)
defaults write com.colliderli.iina osdTextSize -int 8
defaults write com.colliderli.iina osdAutoHideTimeout -float 0.3
defaults write com.colliderli.iina showSeekingIndicator -bool false

# On-screen controller at the bottom
defaults write com.colliderli.iina oscLeftRightButtonAction -int 1
defaults write com.colliderli.iina oscPosition -int 2
defaults write com.colliderli.iina controlBarAutoHideTimeout -int 1

# Audio settings
defaults write com.colliderli.iina maxVolume -int 200
