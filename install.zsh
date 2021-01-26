#!/bin/zsh

# --- clone the menu_ansible system from github------
varloc1=iotplay
varLoc2=GitHub
varLoc3=menu_ansible
gitRepo=https://github.com/IoTPlay/menu_ansible.git

mkdir $HOME/$varloc1 $$ mkdir $HOME/$varloc1/$varloc2 && mkdir $$ mkdir $HOME/$varloc1/$varloc2/$varloc3
cd $varLoc1/$varloc2/$varloc3

git clone $gitRepo

# --- clone the Rouxhome ops_ansmenus and Ansible playbooks -----
varloc1=iotplay
varLoc1=ops_ans_menus
gitRepo=https://github.com/IoTPlay/ops_ansmenus.git

mkdir $HOME/$varloc1 $$ mkdir $HOME/$varloc1/$varloc2
cd $varLoc1/$varloc2

git clone $gitRepo
