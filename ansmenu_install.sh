#!/bin/bash

# To run this script - in host, in $HOME directory - run the following command
# wget -O - https://raw.githubusercontent.com/IoTPlay/menu_ansible/master/ansmenu_install.sh | bash

# --- clone the menu_ansible system, and ops_ansmenus and Ansible playbooks from github ------------------
testEcho=2 ## error reporting - 1 for on.
varloc1=iotplay/GitHub/menu_ansible
varloc2=iotplay/ops_ansmenus
gitRepo1="https://github.com/IoTPlay/menu_ansible.git"
gitRepo2="https://github.com/IoTPlay/ops_ansmenus.git"

if [ $testEcho == 1 ]; then   # Error Reporting
  echo "...errorlog: homeVar = ${HOME}, varloc1 = $varloc1, varloc2 = $varloc2" 
  echo "...."
fi 

function cloneinDir () {
  #echo "....errorlog: var1 = "$1", var2 = "$2" "
  mkdir -p "${HOME}/$1"
  git clone --depth 1 $2 "${HOME}/$1" 
}

case ${1} in 

  "")
    cloneinDir ${varloc1} ${gitRepo1}
    cloneinDir ${varloc2} ${gitRepo2}

    # --- Install ansible, docker, python, zsh ---------------------------
    # --- Ubuntu, RPi ---
    sudo apt -y update && sudo apt -y upgrade
    #sudo apt install pip3
    sudo apt -y install ansible
    sudo apt -y install python3
    sudo apt -y install zsh         # https://symeonchen.com/2018/03/11/install_zsh_on_the_raspberry_pi/
    # --- settings ---
    sudo chsh -s /bin/zsh # Change default shell to zsh
    echo 'alias ans="zsh $HOME/iotplay/GitHub/menu_ansible/ans.zsh" ' >> ${HOME}/.zshenv
    echo 'alias ans="zsh $HOME/iotplay/GitHub/menu_ansible/ans.zsh" ' >> ${HOME}/.bashrc
    echo 'eval `ssh-agent -s`'                                        >> ${HOME}/.bashrc
    ;;
  
  "--help")
    echo "Run command with following variables for: "
    echo "  --help   - for help"
    echo "  --system - clones only the menu system"
    echo "  --menu   - clones only the menus and playbooks"
    echo "  without any variables, it will mkdir, clone github menus and system, upd. SW, and install ansible"
  ;;

  "--system")
      cloneinDir ${varloc1} ${gitRepo1}
  ;;
  
  "--menu")
    cloneinDir ${varloc2} ${gitRepo2}
  ;;

esac

