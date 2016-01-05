#! /bin/sh

nohup /usr/bin/synapse -s &
nohup /usr/bin/clementine &
nohup /usr/bin/emacs &
nohup /usr/bin/google-chrome &
nohup gnome-terminal -x sh -c "/usr/bin/byobu -S boot-time;"
