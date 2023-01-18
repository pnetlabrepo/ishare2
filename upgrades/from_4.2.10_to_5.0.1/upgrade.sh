#!/bin/bash

# Script designed to upgrade PNETLab from 4.2.10 to 5.0.1 version
# Requirement: Having PNETLab 4.2.10 installed for being able to upgrade it to 5.0.1
# This script avoids to make this upgrade process twice

# CONSTANTS
GREEN='\033[32m'
NO_COLOR='\033[0m'
URL_ZIP_FILE=https://raw.githubusercontent.com/pnetlabrepo/ishare2/main/upgrades/from_4.2.10_to_5.0.1/5.0.1.zip

# Getting PNETLab version from db
data=$(mysql -uroot -ppnetlab -D pnetlab_db -e "SELECT control_value FROM control WHERE control_value>1;" 2>/dev/null)
pnetlab_info=($data)
pnetlab_version=${pnetlab_info[1]}

if [[ $pnetlab_version == "5.0.1" ]]; then
    echo "PNETLab already upgraded to v5.0.1"
    exit 0
fi

if ! [[ $pnetlab_version == "4.2.10" ]]; then
    echo "You need to have the v4.2.10 to upgrade to the v5.0.1"
    exit 0
fi

echo -e "${GREEN}Downloading 5.0.1.zip file...${NO_COLOR}"
wget -O /tmp/5.0.1.zip $URL_ZIP_FILE > /dev/null 2>&1
echo -e "${GREEN} Zip file has been downloaded successfully${NO_COLOR}"

cd /tmp && rm -rf upgrade

echo -e "${GREEN}Unzipping zip file...${NO_COLOR}"
unzip 5.0.1.zip -d ./upgrade > /dev/null 2>&1
echo -e "${GREEN}Zip file has been unzipped successfully...${NO_COLOR}"

chmod 755 -R upgrade
find upgrade -type f -print0 | xargs -0 dos2unix > /dev/null 2>&1

echo -e "${GREEN}Upgrading to v5.0.1...${NO_COLOR}"
./upgrade/upgrade
echo -e "${GREEN}Upgrade to v5.0.1 has been done successfully${NO_COLOR}"

rm -rf upgrade
rm 5.0.1.zip
