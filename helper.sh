#!/data/data/com.termux/files/usr/bin/bash

clear
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "█▄█ █▀█ ▀█▀ █░█ █▄░█ ▀█▀ █▀█ █▀█ █░░ █▀▀"
echo "░█░ █▄█ ░█░ █▄█ █░▀█ ░█░ █▄█ █▄█ █▄▄ ██▄"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "   Kali NetHunter GUI Helper v1.4"
echo "   Developed by: TR4N5P4R3NT"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

while true; do
  echo ""
  echo "Choose an option:"
  echo "1. Start Kali NetHunter (CLI)"
  echo "2. Update Termux packages"
  echo "3. Reinstall Kali NetHunter"
  echo "4. About this tool"
  echo "0. Exit"
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  read -p "Enter your choice: " opt

  case $opt in
    1)
      echo "[+] Launching Kali NetHunter CLI..."
      nh
      ;;
    2)
      echo "[+] Updating Termux..."
      pkg update -y && pkg upgrade -y
      ;;
    3)
      echo "[!] Reinstalling Kali NetHunter..."
      echo "This will delete the current Kali instance."
      read -p "Are you sure? (y/n): " confirm
      if [[ $confirm == "y" ]]; then
        proot-distro remove kali
        proot-distro install kali
      else
        echo "Reinstall cancelled."
      fi
      ;;
    4)
      echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
      echo " Kali NetHunter Installer v1.4"
      echo " Developed by TR4N5P4R3NT"
      echo " GitHub: https://github.com/TR4N5P4R3NT-YNK/Nethunter-installer"
      echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
      ;;
    0)
      echo "Goodbye!"
      exit 0
      ;;
    *)
      echo "[!] Invalid option. Please try again."
      ;;
  esac
done
