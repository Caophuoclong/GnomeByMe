#!/usr/bin/env bash
set -euo pipefail

## Non-qtile specific settings
#xset s 600 0
xset s 0 0
xset dpms 0 0 0
xset r rate 440 50
#xset +fp /home/phuoclong/.fonts 
xsetroot -cursor_name left_ptr &
#numlockx &

#~/.config/bspwm/phicom2 --experimental-backends --config ~/.config/bspwm/phicom.conf &
picom --experimental-backends &
#/usr/lib/geoclue-2.0/demos/agent &
/usr/lib/mate-polkit/polkit-mate-authentication-agent-1 &
dunst &
unclutter &
bluetoothctl power off &
#blueberry-tray &
greenclip daemon &
#idle.sh 7 screensaver &
#light-locker --lock-after-screensaver=0 --no-lock-on-suspend --no-lock-on-lid --no-idle-hint &
#xidlehook --not-when-fullscreen --not-when-audio --timer 420 'screensaver' '' --timer 180 'xset dpms force off; lockscreen.sh' '' &
mkfifo /tmp/vol && echo "$(pulsemixer --get-volume | awk '{print $1}')" > /tmp/vol & 
mkfifo /tmp/vol-icon && ~/.config/qtile/eww_vol_icon.sh mute &
#redshift-gtk -l 10.832600:106.658100 &
#udiskie &
# feh-blur --darken 0 -b 6 &
eww daemon
sleep 2
eww open border &
eww open border1 &
eww open border2 &
#blurwal --backend feh -m 1 -b 30 -s 15 &
