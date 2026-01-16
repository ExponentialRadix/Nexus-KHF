#!/system/bin/sh
# Nexus-KHF - Pre-Boot Tweaks

# Desactivar el Thermal Core de Xiaomi (previene bajones de FPS por calor moderado)
stop mi_thermald
stop thermal-engine

# Eliminar límites de memoria de procesos pesados
echo 0 > /sys/module/lowmemorykiller/parameters/enable_lmk
