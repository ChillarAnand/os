#! /bin/sh

cd

sudo apt-get install --yes git
sudo apt-get install --yes byobu
sudo apt-get install --yes zsh

git config --global user.name 'chillaranand'
git clone https://github.com/robbyrussell/oh-my-zsh.git .oh-my-zsh
git clone https://github.com/ChillarAnand/.custom-zsh.git .custom-zsh
ln -s .custom-zsh/zshrc .zshrc
chsh -s /usr/bin/zsh anand



mkdir -p projects/ubuntu
cd projects/ubuntu


# install s2ctrl
# sudo apt-get install libx11-dev libxtst-dev --yes
# git clone https://github.com/r0adrunner/Space2Ctrl.git
# cd Space2Ctrl
# make
# sudo make install
# ./s2cctl start
# cd ..


# install xcape
sudo apt-get install git gcc make pkg-config libx11-dev libxtst-dev libxi-dev
git clone https://github.com/alols/xcape.git
cd xcape
make
sudo make install
cd ..
./space2ctrl.sh


# salt setup
git clone https://github.com/ChillarAnand/os.git
cd os
git pull origin master
python salt/start/setup.py
