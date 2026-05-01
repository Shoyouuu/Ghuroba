#!/bin/bash

APP="ghurob"

echo "[*] Installing..."

# install dependency
pkg update -y
pkg install git golang -y

# build binary
echo "[*] Building..."
go build -o $APP main.go

# permission
chmod +x $APP

echo "[✓] Install selesai!"

# run langsung
echo "[*] Running..."
./$APP

# hapus installer kalau sukses
if [ -f "$APP" ]; then
    rm -- "$0"
fi
