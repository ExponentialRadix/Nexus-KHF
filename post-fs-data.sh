#!/system/bin/sh
MODPATH=${0%/*}

# ZRAM 2.85GB LZ4
echo lz4 > /sys/block/zram0/comp_algorithm
echo 2885238784 > /sys/block/zram0/disksize

# Latencia de Kernel 1ms
echo 1000000 > /proc/sys/kernel/sched_latency_ns

# I/O Scheduler: Aplicar a todos los bloques disponibles
for queue in /sys/block/*/queue/scheduler; do
    [ -f "$queue" ] && echo "none" > "$queue" 2>/dev/null
done
