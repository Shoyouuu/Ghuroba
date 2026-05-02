#!/bin/bash

set -e

REPO="https://github.com/Shoyouuu/Ghuroba.git"
FOLDER="Ghuroba"
INSTALL_DIR="$PREFIX/bin"

echo "[*] Checking Tes tes..."

command -v git >/dev/null 2>&1 || pkg update -y && pkg install git -y

echo "[*] 1 2 1 2 Tes 1 2 3..."

# update kalau sudah ada, clone kalau belum ada
if [ -d "$FOLDER/.git" ]; then
    echo "Remember dude"
    cd "$FOLDER" && git pull
else
    git clone --depth=1 "$REPO"
    cd "$FOLDER"
fi

echo "[*] Do not be too nyawit..."
chmod +x ghurob

echo "[*] And termbg-mbg..."
mkdir -p "$INSTALL_DIR"
cp ghurob "$INSTALL_DIR/ghurob"
chmod +x "$INSTALL_DIR/ghurob"

echo "[✓] Ty FOR BEING PATIENT🤗"
echo "[*] Run with:"
echo "    ghurob"
