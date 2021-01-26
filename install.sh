#!/bin/sh

# To run this script - in host, in $HOME directory - run the following command
# wget -O - https://raw.githubusercontent.com/IoTPlay/menu_ansible/master/install.sh | sh

# --- clone the menu_ansible system from github ------------------
varloc1=iotplay
varLoc2=GitHub
varLoc3=menu_ansible
gitRepo=https://github.com/IoTPlay/menu_ansible.git

mkdir $HOME/$varloc1
mkdir $HOME/$varloc1/$varloc2  
mkdir $HOME/$varloc1/$varloc2/$varloc3
cd $varLoc1/$varloc2/$varloc3

git clone $gitRepo

# --- clone the Rouxhome ops_ansmenus and Ansible playbooks -----
varloc1=iotplay
varLoc1=ops_ans_menus
gitRepo=https://github.com/IoTPlay/ops_ansmenus.git

mkdir $HOME/$varloc1/$varloc2
cd $varLoc1/$varloc2

git clone $gitRepo

# --- Install ansible, docker, python, zsh ---------------------------
# --- Ubuntu, RPi ---
sudo apt -y update && sudo apt -y upgrade
#sudo apt install pip3
sudo apt -y install ansible
sudo apt -y install python3
sudo apt -y install zsh         # https://symeonchen.com/2018/03/11/install_zsh_on_the_raspberry_pi/
# --- settings ---
chsh -s /bin/zsh # Change default shell to zsh
