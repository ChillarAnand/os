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

git clone https://github.com/ChillarAnand/os.git
cd os
git pull origin master


# salt
python salt/start/setup.py
