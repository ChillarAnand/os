#! /bin/sh

sync_repo()
{
    echo "Syncing " $1
    path=$1
    cd $1
    git pull origin master -q
    git push origin master -q
}

echo "Syncing repos..."
sync_repo '/home/anand/projects/01/'
sync_repo '/home/anand/projects/ubuntu/os/'
sync_repo '/home/anand/.emacs.d/'
sync_repo '/home/anand/.custom-zsh/'
