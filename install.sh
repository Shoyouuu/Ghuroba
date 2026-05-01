#!/bin/bash

set -e

REPO="https://github.com/Shoyouuu/Ghuroba.git"
FOLDER="Ghuroba"
INSTALL_DIR="$PREFIX/bin"

echo "[*] Checking dependencies..."

if ! command -v git >/dev/null 2>&1; then
    echo "[*] Installing git..."
    pkg update -y && pkg install git -y || apt update && apt install git -y
fi

echo "[*] Removing old installation..."
rm -rf "$FOLDER"

echo "[*] Cloning repository..."
git clone --depth=1 "$REPO"

cd "$FOLDER"

echo "[*] Setting permissions..."
chmod +x ghurob

echo "[*] Installing global command..."

mkdir -p "$INSTALL_DIR"
cp ghurob "$INSTALL_DIR/ghurob"
chmod +x "$INSTALL_DIR/ghurob"

echo "[*] Cleaning installer..."
SCRIPT_PATH="$(realpath "$0")"
rm -f "$SCRIPT_PATH"

echo "[✓] Install complete"
echo "[*] Now you can run:"
echo "    ghurob"
