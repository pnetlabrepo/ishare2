```linux
This script allows to upgrade PNETLab from v4.2.10 to v5.0.1
```
## upgrade.sh

`Only applicable for cases where your PNETLab version is 4.2.10. Otherwise, an error message will be displayed and the script execution will be finished`

`Also, this script detects if you already have PNETLab v5.0.1 in your system and avoids to upgrade twice`

### Upgrade
Apply this command using the terminal
```linux
wget -O upgrade.sh https://raw.githubusercontent.com/pnetlabrepo/ishare2/main/upgrades/to_5.0.1/upgrade.sh > /dev/null 2>&1 && chmod +x upgrade.sh && bash upgrade.sh
```

After a few seconds, the upgrade will be done.

Note: This upgrade does not use ishare2:

When you execute the command from above, the steps are as follows:

1) A file called `upgrade.sh` will be downloaded from this [repository](https://github.com/pnetlabrepo/ishare2/tree/main/upgrades/to_5.0.1)
2) Execution permissions will be made to this file
3) This script will be executed in order to make the upgrade by using the same instructions as described in the PNETLab Official website ["How to Upgrade PNETLab? Section 2. PNETLab can not connect to Internet."](https://pnetlab.com/pages/documentation?slug=how-to-upgrade-pnetlab)
