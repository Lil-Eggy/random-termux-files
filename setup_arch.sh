#!/data/data/com.termux/files/usr/bin/bash

#install packages in termux
termux-change-repo
termux-setup-storage
pkg update
pkg install x11-repo
pkg install termux-x11-nightly
pkg install pulseaudio
pkg install proot-distro
pkg install nano
wget https://github.com/termux/termux-x11/releases/download/nightly/app-universal-debug.apk
termux-open app-universal-debug.apk

#install arch and creates a user called "lil_eggy"
proot-distro install archlinux
proot-distro login archlinux -- /bin/bash -c 'pacman -Sy && pacman -Syu && pacman -S nano && pacman -S sudo && pacman -S xfce4 && useradd -m -G wheel lil_eggy && passwd lil_eggy && nano /etc/sudoers && exit'

#download arch start script
wget https://raw.githubusercontent.com/Lil-Eggy/random-termux-files/refs/heads/main/arch.sh
chmod +x arch.sh
echo now you can start arch by running ./arch.sh
