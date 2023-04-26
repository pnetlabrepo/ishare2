```linux
This script allows to upgrade dependencies in PNETLab UBUNTU 20.04

File pnetlabv6_offline.zip will be downloaded from labhub.eu.org
```

## upgrade.sh

`This script cannot be used in cases where PNETLab UBUNTU version is not 20.04: For those cases, an error message will be displayed and the script execution will be finished`

### Upgrade

Apply this command using the terminal

```linux
wget -O upgrade.sh https://raw.githubusercontent.com/pnetlabrepo/ishare2/main/upgrades/extras/upgrade_ubuntu_to_20.04/upgrade.sh > /dev/null 2>&1 && chmod +x upgrade.sh && bash upgrade.sh
```

When you run this command from above, the steps will be executed as follows:

1) A file called [upgrade.sh](https://raw.githubusercontent.com/pnetlabrepo/ishare2/main/upgrades/extras/upgrade_ubuntu_to_20.04/upgrade.sh) will be downloaded from this repository
2) Execution permissions will be applied to this file
3) Finally, this script will be executed in order to make the upgrade
