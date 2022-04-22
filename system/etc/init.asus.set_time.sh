#!/system/bin/sh

sleep 5
current_year=$(date +%Y)

if [ "${current_year}" -gt 2000 ] && [ -f /data/set_time ]; then
	setprop persist.asus.set_default_time 1
fi

if [ "${current_year}" -gt 2000 ] && [ -f /data/set_time_file/set_time ]; then
        setprop persist.asus.set_default_time 1
fi

set_default_time=`getprop persist.asus.set_default_time`

if [ "${set_default_time}" != 1 ];then
	date 0101000015.00
        setprop persist.asus.set_default_time 1
	
elif [ "${current_year}" -lt 1980 ]; then
	date 0101000015.00
fi
