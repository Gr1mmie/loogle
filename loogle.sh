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

# checks if dependencies are installed
if [[ ! -x "$(command -v lolcat)" ]];then
  cd
  sudo apt-get install ruby -y > install;rm install
  wget https://github.com/busyloop/lolcat/archive/master.zip;unzip master.zip
  cd lolcat-master/bin
  sudo gem install lolcat
fi

# checks if google is installed
cd
touch ~/go0gle
tput setaf 2;echo "[*] checking if google is installed";tput sgr0;sleep 1
if [[ ! -x "$(find / -type f -name 'go0gle')" ]];then
  install_go0gle
fi

tput setaf 2;echo "[*] setting up services...";tput sgr0;sleep 1.5
#@systemctl service apache2 start &
#@systemctl service postgresql start &
#@wait

googleopen (){
  firefox google &
}

tput setaf 2;echo "[*] Starting up loogle";tput sgr0
figlet loogle | lolcat -p 1 -a;sleep 2
googleopen
