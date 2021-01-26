### Ansible Menu option file
The ansible menu is run with `bash ans.sh <menu-option>`. It provides a menu system to improve the speed to execute ansible files.

Now moved to .zsh, the new Mac standard. Done by:
- renaming ans.sh to ans.zsh
- naming the use of ans.sh in all the .ini scripts to ans.zsh
- editing settings file of zsh to know where the ans folder is with `nano ~/.zshenv`, and adding this line:
    - echo alias ans="zsh $HOME/iotplay/GitHub/menu_ansible/ans.zsh" >> ${HOME}/.zshenv

## Links
- zsh Grammer: http://zsh.sourceforge.net/Doc/Release/Shell-Grammar.html
- sh case Grammer: https://tldp.org/LDP/Bash-Beginners-Guide/html/sect_07_03.html

