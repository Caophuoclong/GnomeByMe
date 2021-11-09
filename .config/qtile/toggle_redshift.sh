#!/usr/bin/env bash
set -euo pipefail

if pidof redshift; then
    pkill redshift
    notify-send -u normal -a Redshift -t 3000 -i /usr/share/icons/Nord-Icon/48x48/apps/redshift.svg "Redshift disabled"
else
    redshift-gtk -l 10.832600:106.658100 &
    notify-send -u normal -a Redshift -t 3000 -i /usr/share/icons/Nord-Icon/48x48/apps/redshift.svg "Redshift enabled"
fi
