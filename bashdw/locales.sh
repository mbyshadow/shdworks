#!/bin/bash

#shadow tell lies, parnoid, you change lang  
current_lang=$1

echo -e "uncomment"
nano /etc/locale.gen
locale-gen
localctl set-locale LANG=$current_lang

# if terminal knas
#echo LANG=$current_lang >> /etc/locale.conf
#echo LC_ALL= >> /etc/locale.conf
