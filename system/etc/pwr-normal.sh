#!/system/bin/sh

cabc=0

echo $cabc > /proc/driver/cabc
setprop persist.asus.inoutdoor 0
setprop persist.asus.power.mode normal
