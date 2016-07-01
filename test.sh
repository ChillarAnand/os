#! /bin/sh



install_package()
{
    package=$1
    ppa=$2
    # if []; then
    #     echo "$package is already installed \n\n"

    # else

    #     if [ "$2" != "" ]; then
    #         sudo add-apt-repository --yes ppa:$ppa > /tmp/foo
    #     fi
    #     sudo apt-fast -qq --yes install $package > /tmp/foo
    #     echo "$package is installed \n\n"

    # fi
}

install_package zsh
install_package zsho
