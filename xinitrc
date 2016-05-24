#xrandr --dpi 212
#xbindkeys
#export GDK_SCALE=2
xrandr --output HDMI2 --auto --left-of HDMI1
i3lock -i ~/.wallpaper/lock.png --24
setxkbmap -layout us,ru -option grp:win_space_toggle
feh --bg-fill --randomize ~/.wallpaper/* &
exec i3

