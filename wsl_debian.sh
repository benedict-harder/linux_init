#!/bin/bash

apt update
apt upgrade -y

# packages
apt install git texlive-full python3 python3-pip python3-venv neofetch lf curl -y

# I use this to make the command prompt look a bit nicer, completely optional
echo 'export PS1="\[$(tput bold)\]\[\033[38;5;10m\]\u@\h:\[$(tput sgr0)\] \[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;27m\]\W\[$(tput sgr0)\] \[$(tput bold)\]\\$ \[$(tput sgr0)\]"' >> $HOME/.bashrc

# insert aliases here
echo "alias ll=\"ls -la\"" >> $HOME/.bashrc
echo "repos=\"cd /mnt/c/dev/repos\"" >> $HOME/.bashrc 
echo "exe=\"explorer.exe\"" >> $HOME/.bashrc # shortcut for windows explorer


# reload the bash config
sh $HOME/.bashrc

mkdir $HOME/repos

# git configuration, change accordingly
git config --global user.name "Benedict Harder"
git config --global user.email "benedict.harder@tum.de"
git config --global core.editor nano # can also be replaced by code, or other editors

## SSH RSA key generation (with no passphrase)
ssh-keygen -t rsa -b 2048 -C "debian_wsl" -f $HOME/.ssh/id_rsa -q -N ""

# removes unnecessary dependencies, optional
apt autoremove -y
