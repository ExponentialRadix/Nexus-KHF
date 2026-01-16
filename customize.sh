#!/system/bin/sh

# Nexus-KHF Installation Script
SKIPUNZIP=0

ui_print "————————————————————————————————"
ui_print "       NEXUS-KHF OPTIMIZER      "
ui_print "       Device: Redmi Note 11    "
ui_print "————————————————————————————————"

# Verificar si es 'spes' o 'spesn'
if [ "$ROOT" != "true" ] && [ "$DEVICE" != "spes" ] && [ "$DEVICE" != "spesn" ]; then
    ui_print "! Dispositivo no compatible detectado"
    ui_print "! Este módulo es exclusivo para SD680 (spes)"
fi

ui_print "- Aplicando parches de Kernel..."
ui_print "- Configurando Kryo 265 Boost..."
ui_print "- Optimizando para Project Infinity-X..."

# Permisos de ejecución para los scripts
set_perm_recursive $MODPATH 0 0 0755 0644
set_perm $MODPATH/service.sh 0 0 0755
set_perm $MODPATH/post-fs-data.sh 0 0 0755

ui_print "- ¡Instalación completada con éxito!"
ui_print "- Reinicia para sentir la fluidez."
