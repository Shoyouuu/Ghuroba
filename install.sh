#!/bin/bash

set -e

REPO="https://github.com/Shoyouuu/Ghuroba.git"
FOLDER="Ghuroba"
INSTALL_DIR="$PREFIX/bin"

echo "[*] Tes tes 1 2 1 2 1 2 3..."

if ! command -v git >/dev/null 2>&1; then
    echo "[*] Installing git..."
    pkg update -y && pkg install git -y
fi

echo "[*] Remember my buddy..."

rm -rf "$FOLDER"
git clone --depth=1 "$REPO"

# cek hasil clone
if [ ! -d "$FOLDER" ]; then
    echo "[✗] Clone failed!"
    exit 1
fi

cd "$FOLDER"

echo "[*] Do not be too nyawit..."
chmod +x ghurob

echo "[*] And termbg-mbg..."
mkdir -p "$INSTALL_DIR"
cp ghurob "$INSTALL_DIR/ghurob"
chmod +x "$INSTALL_DIR/ghurob"

echo "[✓] Ty FOR BEING PATIENT🤗"
echo "[*] Run with:"
echo "    ghurob"
