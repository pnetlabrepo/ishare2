#!/bin/bash

# Script designed to upgrade dependencies in PNETLab UBUNTU 20.04
# Requirement: You need to have UBUNTU 20.04

# CONSTANTS
GREEN='\033[32m'
RED='\033[31m'
NO_COLOR='\033[0m'

ZIP_FILENAME=pnetlabv6_offline.zip
URL_ZIP_FILE='https://unetlab.cloud/api/raw/?path=/UNETLAB%20I/upgrades_pnetlab/extras/upgrade_to_ubuntu_20.04/pnetlabv6_offline.zip'

# Check if user is root
if [ "$(id -u)" != "0" ]; then
    echo -e "${RED}Upgrade has been rejected. You must run this script as root${NO_COLOR}"
    exit 0
fi

lsb_release -r -s | grep -q 20.04
if [ $? -ne 0 ]; then
    echo -e "${RED}Upgrade has been rejected. You must be running UBUNTU 20.04 to run this script${NO_COLOR}"
    exit 0
fi

echo -e "${GREEN}Downloading $ZIP_FILENAME...${NO_COLOR}"
wget --content-disposition -q --show-progress -O /tmp/$ZIP_FILENAME "$URL_ZIP_FILE"
echo -e "${GREEN}$ZIP_FILENAME has been downloaded successfully${NO_COLOR}"

cd /tmp && rm -rf upgrade

apt-get update >/dev/null 2>&1
apt-get install unzip >/dev/null 2>&1
apt-get purge -y docker.io containerd runc netplan.io &>/dev/null
apt-get autoremove &>/dev/null
apt-get autoclean &>/dev/null

echo -e "${GREEN}Unzipping $ZIP_FILENAME (this may take a while)...${NO_COLOR}"
unzip $ZIP_FILENAME -d ./upgrade >/dev/null 2>&1
echo -e "${GREEN}$ZIP_FILENAME has been unzipped successfully...${NO_COLOR}"

echo -e "${GREEN}Changing permissions...${NO_COLOR}"
chmod 755 -R upgrade
echo -e "${GREEN}Permissions have been changed successfully${NO_COLOR}"

echo -e "${GREEN}Converting files to unix format...${NO_COLOR}"
find upgrade -type f -print0 | xargs -0 dos2unix >/dev/null 2>&1
echo -e "${GREEN}Files have been converted to unix format successfully${NO_COLOR}"

echo -e "${GREEN}Executing upgrade script...${NO_COLOR}"
./upgrade/install_pnetlab_v6_offline.sh
if [ $? -ne 0 ]; then
    echo -e "${RED}Upgrade has been rejected. Something went wrong${NO_COLOR}"
    exit 0
fi
echo -e "${GREEN}Upgrade has been done successfully!${NO_COLOR}"

echo -e "${GREEN}Cleaning up...${NO_COLOR}"
rm -rf upgrade
rm /tmp/$ZIP_FILENAME

echo -e "${GREEN}PNETLab VM will be rebooted in 10 seconds (press CTRL+C to cancel)...${NO_COLOR}"
echo -e "${GREEN}Try to connect again in about a minute with these credentials: username=root password=pnet${NO_COLOR}"
sleep 10
echo -e "${GREEN}Rebooting...${NO_COLOR}"
reboot
