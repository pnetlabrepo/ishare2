#!/bin/bash

# Script designed to upgrade PNETLab from almost any version to NEW_PNETLAB_VERSION version
# Requirement: Not having PNETLab 6.x installed for being able to upgrade to NEW_PNETLAB_VERSION
# This script avoids to make this upgrade process twice

# CONSTANTS
NEW_PNETLAB_VERSION=5.3.7
GREEN='\033[32m'
NO_COLOR='\033[0m'
URL_ZIP_FILE=https://unetlab.cloud/api/raw/?path=/UNETLAB%20I/upgrades_pnetlab/extras/from_any_to_$NEW_PNETLAB_VERSION/$NEW_PNETLAB_VERSION.zip

# Getting PNETLab version from db
data=$(mysql -uroot -ppnetlab -D pnetlab_db -e "SELECT control_value FROM control WHERE control_value>1;" 2>/dev/null)
pnetlab_info=($data)
pnetlab_version=${pnetlab_info[1]}

if [[ $pnetlab_version == $NEW_PNETLAB_VERSION ]]; then
    echo "PNETLab already upgraded to v$NEW_PNETLAB_VERSION. You can´t upgrade twice"
    exit 0
fi

if [[ $pnetlab_version == *6.* ]]; then
    echo "It is not possible to upgrade to $NEW_PNETLAB_VERSION having version 6.x"
    exit 0
fi

echo -e "${GREEN}Downloading $NEW_PNETLAB_VERSION zip file...${NO_COLOR}"
wget --content-disposition -q --show-progress -O /root/$NEW_PNETLAB_VERSION.zip $URL_ZIP_FILE
echo -e "${GREEN}$NEW_PNETLAB_VERSION zip file has been downloaded successfully${NO_COLOR}"

cd /root && rm -rf upgrade

echo -e "${GREEN}Unzipping zip file...${NO_COLOR}"
unzip $NEW_PNETLAB_VERSION.zip -d ./upgrade >/dev/null 2>&1
echo -e "${GREEN}Zip file has been unzipped successfully...${NO_COLOR}"

chmod 755 -R upgrade
find upgrade -type f -print0 | xargs -0 dos2unix >/dev/null 2>&1

echo -e "${GREEN}Upgrading to v$NEW_PNETLAB_VERSION...${NO_COLOR}"
./upgrade/upgrade
echo -e "${GREEN}Upgrade to v$NEW_PNETLAB_VERSION has been done successfully${NO_COLOR}"

rm -rf upgrade
#rm $NEW_PNETLAB_VERSION.zip

# confirm reboot
echo -e "${GREEN}Do you want to reboot now? [y/n]${NO_COLOR}"
read -r answer
if [[ $answer == "y" ]]; then
    echo -e "${GREEN}Try to connect again in about a minute${NO_COLOR}"
    reboot
fi
