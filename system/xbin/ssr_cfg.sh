#!/system/bin/sh

# persist.sys.modem.restart
# 1:UI 2:ramdump 4:modem 8:wcnss 16:venus
#

prop=`getprop persist.sys.modem.restart`

restartlevel=$(($prop & 28))
dump=$((($prop & 2) / 2))

case $restartlevel in
  "4")
  setprop persist.sys.ssr.restart_level "modem"
  ;;
  "8")
  setprop persist.sys.ssr.restart_level "wcnss"
  ;;
  "16")
  setprop persist.sys.ssr.restart_level "venus"
  ;;
  "12")
  setprop persist.sys.ssr.restart_level "modem wcnss"
  ;;
  "20")
  setprop persist.sys.ssr.restart_level "modem venus"
  ;;
  "24")
  setprop persist.sys.ssr.restart_level "wcnss venus"
  ;;
  "28")
  setprop persist.sys.ssr.restart_level "ALL_ENABLE"
  ;;
  *)
  setprop persist.sys.ssr.restart_level "ALL_DISABLE"
  ;;
esac

if [ ${dump} -ne 0 ]; then
	setprop persist.sys.ssr.enable_ramdumps 1
else
	setprop persist.sys.ssr.enable_ramdumps 0
fi
