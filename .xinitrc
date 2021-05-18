xrandr --output eDP1 --mode 1920x1080  --output HDMI1 --right-of eDP1  --mode 1920x1080 --rate 75.00 &
aslstatus &
feh --bg-fill ~/Pictures/screenshots/porco2.png &
# i need my zoomer lights
ckb-next -b &
#notification daemon
dunst &
clipmenud &
setxkbmap -option caps:escape &
#xcompmgr &
#xautolock -time 10 -locker '/home/sl4m/Documents/scripts/lock.sh'
# Hides the mouse cursor after 3 seconds of inactivity
unclutter -idle 3 &
xrdb ~/.Xresources &
# stop x from blanking
xset s off -dpms &
# Saving a dwm log
exec dwm > ~/.dwm.log
