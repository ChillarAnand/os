#! /bin/sh

cd
mkdir -p projects/ubuntu
cd projects/ubuntu

sudo apt-get install --yes git
git config --global user.name 'chillaranand'
git clone https://github.com/ChillarAnand/os.git


# salt
./salt/start/master.sh
./salt/start/minion.sh
