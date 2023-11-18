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

