sudo apt-get install --yes unzip tree htop byobu

# install emacs
sudo apt-get install build-essential
sudo apt-get build-dep emacs24
cd /tmp
wget http://ftp.gnu.org/gnu/emacs/emacs-24.5.tar.xz
tar -xf emacs*
cd emacs-24.5
./configure
make
sudo make install


# config
cd
git clone https://github.com/chillaranand/.emacs.d.git


cd -3
