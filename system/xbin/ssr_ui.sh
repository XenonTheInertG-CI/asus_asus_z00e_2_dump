#!/system/bin/sh

if [ $# -ne 1 ]; then
  echo "Usage $0 [0..3]"
  exit
fi

if [ $1 -gt 5 -o $1 -lt 0 ]; then
  echo "Usage $0 [0..3]"
  exit
fi

prop=`getprop persist.sys.modem.restart`
showui=$(($prop & 1))

if [ $showui -eq 1 ]; then
  ui_type=$(($1 & 1))
  if [ ${ui_type} -eq 0 ]; then
    am start -a com.asus.ssr.ui --ei type $1 -n com.asus.eehui/.ModemRestartActivity &
  else
    am start -a com.asus.ssr.ui --ei type $1 -n com.asus.eehui/.ModemRestartActivity &
  fi
fi
