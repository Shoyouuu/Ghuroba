#!/bin/bash

set -e

REPO="https://github.com/Shoyouuu/Ghuroba.git"
FOLDER="Ghuroba"

echo "[*] Checking dependencies..."

if ! command -v git >/dev/null 2>&1; then
    echo "[*] Installing git..."
    pkg update -y && pkg install git -y || apt update && apt install git -y
fi

if [ -d "$FOLDER" ]; then
    rm -rf "$FOLDER"
fi

echo "[*] Cloning repository..."
git clone --depth=1 "$REPO"

cd "$FOLDER"

chmod +x ghurob

echo "[*] Cleaning installer..."
rm -f install.sh

echo "[✓] Install complete"
echo "[*] Running Ghuroba..."
./ghurob
