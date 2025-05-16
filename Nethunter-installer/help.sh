#!/data/data/com.termux/files/usr/bin/bash

# Kali NetHunter Lite - Installer Script v1.4
# Author: TR4N5P4R3NT

clear
echo -e "\e[1;32m╔════════════════════════════════════════════╗"
echo -e "║  Installing Kali NetHunter Lite + Helper  ║"
echo -e "║           by TR4N5P4R3NT (v1.4)           ║"
echo -e "╚════════════════════════════════════════════╝\e[0m"
sleep 1

echo -e "\e[1;34m[+] Updating packages...\e[0m"
pkg update -y && pkg upgrade -y

echo -e "\e[1;34m[+] Installing proot-distro and wget...\e[0m"
pkg install proot-distro wget -y

# Install Kali if not already
if proot-distro list | grep -q kali; then
  echo -e "\e[1;33m[!] Kali already installed. Skipping...\e[0m"
else
  echo -e "\e[1;34m[+] Installing Kali NetHunter...\e[0m"
  proot-distro install kali
fi

# Create nh shortcut
echo -e "\e[1;34m[+] Creating shortcut command: nh\e[0m"
echo -e '#!/data/data/com.termux/files/usr/bin/bash\nproot-distro login kali' > $PREFIX/bin/nh
chmod +x $PREFIX/bin/nh

# Move helper.sh to /bin
echo -e "\e[1;34m[+] Installing GUI helper (nh-helper)...\e[0m"
cp helper.sh $PREFIX/bin/nh-helper
chmod +x $PREFIX/bin/nh-helper

# Copy guide to $HOME
cp kali_guide.txt $HOME/

echo -e "\e[1;32m[✓] Installation completed!"
echo -e "[✓] Run \e[1;33mnh\e[0m to launch Kali."
echo -e "[✓] Run \e[1;33mnh-helper\e[0m for menu.\e[0m"
