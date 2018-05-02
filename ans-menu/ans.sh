#!/bin/bash
# Load config file
# The below are base variables of the menu system.
# Replace
#    - <user> with the user of the O/S
#    - <Git_xxx> - a local folder where you want to keep all the Ansible scripts in. I use a folder which I replicate back to Git.
clear
source ~/<Git_xxx>/ansible/ans-menu/ans_0.ini
source "/Users/<user>/<Git_xxx>/ansible/inventory/inventory_limit.ini"
# ------the menu ini --------------------------------------
source ~/<Git_xxx>/ansible/ans-menu/ans_menu.ini # The menu system to use
source ~/<Git_xxx>/ansible/ans-menu/$ans_ini
# ------ env variables export------------------------------
export ANSIBLE_CONFIG=$ansible_cfg
export ANSIBLE_CONFIG="/Users/<user>/<Git_xxx>/ansible"
export DOCKER_CLIENT_TIMEOUT=600
export COMPOSE_HTTP_TIMEOUT=600
# ---Some Variables----------------------------------------
#ansNo_play="ans$1_play"   # ie. ans2_play
CommandDesc="a$1"        # old ansNo_desc
CommandString="c$1"      # old cmdNo   The Command string     ie. cmd3
#echo "test.......$ansNo_play = "${!ansNo_play}""

#------------------------------------------------------------
echo ""
echo "==== MENU SYSTEM: $ans_menu_name, with inv_limit:[$limit] =================="
#-----------1st cmdline for Ansible commands ----------------------------------------
case "$1" in

"")
    #echo "Menu:"
    #for i in {0..40}
    for (( i=0; i<=$ans_menu_count; i++ ))
        do
            #eval var1="ans"$i"_opt"             #creating a var ans1_opt
            eval desc="a"$i             #Creating a var ans1_desc
            #echo "${!var1} : ${!var2}"
            echo "$i : ${!desc}"
        done ;
    echo "----------------------------------------------------------------------"
    #echo "Now choose an option, ie. <bash ans.sh 1> ext dabar>"
    echo "..cmdline 1 = <1..x> - for the action."
    #echo "..cmdline 2 = int/ext - to use defined hosts file."
    echo "----------------------------------------------------------------------"
    ;;

"-a")
    echo "--ans_x.ini to choose ----------------------------------------"


    echo "----------------------------------------------------------------------"
    ;;

    "$1")
      echo "----menu option $1: Ansible Command: ${!CommandDesc}----------------------------";
      echo "....---the command is:---"
      echo "....... <${!CommandString}>"
      echo "......."
      eval "${!CommandString}"
      echo

    #   read -t 1 -p "Returning to menu..." ; echo ;
    #   source $vartoolsdir/menu-central.sh
    #   exit;
    ;;
esac
