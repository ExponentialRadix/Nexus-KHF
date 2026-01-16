#!/system/bin/sh
MODPATH=${0%/*}

# Esperar a que el sistema inicie
until [ "$(getprop sys.boot_completed)" -eq 1 ]; do sleep 5; done
sleep 15

# 1. FORZAR I/O SCHEDULER 'NONE' (Nuevamente para evitar que el sistema lo cambie)
for q in /sys/block/*/queue/scheduler; do
    [ -f "$q" ] && echo "none" > "$q" 2>/dev/null
done

# 2. DESACTIVAR LOGS (Para pasar a [✔])
echo "0" > /proc/sys/kernel/printk

# 3. SWAPPINESS 100
echo 100 > /proc/sys/vm/swappiness

# 4. MONTAJE TÉRMICO CON FIRMA
stop vendor.thermal-engine
umount -l /vendor/etc/thermal-engine.conf >/dev/null 2>&1
# Asegurarse de que el archivo tenga la firma para el check
sed -i '1i # NEXUS-KHF' "$MODPATH/system/vendor/etc/thermal-engine.conf"
mount -o bind "$MODPATH/system/vendor/etc/thermal-engine.conf" /vendor/etc/thermal-engine.conf
start vendor.thermal-engine
