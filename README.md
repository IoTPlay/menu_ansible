# menu_ansible

### What it Does
An sh-based scripting menu system to manage remote resources using Ansible playbooks.

### Background
We deploy docker instances to Raspberry Pi's and other platform to host open source solutions. We tend to end-up at using Node-RED, MariaDB, Mosquitto and others a lot. This leaves lots of administrative tasks for the preparation and managemenentof the RPi's. We wrote normal menu systems using bash, running on the Mac, and on the Pi's to do this with. But 7 months in, we realised this will not be sustainable. Doing maintenance on the bash scripts to configure all were cumbersome, and error-prone. Onle one person knew where all the variables etc were, and if you have not worked in it for some weeks, you need to go read all the scripts again.

So, we set off on a journey to find the right tool to do this, Open source was important. We settled on **Ansible**, check it out on [www.ansible.com](http://www.ansible.com). Here you write

But the open source version lacks menu structures, etc, essentially one run the playbooks, with all the command line options from the Terminal. This menu system has 2 lines per menu, a human readable line, displayed on the menu, and the ansible, or other sh-script command line to execute the playbook.

### My Environment
We use Apple Macs, and manage Raspberry Pi's, both from my home LAN, and over the Internet with the menu structure.

### Knowing Ansible

When we learned Ansible, we made cryptic notes, with links to other sources. Maybe this will be useful to others. Here are the links to the notes:
- [Ansible - General](https://github.com/IoTPlay/docker-iotplay-standards/blob/master/README/READ2-ansible.md)
- [Ansible Vault - how to deal with secrets](https://github.com/IoTPlay/docker-iotplay-standards/blob/master/README/READ3-ansible-vault.md)
- [Managing doocker with Ansible](https://github.com/IoTPlay/docker-iotplay-standards/blob/master/README/READ4-ansible_docker.md)

### Command Line System Features

TODO. nont completed. (ansible, host limitor, etc.)

### The Menu system

Several setup files are required:

|#|File     | what it does
|-|---------|--------------
|1|ans_0.ini|Stores var's on ansible hosts file, var_files, playbooks, etc.
|2|ans_1.ini|the first menu (if you only require one, next not needed)
|3|ans_x.ini|The different menu's variables
|4|ans_menu.ini|The variable of the active menu to run
|5|ans.sh| The code that runs the menu|

### Instructions to Install the Ansible menu Scripts

1. Clone this repo to local
2. Update the variables as per instructions in these files, about your file locations in ans_0.ini, ans_x.ini, and ans.sh.
3. The instructions, replace:
    - `<user>` with the user of the O/S  (We use Mac)
    - `<Git_xxx>` - a local folder where you want to keep all the Ansible scripts in. I use a folder which I replicate back to Git.

4. Add a line to your .bash_profile in your HOME directory, with
  `vi ~/.bash_profile`   
  and add the following line:   

  `alias ans="bash ~/<Git_xxx>/ansible/ans-menu/ans.sh "`


### Look & Feel

The **main menu**, from which you choose other menus.
```
==== MENU SYSTEM: 1) - Host configs and Docker Images ==================
0 : Passphrase for the ssh id_rsa
1 : ...This Menu - Home...
2 : MENU: Change to menu (2) - Host configs and Docker Images
3 : MENU: Change to menu (3) - Docker Images
4 : MENU: Change to menu (4) - Docker Dev on Apple Mac
5 : MENU: Change to menu (5) - Docker Containers for Client X
6 : MENU: Change to menu (6) - Docker Containers for Client Y
7 : MENU: Change to menu (7) - DevOps GENERAL Commands
----------------------------------------------------------------------
..cmdline 1 = <1..x> - for the action.
----------------------------------------------------------------------
```

One of the menus.
```
==== MENU SYSTEM: 2) HOST & DOCKER PREPARATION--- ==================
0 : Passphrase for the ssh id_rsa
1 : MENU: Change to menu (1) - Home
2 : Edit the inventory_limit variable, inv_limit:[rh-02]
3 :
6 : Registry: Private Registry details on rh01
7 : Registry: Private Registry START on rh01 (download image budry/registry-arm)
8 :
9 : Registry: Images on rh01
11 : Docker Image: Pull the proxy, and add to rh01 private registry
12 : Docker Image: Pull the MariaDB, and add to rh01
13 : Docker Image: Build NodeRed from Dockerfile for Mac
14 : Docker Image: Build NodeRed from Dockerfile (usr iotp) for Arm
15 : Docker Image: Build Mosquitto from Dockerfile (usr iotp) for Arm
16 :
17 : Docker Images: LIST them...
----------------------------------------------------------------------
..cmdline 1 = <1..x> - for the action.
----------------------------------------------------------------------
```

### How do I use the Menu System

After installation, and config, in a Terminal window, for example menus as shown above:

From any menu:
 - ` ans 1 ` - brings up the menu of menu's
From menu 1 - menu of menus:
 - ` ans 2 ` - opens menu 2
From any menu, (other than menu 1):
 - ` ans 2` - opens a vi editor, so you can change the host limitor, for all menu's to use.
 - ` ans 17` - List all Docker images for the host limits.

### Version Tracker
- version 1: This version.


### Issues & ToDo
- No1: Add a menu version number.
- No2: ans_menu.ini writes a funny file as it switches from menu to menu.
- No3: More instructions of Ansible variables, hosts, playbooks.
