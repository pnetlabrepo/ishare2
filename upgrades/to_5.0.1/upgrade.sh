#!/bin/bash

# Script designed to upgrade PNETLab from 4.2.10 version to 5.0.1 version
# Requirement: Having PNETLab v4.2.10 first for being able to upgrade it to v5.0.1

data=$(mysql -uroot -ppnetlab -D pnetlab_db -e "SELECT control_value FROM control WHERE control_value>1;" 2>/dev/null)
pnetlab_version=( $data )

if [[ ${pnetlab_version[1]} == "5.0.1" ]]
then
    echo "PNETLab already upgraded to v5.0.1"
    exit 0
fi

if ! [[ ${pnetlab_version[1]} == "4.2.10" ]]
then
    echo "You need to have the v4.2.10 to upgrade to the v5.0.1"
    exit 0
fi

echo "Upgrading to 5.0.1"
wget -O /tmp/5.0.1.zip https://raw.githubusercontent.com/pnetlabrepo/ishare2/main/upgrades/to_5.0.1/5.0.1.zip > /dev/null 2>&1
cd /tmp
rm -rf upgrade
unzip 5.0.1.zip -d ./upgrade > /dev/null 2>&1
chmod 755 -R upgrade
find upgrade -type f -print0 | xargs -0 dos2unix > /dev/null 2>&1
./upgrade/upgrade
rm -rf upgrade
rm 5.0.1.zip