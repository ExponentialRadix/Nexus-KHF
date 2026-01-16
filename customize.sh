#!/sbin/sh
ui_print "--------------------------------------"
ui_print "    NEXUS-KHF EVOLUTION v3.2 UNIFIE   "
ui_print "    Soporte: Magisk & KernelSU        "
ui_print "--------------------------------------"

# Determinar entorno de forma simple
ENV="Magisk"
[ "$KSU" = "true" ] && ENV="KernelSU"
ui_print "- Entorno: $ENV detectado"

# Extraer componentes
ui_print "- Extrayendo archivos..."
unzip -o "$ZIPFILE" 'system/*' -d "$MODPATH" >&2
unzip -o "$ZIPFILE" 'webroot/*' -d "$MODPATH" >&2

# Aplicar permisos
ui_print "- Configurando permisos..."
set_perm_recursive "$MODPATH" 0 0 0755 0644
set_perm "$MODPATH/post-fs-data.sh" 0 0 0755
set_perm "$MODPATH/service.sh" 0 0 0755
set_perm "$MODPATH/system/bin/nexus_check" 0 2000 0755

ui_print "--------------------------------------"
ui_print " INSTALACIÓN FINALIZADA "
ui_print "--------------------------------------"
