#!/usr/bin/env bash
set -euo pipefail

if [ -p /tmp/bright ]; then
    true
else
    mkfifo /tmp/bright && echo "$(busctl call org.clightd.clightd /org/clightd/clightd/Backlight org.clightd.clightd.Backlight Get \"s\" \"\" | awk '{print $3*100}')" > /tmp/bright
fi

script_name="eww_bright.sh"
for pid in $(pgrep -f $script_name); do
    if [ $pid != $$ ]; then
        kill -9 $pid
    fi 
done

start=$SECONDS

eww_wid="$(xdotool search --name 'Eww - bright' || true)"

if [ ! -n "$eww_wid" ]; then
    eww open bright
fi

case $1 in
up)
	sudo light -A 10
    echo "sudo light -G " > /tmp/bright
	label=""
	;;
down)
	# busctl call org.clightd.clightd /org/clightd/clightd/Backlight org.clightd.clightd.Backlight LowerAll "d(bdu)s" 0.05 0 0 0 ""
    sudo light -U 10
    x = $(sudo light -G)
    echo $x
    echo "sudo light -G " > /tmp/bright
	label=""
	;;
esac 
while [ -n "$eww_wid" ]; do
    duration=( $SECONDS - $start )
    if [[ $duration -gt 1 ]]; then
        eww close bright
        eww_wid="$(xdotool search --name 'Eww - bright' || true)"       
    fi
    sleep 0.2
done
