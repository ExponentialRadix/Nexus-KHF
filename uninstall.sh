#!/system/bin/sh
stop vendor.thermal-engine
umount -l /vendor/etc/thermal-engine.conf
start vendor.thermal-engine
