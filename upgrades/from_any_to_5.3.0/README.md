```linux
This script allows to upgrade PNETLab from almost any version to v5.3.0
It cannot be used when version is 6.x

File 5.3.0.zip will be downloaded from unetlab.cloud
```
## upgrade.sh

`This script cannot be used in cases where PNETLab version is 6.x: An error message will be displayed and the script execution will be finished`

`Also, this script detects if you already have PNETLab v5.3.0 in your system and avoids to upgrade twice`

### Upgrade
Apply this command using the terminal
```linux
wget -O upgrade.sh https://raw.githubusercontent.com/pnetlabrepo/ishare2/main/upgrades/from_any_to_5.3.0/upgrade.sh > /dev/null 2>&1 && chmod +x upgrade.sh && bash upgrade.sh
```

After a few seconds, the upgrade will be done.

Note: This upgrade does not use ishare2:

When you execute the command from above, the steps are as follows:

1) A file called [upgrade.sh](https://raw.githubusercontent.com/pnetlabrepo/ishare2/main/upgrades/from_any_to_5.3.0/upgrade.sh) will be downloaded from this repository
2) Execution permissions will be made to this file
3) This script will be executed in order to make the upgrade
