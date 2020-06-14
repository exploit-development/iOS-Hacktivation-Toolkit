#!/bin/bash

rm ~/.ssh/known_hosts >/dev/null 2>&1
pgrep -f 'tcprelay.py' | xargs kill >/dev/null 2>&1
python iphonessh/python-client/tcprelay.py -t 44:2222 &
sleep 2
while true ; do 
  result=$(ssh -p 2222 -o BatchMode=yes -o ConnectTimeout=1 root@localhost echo ok 2>&1 | grep Connection) # -n shows line number
  echo "DEBUG: WAITING FOR CONNECTION, PLEASE DISCONNECT AND RE-CONNECT USB CABLE"
  sleep 1
  if [ -z "$result" ] ; then
echo 'CONNECTED TO DEVICE!'
echo 'CONTINUE TO THE CHOOSE A WIFI NETWORK SCREEN BUT DO NOT CONNECT TO A NETWORK'
read -p 'PRESS ENTER TO CONTINUE'
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost -p 2222 mount -o rw,union,update /
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost -p 2222 launchctl unload /System/Library/LaunchDaemons/com.apple.mobileactivationd.plist
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost -p 2222 rm /usr/libexec/mobileactivationd
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost -p 2222 uicache --all
sshpass -p 'alpine' scp -P 2222 bypass_scripts/mobileactivationd_12_4_7/mobileactivationd root@localhost:/usr/libexec/mobileactivationd
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost -p 2222 chmod 755 /usr/libexec/mobileactivationd
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost -p 2222 launchctl load /System/Library/LaunchDaemons/com.apple.mobileactivationd.plist
pgrep -f 'tcprelay.py' | xargs kill >/dev/null 2>&1
echo 'CHOOSE CONNECT TO ITUNES OPTION ON DEVICE TO COMPLETE BYPASS'
    break
  fi
done

read -p "RETURN TO MENU? [ Y / N ] : " check

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
