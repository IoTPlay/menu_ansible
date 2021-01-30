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

TODO. not completed. (ansible, host limitor, etc.)

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
  `vi ~/.bash_profile` -- or -- for zsh on Mac   `vi ~/.zshenv`
  and add the following line:   

`echo alias ans="zsh $HOME/iotplay/GitHub/menu_ansible/ans.zsh" >> ${HOME}/.zshenv`
and for bash (working):
`echo "alias ans="zsh $HOME/iotplay/GitHub/menu_ansible/ans.zsh" " >> ${HOME}/.bashrc`


### Settings
The following settings needs to point to where the menu code is:

1. `ansible.cfg` - this must be present in the folder ~/ansible, it has a line `inventory = ` that needs to point to where the host file is, in my case, `.../git_iotp/ansible/inventory/hosts`

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
 - ` ans ` - Writes the current full menu to screen  
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


# IoTP's Menu system & Ansible ssh to hosts

## Setting up this menu system for Ansible from scratch

1. Clone the "menu system" from https://github.com/IoTPlay/menu_ansible and follow the instructions in the [README file](https://github.com/IoTPlay/menu_ansible/blob/master/README.md).    

2. And edit ansible.cfg, in the menu system root to point to `hosts`

## ansible ssh access from controlling host to remote host

3. Setup SSH key pair, instructions: https://www.freecodecamp.org/news/the-ultimate-guide-to-ssh-setting-up-ssh-keys/

-- and -- 

4. Setting up Passwordless SSH login: https://linuxize.com/post/how-to-setup-passwordless-ssh-login/

|# | Command / file        | Step 
|--|-----------------------|-----
|01|~/.ssh/authorized_keys | On External host - we will Generate a public authentication key and append it to the remote hosts
|02|ls -al ~/.ssh/id_*.pub | existing SSH keys present?, If not, next step.
|03|ssh-keygen -t rsa -b 4096 -C "email addr" | Generate a new 4096 bits SSH key pair
|04|ssh-copy-id remote_uname@ip_addr | copy your public key to your server, for instance: 
|04a| rh01     | ssh-copy-id -p2279 iotp@rh01.hosting.lan
|04a| homedig2 | ssh-copy-id -p2279 iotp@homedig2.hosting.lan
|05|vi /etc/ssh/sshd_config | Changes to config files on remote host:
|a.| | PasswordAuthentication no
|b.| | ChallengeResponseAuthentication no
|c.| | UsePAM no
|06|sudo systemctl restart ssh | Debian - restart ssh 

Or, if `ssh-copy-id` not available: 
```
cat ~/.ssh/id_rsa.pub | ssh remote_username@server_ip_address "mkdir -p ~/.ssh && chmod 700 ~/.ssh && cat >> ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys"
```
## Running the `ans` command 

echo alias ans="zsh $HOME/iotplay/GitHub/menu_ansible/ans.zsh" >> ${HOME}/.zshenv