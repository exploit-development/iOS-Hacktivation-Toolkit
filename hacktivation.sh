#!/bin/bash

#This program is free software: you can redistribute it and/or modify
#it under the terms of the GNU General Public License as published by
#the Free Software Foundation, either version 3 of the License, or
#(at your option) any later version.

#This program is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#GNU General Public License for more details.

#You should have received a copy of the GNU General Public License
#along with this program.  If not, see <https://www.gnu.org/licenses/>.


#COLOURS
RED="\033[1;31m"
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
CYAN="\033[0;36m"
NC="\e[0m"


###########################
#ROOT PRIVILEGES
###########################

if [[ $EUID -ne 0 ]]; then
      echo -e "$RED You don't have root privileges, execute the script as root.$NC"
      exit 1
fi

clear


###########################
# Functions
###########################

# Continue or Exit
function continueOrExit() {
      echo ""
      read -p "Complete! Back To Menu? [ Y / n ] : "  CHECK
      if [[ "$CHECK" = "Y" || "$CHECK" = "y" || "$CHECK" = "Yes" || "$CHECK" = "yes" || "$CHECK" = "YES" ]]; then
            bash hacktivation.sh
      else
            echo -e "$RED Program Exit ...$NC"
            exit 1
      fi
}

###########################
#MENU
###########################

echo -e "$GREEN"

echo " **********************************************************************"
echo " ********************** iOS Hacktivation Toolkit **********************"
echo -e " **********************************************************************$NC"
echo -e " [+]$GREEN        This software is maintained by SRS appsec@tuta.io$NC       [+]"
echo -e " [+]$GREEN    Thanks to$NC :$GREEN @exploit3dguy + @appletech752 + @iRogerosx $NC     [+]"
echo -e " [+]$GREEN    @SoNick_14 + OC34N Team + Thelittlechicken + iGerman00 $NC     [+]"

ActivationState=$(ideviceinfo | grep ActivationState: | awk '{print $NF}')
DeviceName=$(ideviceinfo | grep DeviceName | awk '{print $NF}')
UniqueDeviceID=$(ideviceinfo | grep UniqueDeviceID | awk '{print $NF}')
SerialNumber=$(ideviceinfo | grep -w SerialNumber | awk '{print $NF}')
ProductType=$(ideviceinfo | grep ProductType | awk '{print $NF}')
ProductVersion=$(ideviceinfo | grep ProductVersion | awk '{print $NF}')

if test -z "$ActivationState" 
then
      echo ' ----------------------------------------------------------------------'
      echo -e "$RED			CANNOT CONNECT TO DEVICE$NC           "
      echo ' ----------------------------------------------------------------------'
else
      echo ' ----------------------------------------------------------------------'
      echo -e "$GREEN Serial Number : $SerialNumber $NC$GREEN Device : $ProductType $NC$GREEN Firmware : $ProductVersion $NC"
      echo ' ----------------------------------------------------------------------'
fi

echo -e "$YELLOW Select an option from the menu : $NC"
echo ' ----------------------------------------------------------------------'	
echo -e "$CYAN 1 : Complete Installation$NC"
echo -e "$CYAN 2 : Factory Reset (Restore iDevice)$NC"
echo -e "$CYAN 3 : Jailbreak (checkra1n)$NC"
echo -e "$CYAN 4 : PAID Untethered Bypass iOS 13.0 > [OC34N ACTIVATION SERVER]$NC"
echo -e "$CYAN 5 : FREE Tethered Bypass iOS 13.0 > [PATCHED MOBILEACTIVATIOND]$NC"
echo -e "$CYAN 6 : FREE Tethered Bypass iOS 12.4.7 > [PATCHED MOBILEACTIVATIOND]$NC"
echo -e "$CYAN 7 : SSH Shell$NC"
echo -e "$CYAN 0 : Exit$NC"
echo ' ----------------------------------------------------------------------'
read -p " Choose >  " ch

###########################
#INSTALL
###########################

if [ $ch = 1 ]; then

echo "deb https://assets.checkra.in/debian /" | sudo tee -a /etc/apt/sources.list
apt-key adv --fetch-keys https://assets.checkra.in/debian/archive.key
apt update
apt install -y python libtool-bin libcurl4-openssl-dev libplist-dev libzip-dev openssl libssl-dev  libcurl4-openssl-dev libimobiledevice-dev libusb-1.0-0-dev libreadline-dev build-essential git make autoconf automake libxml2-dev libtool pkg-config checkra1n sshpass checkinstall
git clone 'https://github.com/libimobiledevice/libirecovery'
git clone 'https://github.com/libimobiledevice/libideviceactivation.git'
git clone 'https://github.com/libimobiledevice/idevicerestore'
git clone 'https://github.com/libimobiledevice/usbmuxd'
git clone 'https://github.com/libimobiledevice/libimobiledevice'
git clone 'https://github.com/libimobiledevice/libusbmuxd'
git clone 'https://github.com/libimobiledevice/libplist'
git clone 'https://github.com/rcg4u/iphonessh.git'
cd ./libplist && ./autogen.sh --without-cython && sudo make install && cd ..
cd ./libusbmuxd && ./autogen.sh && sudo make install && cd ..
cd ./libimobiledevice && ./autogen.sh --without-cython && sudo make install && cd ..
cd ./usbmuxd && ./autogen.sh && sudo make install && cd ..
cd ./libirecovery && ./autogen.sh && sudo make install && cd ..
cd ./idevicerestore && ./autogen.sh && sudo make install && cd ..
cd ./libideviceactivation/ && ./autogen.sh && sudo make && sudo make install && cd ..
sudo ldconfig
continueOrExit

###########################
#RESTORE
###########################

elif [ $ch = 2 ]; then

idevicerestore -e -l
continueOrExit

###########################
#CHECKRA1N
###########################

elif [ $ch = 3 ]; then

checkra1n
continueOrExit

###########################
#OC34N PAID
###########################

elif [ $ch = 4 ]; then

bypass_scripts/oc34n_activation_server_13_x/./run.sh
continueOrExit

###########################
#IOS 13 > MOBILEACTIVATIOND
###########################

elif [ $ch = 5 ]; then

bypass_scripts/mobileactivationd_13_x/./run.sh
continueOrExit

###########################
#IOS 12.4.7 > MOBILEACTIVATIOND
###########################

elif [ $ch = 6 ]; then

bypass_scripts/mobileactivationd_12_4_7/./run.sh
continueOrExit

###########################
#SSH SHELL
###########################
elif [ $ch = 7 ]; then

echo ""
rm ~/.ssh/known_hosts >/dev/null 2>&1
pgrep -f 'tcprelay.py' | xargs kill >/dev/null 2>&1
python iphonessh/python-client/tcprelay.py -t 44:2222 >/dev/null 2>&1 &
sleep 2
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost -p 2222 mount -o rw,union,update /
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost -p 2222
pgrep -f 'tcprelay.py' | xargs kill >/dev/null 2>&1
continueOrExit

elif [ $ch == 0 ]; then
      echo -e "$RED Program Exit ...$NC"
      exit 1
else
      echo "Option not found. Exiting"
fi
