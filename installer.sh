#! /bin/bash

# Repositories -----------------------------------------------------------------------------

## pacman
sudo pacman -Sqyu
sudo pacman -S base-devel
sudo pacman -S linux515-headers

## snapcraft
sudo pacman -S snapd
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap

# aur
sudo pacman -Sq yay pamac aurutils
yay -Sq paru

# General Solutions ------------------------------------------------------------------------

## daily assistances
sudo pacman -Sq screenfetch gparted net-tools copyq htop appimagelauncher latte-dock
yay -Sq translate-shell httpbin stacer powerline-fonts-git

## icon set
wget -qO- https://git.io/papirus-icon-theme-install | DESTDIR="$HOME/.local/share/icons" sh

## Office softwares
sudo pacman -Sq libreoffice-fresh

## multimedia
sudo pacman -Sq clementine vlc elisa simplescreenrecorder
yay -S jamesdsp

## graphic tools
sudo pacman -Sq krita gimp
yay -Sq lorien-bin rnote flameshot xournalpp inkscape

## GUI Tools
sudo pacman -Sq snapper alacarte screenfetch
yay -S make

## Enable TRIM for SSD
sudo systemctl enable fstrim.timer
sudo systemctl start fstrim.timer

# ClamAV antivirus
sudo pacman -Sq clamav clamtk

## Driver
yay -S optimus-manager

## File manager
yay -S peazip-gtk2-bin

## Download Manager
wget https://github.com/subhra74/xdm/releases/download/7.2.11/xdm-setup-7.2.11.tar.xz
tar -xvf xdm-setup-7.2.11.tar.xz
sudo sh install.sh

## Social networks --------------------------------------------------------------------------
sudo snap install rocketchat-desktop
sudo snap install instagraph
sudo snap install telegram-desktop
sudo snap install whatsapp-for-linux
sudo snap install spotify
sudo snap install skype
sudo snap install discord

## Konsole customization --------------------------------------------------------------------

## zsh
sudo pacman -Syu zsh

## Oh My ZSH and its plugins
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
chsh -s $(which zsh)
wget https://raw.githubusercontent.com/MrYazdan/zsh-linear-theme/main/linear.zsh-theme -O ~/.oh-my-zsh/themes/linear.zsh-theme && omz theme set linear


## Add custom text to head of konsole
yay -S figlet
yay -S lolcat
echo figlet '<Your prefared text>' | lolcat >> ~/.zshrc


## Programing utilities ---------------------------------------------------------------------

# python
sudo pacman -Sq python ipython python-pip

## python modules
sudo pip install -U pip
sudo pip install -U django flask sanic gunicorn pyfiglet shecan SQLAlchemy sqlparse selenium Scrapy redis python-telegram-bot pygame pyfiglet psycopg2-binary Pillow peewee pandas numpy matplotlib Flask-RESTful Flask-SQLAlchemy celery PyQt5 pymongo pyinstaller bs4 beautifulsoup4 click fastapi Khayyam TK

## IDE
sudo snap install code --classic
sudo snap install sublime-text --classic
sudo snap install pycharm-professional --classic
sudo snap install node --classic
sudo pacman -Sq micro notepadqq kate deepin-editor

## Version control
yay -S git
yay -S gitflow

# Databases --------------------------------------------------------------------------------

## postgresql
sudo pacman -S postgresql
sudo -iu postgres
initdb --locale $LANG -E UTF8 -D '/var/lib/postgres/data/'
exit
sudo systemctl start postgresql.service
sudo systemctl enable --now postgresql.service

## pgadmin
sudo mkdir /var/lib/pgadmin
sudo mkdir /var/log/pgadmin
sudo chown $USER /var/lib/pgadmin
sudo chown $USER /var/log/pgadmin
python3 -m venv pgadmin4
source pgadmin4/bin/activate
pip install pgadmin4
cd pgadmin4
pgadmin4

## mongodb
yay -Sq mongodb-bin mongodb-compass
sudo systemctl start mongodb.service
sudo systemctl enable mongodb.service
yay -S mongodb-tools

## redis
sudo pacman -Sq redis
sudo systemctl start redis
sudo systemctl enable redis

## sqlite
sudo pacman -Sq sqlite


# Network ---------------------------------------------------------------------------------

## Wireshark: install and enable capture packets
sudo pacman -S wireshark-qt
sudo chmod +x /usr/bin/dumpcap

yay -S xampp

## Nmap
sudo pacman -S nmap

## Uncomplicated FireWall: install, enable, add to startup
sudo pamac install ufw
sudo pamac install gufw
sudo ufw enable
sudo systemctl enable ufw


## Internet ---------------------------------------------------------------------------------

## Shecan dns :
sudo shecan update
sudo shecan list
sudo shecan set
sudo shecan verify

## VPN
sudo pacman -S openvpn dialog python-pip python-setuptools
sudo pip3 install protonvpn-cli

## Browsers
sudo pacman -Sq firefox links torbrowser-launcher
yay -Sq google-chrome
sudo snap install chromium

## Server tools
sudo pacman -Sq remmina
yay -Sq wrk

## Api client
sudo snap install insomnia
sudo snap install postman


## Virtualization --------------------------------------------------------------------------

## docker
sudo pacman -Sq docker docker-compose
sudo systemctl start docker
sudo systemctl enable docker
sudo pacman -Sq virtualbox linux515-virtualbox-host-modules
sudo vboxreload

## Game
sudo pacman -Sq steam

## IP Flag
git clone https://github.com/MrYazdan/ipflag.git
cd ipflag
mkdir -p /home/$(whoami)/.local/share/plasma/plasmoids/
mkdir -p /home/$(whoami)/.local/share/icons/
widget_dir="/home/$(whoami)/.local/share/plasma/plasmoids/"
icon_dir="/home/$(whoami)/.local/share/icons/"
mv -f ipflag.svg $icon_dir
mv -f com.github.mryazdan.ipflag/ /home/$(whoami)/.local/share/plasma/plasmoids/
echo "Completed install ipflag!"
