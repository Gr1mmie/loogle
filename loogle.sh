#!/bin/bash

install_go0gle (){
echo "Reading package lists... Done"
echo "Building dependency tree"
echo "Reading state information... Done"
echo "google is already the newest version (7.80+dfsg1-2kali2)."
}

# checks if user is root
if [ "$EUID" -ne 0 ];then
  echo "Please run as root"
  exit
fi

# checks if google is installed
cd
touch ~/go0gle
tput setaf 2;echo "[*] checking if google is installed";tput sgr0;sleep 1

tput setaf 2;echo "[*] setting up services...";tput sgr0;sleep 1.5

googleopen (){
  firefox http://google.com &
}

tput setaf 2;echo "[*] Starting up loogle";tput sgr0
figlet loogle;sleep 2
googleopen
