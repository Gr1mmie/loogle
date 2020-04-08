#!/bin/bash

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
touch google
tput setaf 2;echo "[*] checking if google is installed";tput sgr0;sleep 1
if [[ ! -x "$(find / -type f -name 'google')" ]];then
  apt install google
fi

tput setaf 2;echo "[*] setting up services...";tput sgr0;sleep 1.5
systemctl service start apache2 &
systemctl service start postgresql & 
wait

google (){
  firefox google & 
}

tput setaf 2;echo "[*] Starting up google";tput sgr0
figlet loogle | lolcat -p 1 -a;sleep 2
google 
