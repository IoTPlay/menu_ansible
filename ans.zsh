#!/bin/zsh
clear

# ======= CHANGE ONLY THIS ==================================
ans_home="$HOME/iotplay/ops_ansmenus/ansible"
source "$HOME/iotplay/GitHub/menu_ansible/ans_xcfg.ini"
#-------------- ans_menu.ini Exist? -------------------------
if [ ! -f "$ans_menuvars/cfg1.ini" ]; then # Keeping of menu we were in last - was ans_menu.ini
    echo "ans_ini=ans_1.ini" > "$ans_menuvars/cfg1.ini"
fi
if [ ! -f "$ans_menuvars/cfg2.ini" ]; then # keeping the last command
    touch $ans_menuvars/cfg2.ini
fi
# ------the menu ini ----------------------------------------
cd $ans_menus  #/menus ?
inv_limit_file="$ans_home/inventory/inventory_limit.ini" 
source "$inv_limit_file"
source "$ans_menuvars/cfg1.ini"
source "$ans_home/menus/$ans_ini" # from cfg1.ini - chooses the menu in /menus/

# --- Variables----------------------------------------------
testEcho=2 # Error Reporting
# $1 is the first variable after the command, like 'ans 1'
CommandDesc="a$1"       
CommandString="c$1"
LastCommandNo=$(<$ans_menuvars/cfg2.ini)

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

case ${1} in 

    "") # if $1 is empty, thus only command "ans"
        for (( i=0; i<=$ans_menu_count; i++ ))
            do
                eval desc="a"$i             
                echo "$i : ${(P)desc}"
            done ;
        echo "----------------------------------------------------------------------"
        echo "..cmdline 1 = <1..x> - for the action. Last command was <$LastCommandNo>" 
        echo "----------------------------------------------------------------------"
        ;;

    *) # if $1 is not empty

        echo "----menu option $1: Ansible Command: ${(P)CommandDesc} ----------------------------" ;
        echo ".... <Command: ${(P)CommandString}>"
        echo "...."
        echo "$1" > $ans_menuvars/cfg2.ini #Store last command
        eval ${(P)CommandString}
        echo
        exit
        ;;
esac