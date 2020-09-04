#!/bin/bash

##########################
#ROOT PRIVILEGES
###########################

if [[ $EUID -ne 0 ]]; then
      echo -e "$RED You don't have root privileges, execute the script as root.$NC"
      exit 1
fi

clear

rm ~/.ssh/known_hosts >/dev/null 2>&1
pgrep -f 'tcprelay.py' | xargs kill >/dev/null 2>&1
python iphonessh/python-client/tcprelay.py -t 44:2222 &
sleep 1
while true ; do 
  result=$(ssh -p 2222 -o BatchMode=yes -o ConnectTimeout=1 root@localhost echo ok 2>&1 | grep Connection) # -n shows line number
  echo "DEBUG: WAITING FOR CONNECTION, PLEASE DISCONNECT AND RE-CONNECT USB CABLE"
  sleep 1
  if [ -z "$result" ] ; then
echo 'CONNECTED TO DEVICE!'

sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost -p 2222 mount -o rw,union,update /
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost -p 2222 killall backboardd
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost -p 2222 killall thermalmonitord
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost -p 2222 killall lockdownd
sshpass -p 'alpine' scp -P 2222 bypass_scripts/oc34n_activation_server_13_x/iuntethered.dylib root@localhost:/Library/MobileSubstrate/DynamicLibraries/iuntethered.dylib
sshpass -p 'alpine' scp -P 2222 bypass_scripts/oc34n_activation_server_13_x/iuntethered.plist root@localhost:/Library/MobileSubstrate/DynamicLibraries/iuntethered.plist
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost -p 2222 uicache --all
sleep 10
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost -p 2222 ldrestart
sleep 15
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost -p 2222 rm /Library/MobileSubstrate/DynamicLibraries/iuntethered.dylib
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost -p 2222 rm /Library/MobileSubstrate/DynamicLibraries/iuntethered.plist
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost -p 2222 uicache --all
sleep 10
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost -p 2222 ldrestart
sleep 15
echo 'COMPLETE!'

pgrep -f 'tcprelay.py' | xargs kill >/dev/null 2>&1
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

