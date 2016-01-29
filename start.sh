#! /bin/sh

install_package()
{
    package=$1
    ppa=$2
    if [ -z $2 ]; then
        sudo add-apt-repository --yes ppa:$ppa > /tmp/foo
    fi
    sudo apt-fast -qq --yes install $package
    echo "$package is installed \n\n"
}

cd

if [ ! -f /usr/sbin/apt-fast ]; then
    echo "Installing apt-fast..."
    # apt-fast
    sudo add-apt-repository --yes ppa:saiarcot895/myppa > /tmp/foo
    sudo apt-get -qq update
    sudo apt-get -qq install --yes apt-fast
    # sudo dpkg-reconfigure apt-fast  # configure
fi

install_package zsh
install_package git

# install byobu
install_package byobu byobu/ppa


git config --global user.name 'chillaranand'
git config --global user.name 'anand21nanda@gmail.com'

git clone https://github.com/robbyrussell/oh-my-zsh.git .oh-my-zsh || echo "Cloned oh-my-zsh"
git clone https://github.com/ChillarAnand/.custom-zsh.git .custom-zsh || cd .custom-zsh; git pull origin master; cd ; echo "Cloned custom-zsh"
rm .zshrc
ln -s .custom-zsh/zshrc .zshrc
chsh -s /usr/bin/zsh anand


mkdir -p projects/ubuntu
cd projects/ubuntu


git clone https://github.com/ChillarAnand/os.git
cd os
git pull origin master

# salt setup
# python salt/start/setup.py

# run scripts
./basics.sh
