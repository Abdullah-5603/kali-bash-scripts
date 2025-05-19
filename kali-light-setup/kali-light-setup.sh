#!/bin/bash

echo "====== USB Kali Setup: Update + Speed Optimizations ======"

# 1. Full System Update
sudo apt update && sudo apt full-upgrade -y

# 2. Enable noatime to reduce USB wear and improve speed
echo ">>> Optimizing fstab with noatime..."
FSTAB_FILE="/etc/fstab"
if grep -q "defaults" $FSTAB_FILE && ! grep -q "noatime" $FSTAB_FILE; then
  sudo cp $FSTAB_FILE ${FSTAB_FILE}.bak
  sudo sed -i 's/defaults/defaults,noatime/g' $FSTAB_FILE
  echo "fstab optimized."
else
  echo "fstab already includes noatime."
fi

# 3. Install ZRAM for compressed RAM swap
echo ">>> Installing zram-tools..."
sudo apt install -y zram-tools

# 4. Configure ZRAM size (optional)
ZRAM_CONF="/etc/default/zramswap"
if [ -f "$ZRAM_CONF" ]; then
  sudo sed -i 's/#ALGO=lz4/ALGO=lz4/' $ZRAM_CONF
  sudo sed -i 's/#PERCENTAGE=50/PERCENTAGE=50/' $ZRAM_CONF
  echo ">>> Restarting ZRAM service..."
  sudo systemctl restart zramswap
fi

# 5. Install Web + Pentesting + Dev tools
echo ">>> Installing Kali Top Tools + Dev stack..."
sudo apt install -y \
  kali-linux-top10 \
  kali-tools-web \
  kali-tools-passwords \
  kali-tools-wireless \
  git curl wget build-essential \
  docker.io docker-compose \
  neofetch htop seclists \
  nodejs npm \
  python3 python3-pip python3-venv \
  code nmap net-tools

# 6. Enable Docker without sudo
sudo groupadd docker
sudo usermod -aG docker $USER

# 7. Optional: ZSH + Oh My Zsh
read -p "Do you want to install ZSH + Oh My Zsh? (y/n): " install_zsh
if [[ "$install_zsh" == "y" ]]; then
  sudo apt install -y zsh
  chsh -s $(which zsh)
  echo "Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

echo "===== All Done! ====="

# 8. Reboot system to apply all changes
echo "System will reboot in 10 seconds..."

for i in {10..1}; do
  echo -ne "Rebooting in $i seconds...\r"
  sleep 1
done

echo -e "\nRebooting now!"
sudo reboot