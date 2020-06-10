#!/bin/bash

#COLOURS
RED="\033[1;31m"
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
CYAN="\033[0;36m"
NC="\e[0m"

#ROOT PRIVILEGES
if [[ $EUID -ne 0 ]]; then
        echo -e "$RED You don't have root privileges, execute the script as root.$NC"
        exit 1
fi

clear

#menu
echo -e "$GREEN"

echo " **************************************************"
echo " ************ iOS Hacktivation Toolkit ************"
echo -e " **************************************************$NC"
echo -e " [+]              $RED Coded by SRdev$NC               [+]"
echo -e " [+] 		  $RED appsec@tuta.io$NC 	        [+]"
echo -e " [+]$RED 	    Thanks to$NC :$GREEN {@exploit3dguy}$NC  	[+]"
echo ""
echo -e "$YELLOW Select From Menu : $NC"
echo ""
echo -e "$CYAN 1 : Installation$NC"
echo -e "$CYAN 2 : Full Restore Firmware$NC"
echo -e "$CYAN 3 : Jailbreak$NC"
echo -e "$CYAN 4 : Activation Bypass$NC"
echo -e "$CYAN 5 : Passcode Bypass$NC"
echo -e "$CYAN 0 : Exit$NC"
echo -e ""
read -p " Choose >  " ch

if [ $ch = 1 ]; then

echo "deb https://assets.checkra.in/debian /" | sudo tee -a /etc/apt/sources.list
apt-key adv --fetch-keys https://assets.checkra.in/debian/archive.key
apt update
apt install -y libcurl4-openssl-dev libplist-dev libzip-dev openssl libssl-dev libusb-1.0-0-dev libreadline-dev build-essential git make automake libtool pkg-config checkra1n sshpass
git clone 'https://github.com/libimobiledevice/libirecovery'
git clone 'https://github.com/libimobiledevice/idevicerestore'
git clone 'https://github.com/libimobiledevice/usbmuxd'
git clone 'https://github.com/libimobiledevice/libimobiledevice'
git clone 'https://github.com/libimobiledevice/libusbmuxd'
git clone 'https://github.com/libimobiledevice/libplist'
git clone 'https://github.com/rcg4u/iphonessh.git'
cd libplist && ./autogen.sh --without-cython && sudo make install && cd ..
cd libusbmuxd && ./autogen.sh && sudo make install && cd ..
cd libimobiledevice && ./autogen.sh --without-cython && sudo make install && cd ..
cd usbmuxd && ./autogen.sh && sudo make install && cd ..
cd libirecovery && ./autogen.sh && sudo make install && cd ..
cd idevicerestore && ./autogen.sh && sudo make install && cd ..
sudo ldconfig
base64 -d hacktivation.base64 > mobileactivationd
echo ""
read -p "Complete! Back To Menu? [ Y / n ] : " check

if [ $check = "Y" ]; then
bash hacktivation.sh
elif [ $check = "y" ]; then
bash hacktivation.sh
elif [ $check = "Yes" ]; then
bash hacktivation.sh
elif [ $check = "yes" ]; then
bash hacktivation.sh
elif [ $check = "YES" ]; then
bash hacktivation.sh
else
exit 1
fi

elif [ $ch = 2 ]; then

idevicerestore -e -l
echo ""
read -p "Complete! Back To Menu? [ Y / n ] : " check2

if [ $check2 = "Y" ]; then
bash hacktivation.sh
elif [ $check2 = "y" ]; then
bash hacktivation.sh
elif [ $check2 = "Yes" ]; then
bash hacktivation.sh
elif [ $check2 = "yes" ]; then
bash hacktivation.sh
elif [ $check2 = "YES" ]; then
bash hacktivation.sh
else
exit 1
fi

elif [ $ch = 3 ]; then

checkra1n
echo ""
read -p "Complete! Back To Menu? [ Y / n ] : " check3

if [ $check3 = "Y" ]; then
bash hacktivation.sh
elif [ $check3 = "y" ]; then
bash hacktivation.sh
elif [ $check3 = "Yes" ]; then
bash hacktivation.sh
elif [ $check3 = "yes" ]; then
bash hacktivation.sh
elif [ $check3 = "YES" ]; then
bash hacktivation.sh
else
exit 1
fi

elif [ $ch = 4 ]; then

rm ~/.ssh/known_hosts
pgrep -f 'tcprelay.py' | xargs kill >/dev/null 2>&1
python iphonessh/python-client/tcprelay.py -t 44:2222 &
sleep 1
while true ; do 
  result=$(ssh -p 2222 -o BatchMode=yes -o ConnectTimeout=1 root@localhost echo ok 2>&1 | grep Connection) # -n shows line number
  echo "DEBUG: WAITING FOR CONNECTION, PLEASE RE-CONNECT USB CABLE"
  if [ -z "$result" ] ; then
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost -p 2222 mount -o rw,union,update /
sshpass -p 'alpine' scp -P 2222 mobileactivationd root@localhost:/usr/libexec/mobileactivationd
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost -p 2222 chmod 755 /usr/libexec/mobileactivationd
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost -p 2222 lauNChctl unload /System/Library/LauNChDaemons/com.apple.mobileactivationd.plist
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost -p 2222 lauNChctl load /System/Library/LauNChDaemons/com.apple.mobileactivationd.plist
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost -p 2222 uicache -a
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost -p 2222 killall backboardd
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost -p 2222 killall SpringBoard
pgrep -f 'tcprelay.py' | xargs kill >/dev/null 2>&1
echo""
read -p "Complete! Back To Menu? [ Y / n ] : " check4
    break
  fi
  sleep 1
done

if [ $check4 = "Y" ]; then
bash hacktivation.sh
elif [ $check4 = "y" ]; then
bash hacktivation.sh
elif [ $check4 = "Yes" ]; then
bash hacktivation.sh
elif [ $check4 = "yes" ]; then
bash hacktivation.sh
elif [ $check4 = "YES" ]; then
bash hacktivation.sh
else
exit 1
fi

elif [ $ch = 5 ]; then

echo ""
echo "FEATURE NOT YET ADDED"
echo ""
read -p "Complete! Back To Menu? [ Y / n ] : " check5

if [ $check5 = "Y" ]; then
bash hacktivation.sh
elif [ $check5 = "y" ]; then
bash hacktivation.sh
elif [ $check5 = "Yes" ]; then
bash hacktivation.sh
elif [ $check5 = "yes" ]; then
bash hacktivation.sh
elif [ $check5 = "YES" ]; then
bash hacktivation.sh
else
exit 1
fi
elif [ $ch == 99 ]; then
echo -e "$RED Program Exit ...$NC"
sleep 0.25
exit 1
else
echo "Not Found, Exit"
exit 1
fi
