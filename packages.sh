sudo apt-get install --yes -qq build-essential python3-dev libevent-dev
sudo apt-get install --yes -qq libncurses5-dev gcc libffi-dev
sudo apt-get install --yes -qq libxml2-dev libxslt1-dev libssl-dev
sudo apt-get install -y -qq postgresql postgresql-contrib
sudo apt-get install -yqq libpq-dev libjpeg-dev
sudo apt-get install -yqq dconf-tools
sudo apt-get install -yqq compizconfig-settings-manager compiz-plugins-extra
sudo apt-fast install -qq --yes python-dev python3-dev
sudo apt-fast -qq --yes install libblas-dev liblapack-dev libatlas-base-dev gfortran

# data
sudo pip install virtualenvwrapper
sudo pip install pandas numpy jupyter matplotlib scipy
