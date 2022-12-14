<h1 align="center">
  <img src="https://media1.giphy.com/media/wvQIqJyNBOCjK/giphy.gif" width="100"/>
    ishare2
</h1>

<h2 align="center">
  CLI-based Bash tool used to download and install images into a PNETLab server automatically and with minimal efforts
</h2>

## :hammer_and_wrench: Language
<div>
  <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/bash/bash-original.svg" title="Bash" alt="Bash" width="40" height="40"/>&nbsp;
</div>

## 🚀 Installation
Apply this command using the terminal
```linux
wget -O /usr/sbin/ishare2 https://raw.githubusercontent.com/pnetlabrepo/ishare2/main/ishare2 > /dev/null 2>&1 && chmod +x /usr/sbin/ishare2 && ishare2
```

Note: There is no need to be in the same directory where *ishare2* file is installed in order to execute it

## ✅ Syntax
    
    ishare2 [action] [param1] [param2]
    
    action:
      search      : Search for images by type
      pull        : Download an image by type and number
      installed   : Show installed images on server
      labs        : Show labs on server and download images for those labs
      mylabs      : Same as labs command but using a customized path to labs
      relicense   : Generate a new iourc license for bin images
      upgrade     : Upgrade ishare2 code to the latest version
      changelog   : Show the latest changes made to ishare2
      help        : Show useful information
      
    param1:
      type = all, bin, qemu, dynamips, docker or name
      
    param2:
      number = This number can be obtained using ishare2 search <type>
   
## Examples of usage

## 💎 Search for images
    - ishare2 search <type>
        - ishare2 search all
        - ishare2 search bin
        - ishare2 search qemu
        - ishare2 search dynamips
        - ishare2 search <name>
            Examples:
              - ishare2 search vios
              - ishare2 search win-
              - ishare2 search winserver
              - ishare2 search kali
              - ishare2 search mikro
              - ishare2 search forti
              - ishare2 search nxos
              - ishare2 search vmx
              - ishare2 search esxi
              - ishare2 search palo
              - ishare2 search Licensed
              
`You can get more <name> options by using ishare2 search all`

## 💎 Pull images by number
    - ishare2 pull bin <number>
    - ishare2 pull qemu <number>
    - ishare2 pull dynamips <number>
`<number> can be obtained by using ishare2 search <type>`
    
## 💎 Pull all images at once
    - ishare2 pull bin all
    - ishare2 pull qemu all (Not available for qemu type due to its large size)
    - ishare2 pull dynamips all
    
## 💎 Show which images were installed
    - ishare2 installed all
    - ishare2 installed bin
    - ishare2 installed qemu
    - ishare2 installed dynamips
    - ishare2 installed docker
    
## 💎 Download every image available in a lab that was downloaded from [PNETLab Store](https://user.pnetlab.com/store/labs/view)
    - ishare2 labs
    - ishare2 labs <number>
    - ishare2 labs all
`Not available to every lab because some of them were encrypted by authors and cannot be analyzed`

## 💎 Download every image available in a lab downloaded at a custom location in your server
    - ishare2 mylabs <path>
    - ishare2 mylabs <path> <number>
    - ishare2 mylabs <path> all
    
## 💎 Extras
    - ishare2 relicense
    - ishare2 upgrade
    - ishare2 changelog
    - ishare2 help
    
## Useful information

* For problems, use our Telegram Channel describing your problem and sending a screenshot and/or a video
* For new files to be uploaded, you can also use our Telegram Channel: In this case, you can send or ask for new images to be uploaded
* Using ishare2 upgrade will result in upgrading this utility (ishare2). It will not upgrade your PNETLab Ubuntu VM version
* If CiscoIOUKeygen.py, iourc and/or keepalive.pl files in /opt/unetlab/addons/iol/bin/ are deleted, you can recover them by using ishare2 relicense. This will not affect images in there

  Also, this command when used, will generate a new license file called "iourc", needed for bin files
* Don't cancel a download. In case you do it, you will have to remove incomplete files or folders manually
* The main difference between ishare2 labs and ishare2 mylabs is that, in the first case, the folder used is the one PNETLab creates when you download a lab from the store and in the second case you are able to select any folder you want in order to download labs
    
    Telegram Channel: https://t.me/unetlab_cloud

## See the latest changes on ishare2

[CHANGELOG.md](https://github.com/pnetlabrepo/ishare2/blob/main/CHANGELOG.md)

## How to upgrade your PNETLab server

- Upgrade from v4.2.10 to v5.0.1: [Instructions](https://github.com/pnetlabrepo/ishare2/tree/main/upgrades/from_4.2.10_to_5.0.1)
- Upgrade from v4.2.10 to v5.2.7: [Instructions](https://github.com/pnetlabrepo/ishare2/tree/main/upgrades/from_4.2.10_to_5.2.7)
- Upgrade from v5.0.1 to v5.2.7:  [Instructions](https://github.com/pnetlabrepo/ishare2/tree/main/upgrades/from_5.0.1_to_5.2.7)
                                                
## Known limitations

* Avoid to cancel a download in progress: (IN PROCESS TO FIX IT)

    If you cancel a download in progress, next time you try to download it you will not be allowed to do it because ishare2 will recognize it already exists in the server
    
    In this case, you will have to manually remove it in order to be able to restart the download

## ✨ Links

* qemu, bin and dynamips images can be found at [unetlab.cloud](https://unetlab.cloud/)
* Docker images can be found at [hub.docker.com](https://hub.docker.com/)

## ✨ Useful resources

Check these links to get information on device credentials

* [Excel file #1: passwords_eve.xlsx](https://unetlab.cloud/0:/addons/passwords/)
* [Excel file #2: Passwords - QEMU.xls](https://unetlab.cloud/1:/)
* [PNG file: Eve-NG-Linux.png](https://unetlab.cloud/1:/qemu/Linux/Eve-NG-Linux/)

## ❓Need help?

[ico-telegram]: https://img.shields.io/badge/@PNETLab_Platform_Group-2CA5E0.svg?style=flat-square&logo=telegram&label=Telegram

[link-telegram]: https://t.me/PNETLab

Get in touch with us using our [![Chat on Telegram][ico-telegram]][link-telegram]
