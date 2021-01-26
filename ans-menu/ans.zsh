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

# ------the menu ini ----------------------------------------
inv_limit_file="$ans_home/inventory/inventory_limit.ini" 
source "$inv_limit_file"
source "$ans_home/ans-menu/ans_menu.ini"  
source "$ans_home/ans-menu/menus/$ans_ini" # from ans_menu.ini

# --- Variables----------------------------------------------
testEcho=0 # Error Reporting
# $1 is the first variable after the command, like 'ans 1'
CommandDesc="a$1"       
CommandString="c$1"

if [[ $testEcho == 1 ]]; then   # Error Reporting
    echo "Log: Variable TestEcho is = 1"
    echo "Log: var ans_menus is = $ans_menus"
    echo "Log: vars CommandDesc = $CommandDesc , and CommandString = $CommandString";
    echo "Log: ans_menu_count = $ans_menu_count ";
fi
# ------ env variables export--------------------------------
export ANSIBLE_CONFIG=$ans_home
export DOCKER_CLIENT_TIMEOUT=600
export COMPOSE_HTTP_TIMEOUT=600

#------------------------------------------------------------
echo ""
echo "|==== MENU SYSTEM: $ans_menu_name ================"
echo "|     with inv_limit:[$limit], menu host: [$host_used] "
echo "|---------------------------------------------------------------------|"
#-----------1st cmdline for Ansible commands ----------------------------------------
case ${1} in 
"") # if $1 is empty
    for (( i=0; i<=$ans_menu_count; i++ ))
        do
            eval desc="a"$i             #Creating a var ans1_desc
            #echo "${!var1} : ${!var2}"
            # In bash this works # echo "$i : ${!desc}"
            # eval "value=\"\${$desc}\"" # ${${desc}}
            echo "$i : ${(P)desc}"
        done ;
    echo "----------------------------------------------------------------------"
    echo "..cmdline 1 = <1..x> - for the action." 
    echo "----------------------------------------------------------------------"
    ;;

[1-50]*) # if $1 is not empty

    echo "----menu option $1: Ansible Command: ${(P)CommandDesc}----------------------------"; 
    echo ".... <Command: ${(P)CommandString}>"
    echo "...."
    eval ${(P)CommandString}
    echo
    exit;
    ;;
esac

