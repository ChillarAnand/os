sudo apt-fast install -qq --yes python-dev python3-dev

# data
pip install pandas numpy jupyter matplotlib

# scipy
sudo apt-fast -qq --yes install libblas-dev liblapack-dev libatlas-base-dev gfortran
pip install scipy
