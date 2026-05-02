#!/bin/bash

set -e

INSTALL_DIR="$PREFIX/bin"

echo "[*] Remember my buddy..."
chmod +x ghurob

echo "[*] Do not be too nyawit..."
mkdir -p "$INSTALL_DIR"
cp ghurob "$INSTALL_DIR/ghurob"
chmod +x "$INSTALL_DIR/ghurob"

echo "[*] And termbg-mbg..."
cd ..
rm -rf Ghuroba

echo "[✓] Ty FOR BEING PATIENT🤗"
echo "[*] Run with:"
echo "[*] ghurob"
