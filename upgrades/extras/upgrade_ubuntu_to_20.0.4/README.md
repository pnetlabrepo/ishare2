```linux
This script allows to upgrade PNETLab UBUNTU version to 20.04

File pnetlabv6_offline.zip will be downloaded from unetlab.cloud
```
## upgrade.sh

### Upgrade
Apply this command using the terminal
```linux
wget -O upgrade.sh https://raw.githubusercontent.com/pnetlabrepo/ishare2/main/upgrades/extras/upgrade_ubuntu_to_20.0.4/upgrade.sh > /dev/null 2>&1 && chmod +x upgrade.sh && bash upgrade.sh
```

When you run this command from above, the steps will be executed as follows:

1) A file called [upgrade.sh](https://raw.githubusercontent.com/pnetlabrepo/ishare2/main/upgrades/extras/upgrade_ubuntu_to_20.0.4/upgrade.sh) will be downloaded from this repository
2) Execution permissions will be made to this file
3) This script will be executed in order to make the upgrade
