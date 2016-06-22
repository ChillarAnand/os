#! /bin/sh

echo "Setting up your system. Please wait..."
install_package()
{
    if [ "$1" ]; then
       package=$1
       ppa=$2
       if [ "$2" != "" ]; then
           sudo bash -c "add-apt-repository --yes ppa:$ppa > /tmp/foo"
       fi
       sudo bash -c "apt-fast -qq --yes install $package > /tmp/foo"
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

# install packages
install_package unzip
install_package tree
install_package htop
install_package byobu byobu/ppa
install_package synapse synapse-core/ppa
# rm ~/.config/synapse/config.json
# ln -s ~/projects/ubuntu/os/config/synapse/config.json config.json


# dropbox
if [ ! -f ~/.dropbox-dist/dropboxd ]; then
    cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
    ~/.dropbox-dist/dropboxd
fi


# chrome
if [ ! -f /usr/bin/google-chrome ]; then
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
    sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
    install_package google-chrome-stable
fi
echo "chrome is installed"


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
install_package clipit
