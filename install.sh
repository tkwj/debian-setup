#!/bin/bash

# Check if Script is Run as Root
if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script, please run sudo ./install.sh" 2>&1
  exit 1
fi

username=$(id -u -n 1000)
builddir=$(pwd)

mkdir -p /home/$username/.config
mkdir -p /home/$username/.fonts
mkdir -p /home/$username/Pictures
mkdir -p /home/$username/Pictures/backgrounds

apt update
apt upgrade -y

apt install nala software-properties-common -y

apt-add-repository contrib -y
apt-add-repository non-free -y

nala update

nala install \
git \
build-essential \
curl \
feh \
alacritty \
thunar \
gvfs-backends \
smbclient \
lxpolkit \
x11-xserver-utils \
unzip \
pulseaudio \
pavucontrol \
libx11-dev \
libxft-dev \
libxinerama-dev \
neofetch \
psmisc \
vim \
picom \
lightdm \
xserver-xorg-video-nvidia \
-y

wget https://dl.thorium.rocks/debian/dists/stable/thorium.list
mv thorium.list /etc/apt/sources.list.d/
nala update
nala install thorium-browser -y

mkdir -p suckless
cd suckless
git clone https://git.suckless.org/dmenu
cd dmenu
make clean install
cd ..
git clone https://github.com/tkwj/dwm
cd dwm
make clean install

cp dwm.desktop /usr/share/xsessions/

