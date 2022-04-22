#!/system/bin/sh
LOG_TAG="save-hcidump"
LOG_NAME="${0}:"

hcidump_pid=""

loge ()
{
  /system/bin/log -t $LOG_TAG -p e "$LOG_NAME $@"
}

logi ()
{
  /system/bin/log -t $LOG_TAG -p i "$LOG_NAME $@"
}

failed ()
{
  loge "$1: exit code $2"
  exit $2
}

start_hcidump ()
{
      log_folder=`readlink -f /data/logcat_log`
      log_file=`readlink -f /data/logcat_log/btsnoop_hci.log`
      log_rename=/data/logcat_log/btsnoop_hci.log_`date +%m_%d_%H_%M_%S`

      logi "log_folder status:$log_folder"
      case "$log_folder" in
          "/data/logcat_log")
          logi "/data/logcat_log dir already exist"
          ;;
      esac

      case "$log_folder" in
          "")
          logi "/data/logcat_log dir not exist"
          ;;
      esac


      case "$log_file" in
           "/data/logcat_log/btsnoop_hci.log")
           logi "btsnoop already existed , rename old btsnoop at now time `date +%m_%d_%H_%M_%S`"
           logi "rename btsnoop log to : $log_rename"
           mv /data/logcat_log/btsnoop_hci.log $log_rename
           ;;
      esac

      logi "start record btsnoop at time : `date +%m_%d_%H:%M:%S`"
      setprop debug.bluetooth.btsnoop true
      chmod 777 /data/logcat_log

      while true; do
      done

      hcidump_pid=$!
      logi "start_hcidump: pid = $hcidump_pid"
}

#fix BLUETOOTH_ENABLE to 1
BLUETOOTH_ENABLE="1"

case $BLUETOOTH_ENABLE in
    1)
        logi "try to start hcidump"
        start_hcidump

        wait $hcidump_pid
        logi "hcidump stopped"
     ;;
     *)
        logi "bluetooth not enabled"
        failed "bluetooth not enabled" -1
     ;;
esac

exit 0
