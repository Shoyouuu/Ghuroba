#!/bin/bash

set -e

INSTALL_DIR="$PREFIX/bin"

echo "[*] Setting permissions..."
chmod +x ghurob

echo "[*] Installing global command..."
mkdir -p "$INSTALL_DIR"
cp ghurob "$INSTALL_DIR/ghurob"
chmod +x "$INSTALL_DIR/ghurob"

echo "[*] Cleaning repo..."
cd ..
rm -rf Ghuroba

echo "[✓] MAKASIH SUDAH BERSABAR🫣"
echo "[*] Run with:"
echo "[*] ghurob"
