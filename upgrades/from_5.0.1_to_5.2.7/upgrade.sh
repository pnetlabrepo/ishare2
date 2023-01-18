#!/bin/bash

# Script designed to upgrade PNETLab from 5.0.1 to NEW_PNETLAB_VERSION version
# Requirement: Having PNETLab 5.0.1 installed for being able to upgrade it to NEW_PNETLAB_VERSION
# This script avoids to make this upgrade process twice

# CONSTANTS
NEW_PNETLAB_VERSION=5.2.7
GREEN='\033[32m'
NO_COLOR='\033[0m'
URL_ZIP_FILE=https://raw.githubusercontent.com/pnetlabrepo/ishare2/main/upgrades/from_5.0.1_to_$NEW_PNETLAB_VERSION/$NEW_PNETLAB_VERSION.zip

data=$(mysql -uroot -ppnetlab -D pnetlab_db -e "SELECT control_value FROM control WHERE control_value>1;" 2>/dev/null)
pnetlab_info=($data)
pnetlab_version=${pnetlab_info[1]}

if [[ $pnetlab_version == $NEW_PNETLAB_VERSION ]]; then
    echo "PNETLab already upgraded to v$NEW_PNETLAB_VERSION"
    exit 0
fi

if ! [[ $pnetlab_version == "5.0.1" ]]; then
    echo "You need to have the v5.0.1 to upgrade to the v$NEW_PNETLAB_VERSION"
    exit 0
fi
    
echo -e "${GREEN}Downloading $NEW_PNETLAB_VERSION zip file...${NO_COLOR}"
wget -q --show-progress -O /root/$NEW_PNETLAB_VERSION.zip $URL_ZIP_FILE
echo -e "${GREEN}$NEW_PNETLAB_VERSION zip file has been downloaded successfully${NO_COLOR}"

cd /root && rm -rf upgrade

echo -e "${GREEN}Unzipping zip file...${NO_COLOR}"
unzip $NEW_PNETLAB_VERSION.zip -d ./upgrade > /dev/null 2>&1
echo -e "${GREEN}Zip file has been unzipped successfully...${NO_COLOR}"

chmod 755 -R upgrade
find upgrade -type f -print0 | xargs -0 dos2unix > /dev/null 2>&1

echo -e "${GREEN}Upgrading to v$NEW_PNETLAB_VERSION...${NO_COLOR}"
./upgrade/upgrade
echo -e "${GREEN}Upgrade to v$NEW_PNETLAB_VERSION has been done successfully${NO_COLOR}"

rm -rf upgrade
#rm $NEW_PNETLAB_VERSION.zip
echo -e "${GREEN}PNETLab VM will be rebooted now...${NO_COLOR}"
reboot
