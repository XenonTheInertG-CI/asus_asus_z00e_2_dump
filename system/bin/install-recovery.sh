#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/bootdevice/by-name/recovery:11051008:831f01f2c7b7cf2fd5d920b12cc13c8db075d29a; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/bootdevice/by-name/boot:10397696:36a7bcd0eba9feb9d7d2310a7422c939f6abcd4c EMMC:/dev/block/bootdevice/by-name/recovery 831f01f2c7b7cf2fd5d920b12cc13c8db075d29a 11051008 36a7bcd0eba9feb9d7d2310a7422c939f6abcd4c:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
