#!/system/bin/sh
instantCamera_enable=`getprop persist.asus.instant_camera | tr -d '\r'`
LOG_TAG="init.asus.keycamera.sh"

if [ "$instantCamera_enable" == "1" ]; then
/system/bin/log -t $LOG_TAG -p e "enable"
echo "114" > /sys/devices/soc.0/gpio_keys.66/enabled_wakeup
echo "115" > /sys/devices/soc.0/gpio_keys.66/enabled_wakeup
elif [ "$instantCamera_enable" == "0" ]; then
/system/bin/log -t $LOG_TAG -p e "disable"
echo "114" > /sys/devices/soc.0/gpio_keys.66/disabled_wakeup
echo "115" > /sys/devices/soc.0/gpio_keys.66/disabled_wakeup
else
/system/bin/log -t $LOG_TAG -p e "error"
exit 0
fi
