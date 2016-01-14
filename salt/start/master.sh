sudo apt-get --yes -q install python-software-properties
wget https://bootstrap.saltstack.com -O install_salt.sh
sudo sh install_salt.sh -P
sudo apt-get --yes -q install salt-master

# sudo apt-get --yes -q install python-software-properties
# sudo add-apt-repository --yes -q ppa:saltstack/salt
# sudo apt-get --yes -q update
# sudo apt-get --yes -q install salt-master
