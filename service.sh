#!/system/bin/sh
# Nexus-KHF - Dynamic Performance Engine
# Optimización específica para spes (SD680)

sleep 40 # Esperar a que el sistema termine el boot completo

# [1] GESTIÓN DE NÚCLEOS (KRYO 265)
# Ajuste de latencia para respuesta instantánea al toque
echo 1 > /sys/devices/system/cpu/cpufreq/policy0/schedutil/rate_limit_us
echo 1 > /sys/devices/system/cpu/cpufreq/policy4/schedutil/rate_limit_us

# [2] CPU INPUT BOOST (El secreto de la fluidez)
# Aumenta la frecuencia solo al tocar la pantalla para no gastar batería en reposo
if [ -d /sys/module/cpu_boost ]; then
    echo "0:1324800 4:1516800" > /sys/module/cpu_boost/parameters/input_boost_freq
    echo 120 > /sys/module/cpu_boost/parameters/input_boost_ms
fi

# [3] ADRENO BOOST (GPU Adreno 610)
# Forzamos a la GPU a no bajar de frecuencia demasiado rápido en juegos
echo 1 > /sys/class/kgsl/kgsl-3d0/force_clk_on
echo 1 > /sys/class/kgsl/kgsl-3d0/force_bus_on
echo 1 > /sys/class/kgsl/kgsl-3d0/force_rail_on
echo "msm-adreno-tz" > /sys/class/kgsl/kgsl-3d0/devfreq/governor

# [4] LECTURA ANTICIPADA (Carga de juegos más rápida)
# Optimiza el almacenamiento UFS 2.2 del Redmi Note 11
echo 1024 > /sys/block/mmcblk0/queue/read_ahead_kb
echo 1024 > /sys/block/sda/queue/read_ahead_kb
echo 1024 > /sys/block/sdb/queue/read_ahead_kb

# [5] MEJORA DE RENDERIZADO (SurfaceFlinger)
# Reducimos el jitter en la entrega de frames
setprop debug.sf.early_phase_offset_ns 500000
setprop debug.sf.early_gl_phase_offset_ns 300000
setprop ro.surface_flinger.max_frame_buffer_acquired_buffers 3

# [6] ZRAM & SWAP (Gestión inteligente en Infinity-X)
# No matamos la batería con ciclos de escritura, pero mantenemos la RAM limpia
echo 60 > /proc/sys/vm/swappiness
echo 100 > /proc/sys/vm/vfs_cache_pressure
