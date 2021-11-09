#!/usr/bin/env bash
set -euo pipefail

#lock() {
#    i3lock -n -c 242831ff -i ~/Pictures/lock_background3.png -t -e \
#        --indicator --force-clock --pass-media-keys --pass-power-keys --pass-volume-keys \
#        --insidevercolor=2e3440A8 --insidewrongcolor=2e3440A8 --insidecolor=2e344000 --ringwrongcolor=bf616a \
#        --ringcolor=81a1c1 --ringvercolor=88c0d0 --line-uses-inside --keyhlcolor=b48ead --bshlcolor=bf616a \
#        --separatorcolor=81a1c1 --verifcolor=88c0d0 --wrongcolor=bf616a --indpos="w/6:h/2-200" --timecolor=e5e9f0 \
#        --timepos="w/6:h/2+50" --timestr="%I:%M %p" --datecolor=e5e9f0 --time-font="FiraCode Nerd Font" \
#        --date-font="FiraCode Nerd Font" --verif-font="FiraCode Nerd Font" --wrong-font="FiraCode Nerd Font" \
#        --greeter-font="FiraCode Nerd Font" --greetertext="$USER" --greetercolor=e5e9f0 --greeterpos="w/6:h/2-10" \
#        --radius 120 --ring-width 3 --greetersize=36
#}

cachepath=$HOME/.cache/lockscreen
cropuser=$cachepath/$USER-pic-crop.png

width=3840       #$(xrandr --query | grep ' connected' | grep -o '[0-9][0-9]*x[0-9][0-9]*[^ ]*' | sed -r 's/^[^0-9]*([0-9]+x[0-9]+).*$/\1/' |cut -d "x" -f 1 |head -n1)
height=2160    #$(xrandr --query | grep ' connected' | grep -o '[0-9][0-9]*x[0-9][0-9]*[^ ]*' | sed -r 's/^[^0-9]*([0-9]+x[0-9]+).*$/\1/' |cut -d "x" -f 2 |head -n1)
half_width=$((width/2))
half_height=$((height/2))

cropuser() {
  userpic=~/Pictures/barbarossaCircle.png

	convert $userpic -resize 174x174 -gravity Center \( \
		-size 174x174 xc:Black \
		-fill White \
		-draw "circle 87 87 87 1" \
		-alpha Copy\
		\) -compose CopyOpacity -composite -trim $cropuser
}

blurbg() {
    maim -u "$cachepath/screenshot.png"
	convert "$cachepath/screenshot.png" \
		-filter Gaussian \
		-blur 0x27 \
		"$cachepath/screenshot-blur.png"
}

genbg() {
	if [[ ! -d $HOME/.cache/lockscreen ]]; then
		mkdir $HOME/.cache/lockscreen
    cropuser
	fi
	blurbg
	composite -geometry "+$((half_width-87))+$((half_height-138))" $cropuser $cachepath/screenshot-blur.png $cachepath/screenshot-pic-blur.png
}

lock() {
    i3lock -n -c 24283100  -t -e --datestr="" -i "$cachepath/screenshot-pic-blur.png" \
        --indicator --force-clock --pass-media-keys --pass-power-keys --pass-volume-keys \
        --insidevercolor=2e3440A8 --insidewrongcolor=2e3440A8 --insidecolor=2e344000 --ringwrongcolor=bf616a \
        --ringcolor=81a1c1 --ringvercolor=88c0d0 --line-uses-inside --keyhlcolor=b48ead --bshlcolor=bf616a \
        --separatorcolor=81a1c1 --verifcolor=88c0d0 --wrongcolor=bf616a --indpos="w/2:h/2-30" --timecolor=e5e9f0 \
        --timepos="w/2:h/2+55" --timestr="%I:%M %p" --datecolor=e5e9f0 --time-font="FiraCode Nerd Font" \
        --date-font="FiraCode Nerd Font" --verif-font="FiraCode Nerd Font" --wrong-font="FiraCode Nerd Font" \
        --greeter-font="FiraCode Nerd Font:style=Bold" --greetertext="$USER" --greetercolor=8fbcbb --greeterpos="w/2:h/2+40" \
        --radius 50 --ring-width 3 --greetersize=14 --timesize=12 --verifsize=10 --wrongsize=10  --modsize=9 --modifpos="w/2:h/2-15" #--no-verify
}

#-i ~/Pictures/background_lock2.png
status=$(playerctl status)

genbg
if [ "$status" == "Playing" ]; then
	playerctl pause
fi
dunstctl set-paused true
lock || lockscreen.sh
if [ "$status" == "Playing" ]; then
	playerctl play
fi
dunstctl set-paused false
