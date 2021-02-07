xrandr --output eDP1 --mode 1920x1080  --output HDMI1 --right-of eDP1  --mode 1920x1080 --rate 75.00 &
slstatus &
feh --bg-fill ~/Pictures/ny.jpg &
# i need my zoomer lights
ckb-next -b &
setxkbmap -option caps:escape &
# Hides the mouse cursor after 3 seconds of inactivity
unclutter -idle 3 &
xrdb ~/.Xresources &
# stop x from blanking
xset -dpms &
xset s off &
# Saving a dwm log
exec dwm > ~/.dwm.log
