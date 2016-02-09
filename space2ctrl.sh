cd ~/projects/ubuntu


# install xcape
if [ ! -f xcape/xcape ]; then
    sudo apt-get install --yes git gcc make pkg-config libx11-dev libxtst-dev libxi-dev
    git clone https://github.com/alols/xcape.git
    cd xcape
    make
    sudo make install
    cd ..
    echo "xcape installed"
fi


# reset kbd, xcape
setxkbmap -layout us
pkill xcape


# use space as space/ctrl
spare_modifier="Hyper_L"
xmodmap -e "keycode 65 = $spare_modifier"
xmodmap -e "remove mod4 = $spare_modifier" # hyper_l is mod4 by default
xmodmap -e "add Control = $spare_modifier"
xmodmap -e "keycode any = space"
xcape -e "$spare_modifier=space"

echo "Activated space modifier..."
