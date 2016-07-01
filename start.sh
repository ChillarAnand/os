#! /bin/sh

echo "Setting up your system. Please wait..."
install_package()
{
    package=$1
    ppa=$2

    if dpkg --get-selections | grep -q "^$package[[:space:]]*install$" >/dev/null;
    then
        echo "$package is already installed"
    else
       if [ "$2" != "" ]; then
           sudo bash -c "add-apt-repository --yes ppa:$ppa > /tmp/foo"
       fi
       sudo bash -c "apt-fast -qq --yes install $package > /tmp/foo"
       echo "$package is installed"
    fi
}


if [ ! -f /usr/sbin/apt-fast ]; then
    echo "Installing apt-fast..."
    # apt-fast
    sudo add-apt-repository --yes ppa:saiarcot895/myppa > /tmp/foo
    sudo apt-get -qq update
    sudo apt-get -qq install --yes apt-fast
    # sudo dpkg-reconfigure apt-fast  # configure
fi



install_package git
git config --global user.name 'chillaranand'
git config --global user.email 'anand21nanda@gmail.com'
echo "git is configured"

if [ ! -d ~/.oh-my-zsh/ ]; then
    install_package zsh
    git clone https://github.com/robbyrussell/oh-my-zsh.git .oh-my-zsh
    rm ~/.zshrc
    ln -s ~/.os/config/zsh/zshrc .zshrc
    chsh -s /usr/bin/zsh $(whoami)
fi
echo "zsh is configured"


if [ ! -d ~/.os/ ]; then
    git clone https://github.com/ChillarAnand/os.git ~/.os
fi
echo "os is cloned"


# salt setup
# python salt/start/setup.py

# shell
install_package byobu byobu/ppa
install_package tmuxinator
# ln -s ~/.

# install packages
install_package unzip
install_package tree
install_package htop
install_package synapse synapse-core/ppa
# rm ~/.config/synapse/config.json
# ln -s ~/projects/ubuntu/os/config/synapse/config.json config.json


# dropbox
if [ ! -f ~/.dropbox-dist/dropboxd ]; then
    cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
    ~/.dropbox-dist/dropboxd
    echo "dropbox is installed"
fi
echo "dropbox is already installed"


# chrome
if [ ! -f /usr/bin/google-chrome ]; then
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
    sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
    install_package google-chrome-stable
    echo "chrome is installed"
fi
echo "chrome is already installed"


# install emacs
if [ ! -f /usr/bin/emacs ]; then
    sudo add-apt-repository --yes ppa:ubuntu-elisp/ppa
    sudo apt-fast -qq --yes install emacs-snapshot emacs-snapshot-el
    git clone https://github.com/chillaranand/.emacs.d.git
fi
echo "emacs is installed"


# usual software

# android connect
install_package mtpfs

# manage clipboards
install_package clipit

# music player
install_package clementine
# install_package banshee banshee-team/ppa

install_package compizconfig-settings-manager
install_package compiz-plugins-extra
install_package dconf-tools

# essentials
# sudo apt-get install --yes -qq build-essential libevent-dev
# sudo apt-get install --yes -qq libncurses5-dev gcc libffi-dev
# sudo apt-get install --yes -qq libxml2-dev libxslt1-dev libssl-dev
# sudo apt-get install -yqq libpq-dev libjpeg-dev libblas-dev liblapack-dev libatlas-base-dev gfortran

# posgres
# sudo apt-get install -y -qq postgresql postgresql-contrib


# python
install_package python-dev
install_package python3-dev
# echo "Updating pip and python packages..."
# sudo pip install --upgrade pip -q
# sudo pip install virtualenvwrapper -q
# sudo pip install pandas numpy jupyter matplotlib scipy


# paper theme
# sudo rf /usr/share/themes/Paper
# sudo rf ~/.local/share/themes/Paper
# git clone https://github.com/snwh/paper-gtk-theme.git ~/sandbox/paper-gtk-theme
# cd ~/sandbox/paper-gtk-theme/
# ./install-gtk-theme.sh
# gsettings reset org.gnome.desktop.interface gtk-theme
# gsettings reset org.gnome.desktop.wm.preferences theme
# gsettings set org.gnome.desktop.interface gtk-theme "Paper"
# gsettings set org.gnome.desktop.wm.preferences theme "Paper"

rm -rf ~/.config/autostart/
ln -s ~/.os/config/autostart/ ~/.config/autostart/
