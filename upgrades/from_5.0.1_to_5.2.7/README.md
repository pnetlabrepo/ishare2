```linux
This script allows to upgrade PNETLab from v5.0.1 to v5.2.7

File 5.2.7.zip will be downloaded from unetlab.cloud
```
## upgrade.sh

`Only applicable for cases where your PNETLab version is 5.0.1. Otherwise, an error message will be displayed and the script execution will be finished`

`Also, this script detects if you already have PNETLab v5.2.7 in your system and avoids to upgrade twice`

### Upgrade
Apply this command using the terminal
```linux
wget -O upgrade.sh https://raw.githubusercontent.com/pnetlabrepo/ishare2/main/upgrades/from_5.0.1_to_5.2.7/upgrade.sh > /dev/null 2>&1 && chmod +x upgrade.sh && bash upgrade.sh
```

After a few seconds, the upgrade will be done.

Note: This upgrade does not use ishare2:

When you execute the command from above, the steps are as follows:

1) A file called [upgrade.sh](https://raw.githubusercontent.com/pnetlabrepo/ishare2/main/upgrades/from_5.0.1_to_5.2.7/upgrade.sh) will be downloaded from this repository
2) Execution permissions will be made to this file
3) This script will be executed in order to make the upgrade
