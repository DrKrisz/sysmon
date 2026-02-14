#!/bin/bash

echo "Installing sysmon..."

mkdir -p ~/.local/bin
cp sysmon ~/.local/bin/sysmon
chmod +x ~/.local/bin/sysmon

if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
    echo "Added ~/.local/bin to PATH. Restart terminal."
fi

echo "Installation complete. Run: sysmon"
