#! /bin/sh

install_package()
{
    package=$1
    ppa=$2
    if [ "$2" != "" ]; then
        echo 'f'
        sudo add-apt-repository --yes ppa:$ppa > /tmp/foo
    fi
    sudo apt-fast -qq --yes install $package > /tmp/foo
    echo "$package is installed \n\n"
}

if [ ! -f /usr/sbin/apt-fast ]; then
    echo "Installing apt-fast..."
    # apt-fast
    sudo add-apt-repository --yes ppa:saiarcot895/myppa > /tmp/foo
    sudo apt-get -qq update
    sudo apt-get -qq install --yes apt-fast
    # sudo dpkg-reconfigure apt-fast  # configure
fi

install_package zsh
