xrandr -s 1920x1080 &
slstatus &
feh --bg-scale ~/Downloads/MysticHorizon.jpg &
# Hides the mouse cursor after 3 seconds of inactivity
unclutter -idle 3 &
xrdb -merge ~/.Xresources &
# Saving a dwm log
exec dwm > ~/.dwm.log
