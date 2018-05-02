# menu_ansible

### What it Does
An sh-based scripting menu system to manage remote resources using Ansible playbooks.

### Background
We deploy docker instances to Raspberry Pi's and other platform to host open source solutions. We tend to end-up at using Node-RED, MariaDB, Mosquitto and others a lot. This leaves lots of administrative tasks for the preparation and managemenentof the RPi's. We wrote normal menu systems using bash, running on the Mac, and on the Pi's to do this with. But 7 months in, we realised this will not be sustainable. Doing maintenance on the bash scripts to configure all were cumbersome, and error-prone. Onle one person knew where all the variables etc were, and if you have not worked in it for some weeks, you need to go read all the scripts again.

So, we set off on a journey to find the right tool to do this, Open source was important. We settled on **Ansible**, check it out on [www.ansible.com](http://www.ansible.com). Here you write

But the open source version lacks menu structures, etc, essentially one run the playbooks, with all the command line options from the Terminal. This menu system has 2 lines per menu, a human readable line, displayed on the menu, and the ansible, or other sh-script command line to execute the playbook.

### My Environment
I use a Mac, and manage Raspberry Pi's, both from my home LAN, and over the Internet with the menu structure.

### Knowing Ansible

When we learned Ansible, we made cryptic notes, with links to other sources. Maybe this will be useful to others. Here are the links to the notes:
- [Ansible - General](https://github.com/IoTPlay/docker-iotplay-standards/blob/master/README/READ2-ansible.md)
- [Ansible Vault - how to deal with secrets](https://github.com/IoTPlay/docker-iotplay-standards/blob/master/README/READ3-ansible-vault.md)
- [Managing doocker with Ansible](https://github.com/IoTPlay/docker-iotplay-standards/blob/master/README/READ4-ansible_docker.md)

### Command Line System Features

### The Menu system.

Several setup files are required.,

|#|File     | what it Does
|-|---------|--------------
|1|ans_0.ini|Stores var's on ansible hosts file, var_files, playbooks, etc.
|2|ans_1.ini|the first menu (if you only require one, next not needed)
|3|ans_x.ini|The different menu's variables
|4|ans_menu.ini|The variable of the active menu to run
|5|ans.sh| The code that runs the menu|

### Instructions to Install the Ansible menu Scripts
todo

### Version Tracker
- version 1:


### Issues
