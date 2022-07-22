# exit if running as root
if [ $(/usr/bin/id -u) -eq 0 ]; then
    echo "you root script"
    exit
fi

# rm ln bash config files
rm -v ~/.bash_aliases
ln -s -v shdworks/config/bash/.bash_aliases ~/.bash_aliases

rm -v ~/.bash_functions
ln -s -v shdworks/config/bash/.bash_functions ~/.bash_functions

rm -v ~/.bash_styles
ln -s shdworks/config/bash/.bash_styles ~/.bash_styles

rm -v ~/.bash_profile
ln -s -v shdworks/config/bash/.bash_profile ~/.bash_profile

#rm  ~/.bash_logout
#ln -s ./config/bash/.bash_logout ~/.bash_logout

#this we dont want  o more ok
rm -v ~/.bashrc
ln -s -v shdworks/config/bash/.bashrc ~/.bashrc

#cat ./config/bash/makebashrc.txt >> ~/.bashrc

# ln git config files
rm -v ~/.gitconfig
ln -s -v shdworks/config/git/.gitconfig ~/.gitconfig

rm -v ~/.git-prompt.sh
#ln -s -v shdworks/config/git/.git-prompt.sh ~/.git-prompt.sh

rm -v ~/.git-completion.bash
ln -s -v shdworks/config/git/.git-completion.bash ~/.git-completion.bash


# ln nano config files
rm ~/.nanorc
ln -s shdworks/config/.nanorc ~/.nanorc

# ln dircolors config files
rm ~/.dircolors
ln -s shdworks/config/.dircolors ~/.dircolors


