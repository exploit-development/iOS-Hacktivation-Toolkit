#COLOURS
RED="\033[1;31m"
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
CYAN="\033[0;36m"
NC="\e[0m"

#loading ramdisks and ssh n stuff

a6_load_ramdisks(){
	if [ $chexmix == 1 ]; then
		devicename="iphone5"
	elif [ $chexmix == 2 ]; then
		devicename="iphone5c"
	elif [ $chexmix == 3 ]; then
		devicename="ipad4"
	else
	echo "waht teh fck"
	sleep 1
	cd .. && bash hacktivation.sh
	fi
	#Loading the ramdisks
	./ipwndfu -l ../bypass_scripts/ramdisk_$devicename/iBSS
	cd ..
	sleep 1
	irecovery -f bypass_scripts/ramdisk_$devicename/iBEC
	sleep 3
	echo "waiting..."
	sleep 3
	irecovery -f bypass_scripts/ramdisk_$devicename/devicetree
	irecovery -c devicetree
	irecovery -f bypass_scripts/ramdisk_$devicename/ramdisk
	irecovery -c ramdisk
	irecovery -f bypass_scripts/ramdisk_$devicename/kernelcache
	irecovery -c bootx
	echo "waiting..."
	sleep 8
	#This is the SSH part
	rm ~/.ssh/known_hosts >/dev/null 2>&1
	pgrep -f 'tcprelay.py' | xargs kill >/dev/null 2>&1
	python iphonessh/python-client/tcprelay.py -t 22:2222 &
	sleep 1
	sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost -p 2222 mount_hfs /dev/disk0s1s1 /mnt1
	sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost -p 2222 rm -r /mnt1/Applications/Setup.app
	sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no root@localhost -p 2222 reboot_bak
	pgrep -f 'tcprelay.py' | xargs kill >/dev/null 2>&1
	echo ""
	read -p "Bypass done. Press enter to return to the main menu." dummy
	bash hacktivation.sh
	}

#### THIS IS THE END OF THE RAMDISK TEXT

#ipwndfu section lol ;)
ipwndfu_goto(){
	echo " This will run ipwndfu as many times as you want."
	echo " DON'T WORRY IF YOU GET A LANGID ERROR, THAT'S FINE."
	read -p " Press enter to continue... " dummy
	cd ../ipwndfu
	./ipwndfu -p
	sleep 5
	clear
	read -p "Is the device in pwned DFU yet? [ Y / n ]: " checkcheck
	if [ $checkcheck = "Y" ]; then
	a6_load_ramdisks;
	elif [ $checkcheck = "y" ]; then
	a6_load_ramdisks;
	elif [ $checkcheck = "Yes" ]; then
	a6_load_ramdisks;
	elif [ $checkcheck = "yes" ]; then
	a6_load_ramdisks;
	elif [ $checkcheck = "YES" ]; then
	a6_load_ramdisks;
	else
	ipwndfu_goto;
	fi
}

a6_bypass_select(){
	clear;
	echo -e "$GREEN"
	echo " **************************************************"
	echo " *************** Choose your device ***************"
	echo -e " **************************************************$NC"
	echo ' --------------------------------------------------'
	echo ' Before you bypass, make sure to restore your device'
	echo '         and IMMEDIATELY go into DFU mode.'
	echo ' --------------------------------------------------'
	echo -e "$CYAN 1 : iPhone 5$NC"
	echo -e "$CYAN 2 : iPhone 5c$NC"
	echo -e "$CYAN 3 : iPad 4$NC"
	echo -e "$CYAN 0 : Return to Main Menu"
	read -p " Choose >  " chexmix
	if [ $chexmix == 1 ]; then
		clear
		ipwndfu_goto
	elif [ $chexmix == 2 ]; then
		clear
		ipwndfu_goto
	elif [ $chexmix == 3 ]; then
		clear
		ipwndfu_goto
	else 
	cd .. && bash hacktivation.sh
	fi
}
a6_bypass_select
