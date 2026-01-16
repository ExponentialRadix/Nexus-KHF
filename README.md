# 🚀 Nexus-KHF Optimizer [SD680]

![Device](https://img.shields.io/badge/Device-Xiaomi_Redmi_Note_11-orange?style=for-the-badge&logo=xiaomi)
![Chipset](https://img.shields.io/badge/SoC-Snapdragon_680-blue?style=for-the-badge&logo=qualcomm)
![KernelSU](https://img.shields.io/badge/Support-KernelSU_/_Magisk-green?style=for-the-badge)

**Nexus-KHF** es un módulo de bajo nivel diseñado específicamente para exprimir el potencial del **Snapdragon 680 (Kryo 265)**. Olvida los retardos y el thermal throttling agresivo. Este módulo reescribe la gestión de energía y el renderizado para ofrecer una experiencia fluida en juegos y una interfaz ultra-rápida en **Project Infinity-X**.

---

## 🛠️ Características Principales

### 🏎️ Dynamic Engine (CPU & GPU)
- **Kryo Boost:** Ajuste de latencia en el gobernador `schedutil` para una respuesta inmediata.
- **Input Boost:** Aumento dinámico de frecuencia (1.5GHz) solo al tocar la pantalla para ahorrar batería en reposo.
- **Adreno 610 Force:** Optimización del bus de la GPU para mantener FPS estables en carga pesada.

### 🎮 Gaming & Smoothness
- **Stutter Filter:** Ajuste de offsets en `SurfaceFlinger` para eliminar micro-tirones visuales.
- **I/O Optimizer:** Lectura anticipada (Read-Ahead) a 1024kb para cargas de juegos más rápidas.
- **TCP Congestion:** Control `Cubic` para un ping más estable en partidas online.

### 🛡️ Thermal & Power
- **Bypass Thermald:** Detiene el motor térmico agresivo de Xiaomi para evitar caídas de FPS a los 10 minutos de juego.
- **Low Power Overhead:** Desactivación de logs de kernel (`printk`) para liberar ciclos de CPU.

---

## 📂 Estructura del Módulo

| Archivo | Función |
| :--- | :--- |
| `post-fs-data.sh` | Elimina bloqueos térmicos y limpia logs en el arranque. |
| `service.sh` | Controla los gobernadores de CPU/GPU y memoria. |
| `system.prop` | Optimiza el renderizado y la sensibilidad táctil. |
| `customize.sh` | Instalador inteligente con verificación de dispositivo. |

---

## 📥 Instalación

1. Descarga el `.zip` del módulo.
2. Abre tu gestor de root (**KernelSU**, **Suki** o **Magisk**).
3. Selecciona "Instalar desde almacenamiento" y elige el archivo.
4. Reinicia tu dispositivo.
5. **Nota:** Deja reposar el sistema 30 segundos tras el arranque para que el motor dinámico se calibre.

---

## ⚠️ Advertencia

> **Nexus-KHF** aumenta el límite térmico para maximizar el rendimiento. Se recomienda no jugar bajo luz solar directa o en ambientes extremadamente calurosos para preservar la salud de la batería.

---

## ⚠️ DESCARGO DE RESPONSABILIDAD (DISCLAIMER)

Al instalar este módulo, aceptas que eres el único responsable del uso que le des. 
- **Uso bajo tu propio riesgo:** No me hago responsable por daños físicos al dispositivo, pérdida de datos, pantallas congeladas (bootloops) o desgaste acelerado de la batería.
- **Garantía:** Es probable que la modificación del sistema anule tu garantía.
- **Seguridad:** Aunque el código ha sido revisado, siempre ten una copia de seguridad y el desinstalador de KernelSU/Magisk a mano.

---

## 🤝 Créditos
- **Author:** [ExponentialRadix](https://github.com/ExponentialRadix)
- **Technical Debug:** Gemini AI (Senior Android Dev Mode)
- **Community:** Project Infinity-X & GreenForce Project
