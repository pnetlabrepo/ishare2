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

echo "Downloading 5.2.7 zip file..."
wget -O /root/5.2.7.zip https://raw.githubusercontent.com/pnetlabrepo/ishare2/main/upgrades/from_4.2.10_to_5.2.7/5.2.7.zip > /dev/null 2>&1
echo "5.2.7 zip file has been downloaded successfully"
cd /root
rm -rf upgrade
unzip 5.2.7.zip -d ./upgrade > /dev/null 2>&1
chmod 755 -R upgrade
find upgrade -type f -print0 | xargs -0 dos2unix > /dev/null 2>&1
echo "Upgrading to v5.2.7..."
./upgrade/upgrade
echo "Upgrade to v5.2.7 has been done successfully"
rm -rf upgrade
rm 5.2.7.zip
echo "PNETLab VM will be rebooted now"
reboot
