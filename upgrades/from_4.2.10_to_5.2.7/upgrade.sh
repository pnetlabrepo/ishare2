#!/bin/bash

# Script designed to upgrade PNETLab from 4.2.10 to 5.2.7 version
# Requirement: Having PNETLab 4.2.10 installed for being able to upgrade it to 5.2.7
# This script avoids to make this upgrade process twice

data=$(mysql -uroot -ppnetlab -D pnetlab_db -e "SELECT control_value FROM control WHERE control_value>1;" 2>/dev/null)
pnetlab_info=($data)
pnetlab_version=${pnetlab_info[1]}

if [[ $pnetlab_version == "5.2.7" ]]; then
    echo "PNETLab already upgraded to v5.2.7"
    exit 0
fi

if ! [[ $pnetlab_version == "4.2.10" ]]; then
    echo "You need to have the v4.2.10 to upgrade to the v5.2.7"
    exit 0
fi

GREEN='\033[32m'
NO_COLOR='\033[0m'
    
echo -e "${GREEN}Downloading 5.2.7 zip file...${NO_COLOR}"
wget -q --show-progress -O /root/5.2.7.zip https://raw.githubusercontent.com/pnetlabrepo/ishare2/main/upgrades/from_4.2.10_to_5.2.7/5.2.7.zip
echo -e "${GREEN}5.2.7 zip file has been downloaded successfully${NO_COLOR}"
cd /root
rm -rf upgrade
unzip 5.2.7.zip -d ./upgrade > /dev/null 2>&1
chmod 755 -R upgrade
find upgrade -type f -print0 | xargs -0 dos2unix > /dev/null 2>&1
echo -e "${GREEN}Upgrading to v5.2.7...${NO_COLOR}"
./upgrade/upgrade
echo -e "${GREEN}Upgrade to v5.2.7 has been done successfully${NO_COLOR}"
rm -rf upgrade
#rm 5.2.7.zip
echo -e "${GREEN}PNETLab VM will be rebooted now${NO_COLOR}"
reboot
