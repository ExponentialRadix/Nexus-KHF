#!/system/bin/sh
# Nexus-KHF Cleanup

# Reactivar los servicios de Xiaomi que detuvimos
start mi_thermald
start thermal-engine

# Restaurar valores por defecto del kernel
echo 1 > /sys/module/lowmemorykiller/parameters/enable_lmk
echo "schedutil" > /sys/devices/system/cpu/cpufreq/policy0/scaling_governor
echo "schedutil" > /sys/devices/system/cpu/cpufreq/policy4/scaling_governor

ui_print "- Nexus-KHF: Configuraciones revertidas."
