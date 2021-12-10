# exit if running as root
if [ $(/usr/bin/id -u) -eq 0 ]; then
    echo "you root script"
    exit
fi

# rm ln bash config files
rm ~/.bash_aliases
ln -s -v shdworks/config/bash/.bash_aliases ~/.bash_aliases

rm  ~/.bash_functions
ln -s shdworks/config/bash/.bash_functions ~/.bash_functions

rm ~/.bash_styles
ln -s shdworks/config/bash/.bash_styles ~/.bash_styles

rm ~/.git-prompt.sh
ln -s shdworks/config/bash/.git-prompt.sh ~/.git-prompt.sh

rm ~/.bash_profile
ln -s ./config/bash/.bash_profile ~/.bash_profile

#rm  ~/.bash_logout
#ln -s ./config/bash/.bash_logout ~/.bash_logout

#this we dont want  o more ok
rm ~/.bashrc
ln -s shdworks/config/bash/.bashrc ~/.bashrc

#cat ./config/bash/makebashrc.txt >> ~/.bashrc

# ln git config files
rm ~/.gitconfig
ln -s shdworks/config/.gitconfig ~/.gitconfig

# ln nano config files
rm ~/.nanorc
ln -s shdworks/config/.nanorc ~/.nanorc

# ln dircolors config files
rm ~/.dircolors
ln -s shdworks/config/.dircolors ~/.dircolors


