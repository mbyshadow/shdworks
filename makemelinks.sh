# exit if running as root
if [[ $(/usr/bin/id -u) -eq 0 ]]; then
    echo "you root script"
    exit
fi

# rm ln bash config files
rm ~/.bash_aliases
ln -s ./config/bash/.bash_aliases ~/.bash_aliases

rm  ~/.bash_functions
ln -s ./config/bash/.bash_functions ~/.bash_functions

rm ~/.bash_styles
ln -s ./config/bash/.bash_styles ~/.bash_styles

#rm ~/.bash_profile
#ln -s ./config/bash/.bash_profile ~/.bash_profile

#rm  ~/.bash_logout
#ln -s ./config/bash/.bash_logout ~/.bash_logout

#cat ./config/bash/makebashrc.txt >> ~/.bashrc

# ln git config files
rm ~/.gitconfig
ln -s ./config/.gitconfig ~/.gitconfig

# ln nano config files
rm ~/.nanorc
ln -s ./config/.nanorc ~/.nanorc

# ln dircolors config files
rm ~/.dircolors
ln -s ./config/.dircolors ~/.dircolors


