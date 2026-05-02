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

echo "[*] Cloning repository..."
rm -rf "$FOLDER"
git clone --depth=1 "$REPO"

cd "$FOLDER"

echo "[*] Setting permissions..."
chmod +x ghurob

echo "[*] Installing global command..."
mkdir -p "$INSTALL_DIR"
cp ghurob "$INSTALL_DIR/ghurob"
chmod +x "$INSTALL_DIR/ghurob"

echo "[*] Cleaning workspace..."
cd ..
rm -rf "$FOLDER"

echo "[*] Cleaning installer..."
SCRIPT_PATH="$(realpath "$0")"
rm -f "$SCRIPT_PATH"

echo "[✓] MAKASIH SUDAH BERSABAR🫣"
echo "[*] Run with:"
echo "    ghurob"
