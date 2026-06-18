#!/bin/bash


echo "1. After installation script
2. Set keyboard shortcuts
3. Finalize installation"

read -p $'Choose [1-3]: ' choice

if [[ "$choice" == 1 ]]; then
	./after_install.sh

elif [[ "$choice" == 2 ]]; then
	./keyboard_shortcuts.sh

elif [[ "$choice" == 3 ]]; then
	./finalize.sh

fi



