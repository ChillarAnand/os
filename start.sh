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


# install xcape
sudo apt-get install git gcc make pkg-config libx11-dev libxtst-dev libxi-dev
git clone https://github.com/alols/xcape.git
cd xcape
make
sudo make install
cd ..



git clone https://github.com/ChillarAnand/os.git
cd os
./space2ctrl.sh  # activate
git pull origin master

# salt setup
python salt/start/setup.py

# run scripts
./basics.sh
