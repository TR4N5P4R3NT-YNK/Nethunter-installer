#!/data/data/com.termux/files/usr/bin/bash

clear
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "█▄█ █▀█ ▀█▀ █░█ █▄░█ ▀█▀ █▀█ █▀█ █░░ █▀▀"
echo "░█░ █▄█ ░█░ █▄█ █░▀█ ░█░ █▄█ █▄█ █▄▄ ██▄"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "   Kali NetHunter Installer v1.4"
echo "   Developed by: TR4N5P4R3NT"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
sleep 2

echo "[+] Updating packages..."
pkg update -y && pkg upgrade -y

echo "[+] Installing required packages..."
pkg install git wget proot -y

echo "[+] Cloning Kali NetHunter installation script..."
git clone https://github.com/EXALAB/Anlinux-Resources.git
cd Anlinux-Resources/Scripts/Installer/Kali || { echo '[!] Failed to access Kali install script'; exit 1; }
bash kali.sh

cd ~/Nethunter-installer || exit

echo "[+] Creating CLI launcher: nh"
echo "proot-distro login kali" > /data/data/com.termux/files/usr/bin/nh
chmod +x /data/data/com.termux/files/usr/bin/nh

echo "[+] Installing GUI helper (nh-helper)..."
if [ -f helper.sh ]; then
    cp helper.sh /data/data/com.termux/files/usr/bin/nh-helper
    chmod +x /data/data/com.termux/files/usr/bin/nh-helper
    echo "[✔] nh-helper installed successfully."
else
    echo "[!] helper.sh not found, skipping GUI helper installation."
fi

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "[✔] Installation complete!"
echo "[✔] Type 'nh' to launch Kali CLI"
echo "[✔] Type 'nh-helper' for GUI-based helper"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
