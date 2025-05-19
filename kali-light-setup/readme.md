# USB Kali Setup: Update + Speed Optimizations

This script automates the initial setup and performance optimizations for **Kali Linux running from a USB drive**. It includes system updates, fstab tweaks, ZRAM configuration, tool installations, and optional ZSH setup. A countdown timer is displayed before rebooting.

---

## 🚀 Features

1. **System Update**
   - Updates all packages with `apt update` and `full-upgrade`.

2. **Filesystem Optimization**
   - Adds `noatime` to `/etc/fstab` to reduce write operations and increase performance on USB drives.

3. **ZRAM Swap Configuration**
   - Installs `zram-tools` and enables compressed RAM swap to optimize memory usage.
   - Sets compression algorithm to `lz4` and uses 50% of RAM by default.

4. **Tool Installation**
   - Installs commonly used Kali Linux tools for web testing, passwords, and wireless attacks.
   - Also installs:
     - Developer tools (Node.js, Python, Docker)
     - Productivity tools (Neofetch, Htop, VS Code)

5. **Docker Setup**
   - Adds the current user to the `docker` group to allow running Docker without `sudo`.

6. **Optional: ZSH & Oh My Zsh**
   - Optionally installs ZSH shell and [Oh My Zsh](https://ohmyz.sh) for a better terminal experience.

7. **Countdown Reboot**
   - Displays a live countdown for 10 seconds before rebooting to apply all changes.

---

## 📦 Tools Installed

- `kali-linux-top10`, `kali-tools-web`, `kali-tools-passwords`, `kali-tools-wireless`
- `git`, `curl`, `wget`, `build-essential`
- `docker.io`, `docker-compose`
- `neofetch`, `htop`, `seclists`
- `nodejs`, `npm`
- `python3`, `python3-pip`, `python3-venv`
- `code` (Visual Studio Code)
- `nmap`, `net-tools`

---

## 🛠️ Usage

1. Make the script executable:

   ```bash
   chmod +x kali-light-setup.sh
