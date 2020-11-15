#xrandr -s 1920x1080 &
xrandr --output eDP1  --mode 1920x1080 --output HDMI1 --right-of eDP1 --mode 1920x1080
slstatus &
feh --bg-scale ~/Pictures/mh.png &
ckb-next &
bash -c "./home/sl4m/Documents/scripts/startspotifyd.sh" &
# Hides the mouse cursor after 3 seconds of inactivity
unclutter -idle 3 &
xrdb -merge ~/.Xresources &
# Saving a dwm log
exec dwm > ~/.dwm.log
