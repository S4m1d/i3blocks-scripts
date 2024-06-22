#!/bin/bash
# to understand formatting of output, see reference(format topic): https://vivien.github.io/i3blocks/#_getting_started
BAT_INFO_STR=$(acpi -b)
BAT_PERC=$(echo $BAT_INFO_STR | grep -o -E '[0-9][0-9]?[0-9]?%')
BAT_CHARGING=$(echo $BAT_INFO_STR | grep -o -E 'Discharging|Charging|Full' | cut -c1)
#full text
echo "[BAT}: $BAT_PERC ($BAT_CHARGING)"
#set short text
echo "B:$BAT_PERC,$BAT_CHARGING"
#set font color
echo "#FFFFFF"
#set red background color if battery level is less or equal to 30%
#parameter expansion is used here to cut percent sign
[ ${BAT_PERC%?} -le 30 ] && echo "#FF0000"
#if battery level is less than 5%, set urgent flag in i3bar by sending 33 exit code
[ ${BAT_PERC%?} -le 5 ] && exit 33
exit 0
