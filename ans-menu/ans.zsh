#!/bin/zsh

clear
# ======= CHANGE ONLY THIS ==================================
ans_home="$HOME/iotplay/ops_ansmenus/ansible"

source "$ans_home/ans-menu/ans_xcfg.ini"
cd $ans_menus
#-------------- ans_menu.ini Exist? -------------------------
if [ ! -f "$ans_home/ans-menu/ans_menu.ini" ]; then
    echo "ans_ini=ans_1.ini" >> "$ans_home/ans-menu/ans_menu.ini"
fi
#------------------------------------------------------------

# ------the menu ini ----------------------------------------
inv_limit_file="$ans_home/inventory/inventory_limit.ini" 
source "$inv_limit_file"
source "$ans_home/ans-menu/ans_menu.ini"  
source "$ans_home/ans-menu/$ans_ini" # from ans_menu.ini

# ------ env variables export--------------------------------
export ANSIBLE_CONFIG=$ans_home
export DOCKER_CLIENT_TIMEOUT=600
export COMPOSE_HTTP_TIMEOUT=600

# ---Some Variables------------------------------------------
#ansNo_play="ans$1_play"   # ie. ans2_play
CommandDesc="a$1"       
CommandString="c$1"        #  The Command string     ie. cmd3
#echo "test.......$ansNo_play = "${!ansNo_play}""

#------------------------------------------------------------
echo ""
echo "|==== MENU SYSTEM: $ans_menu_name  ================"
echo "|     with inv_limit:[$limit], menu host: [$host_used] "
echo "|-----------------------------------------------------------------------------|"
#-----------1st cmdline for Ansible commands ----------------------------------------
case "$1" in

"")
    #echo "Menu:"
    #for i in {0..40}
    for (( i=0; i<=$ans_menu_count; i++ ))
        do
            #eval var1="ans"$i"_opt"    #creating a var ans1_opt
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
