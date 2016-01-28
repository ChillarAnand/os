# activate space2ctrl
./space2ctrl.sh

# install packages
install_package unzip
install_package tree
install_package htop

install_package synapse synapse-core/ppa
rm ~/.config/synapse/config.json
ln -s ~/projects/ubuntu/os/config/synapse/config.json config.json



# dropbox
if [ ! -f ~/.dropbox-dist/dropboxd ]; then
    cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
    ~/.dropbox-dist/dropboxd
fi


# chrome
if [ ! -f /usr/local/bin/emacs ]; then
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
    sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
    sudo apt-get update
    sudo apt-get install google-chrome-stable
fi


# install emacs
sudo add-apt-repository --yes ppa:ubuntu-elisp/ppa
sudo apt-fast -qq --yes install emacs-snapshot emacs-snapshot-el

# config
cd
git clone https://github.com/chillaranand/.emacs.d.git



cd projects/ubuntu/os
