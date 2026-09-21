# Diario de bugs de la herramienta

> Cuando la **cabina** (FLX4 + Mixxx + skins Sinatra) falle durante la práctica: **para, anota aquí, y sigue**. Los bugs se resuelven fuera de la sesión de práctica salvo que bloqueen. Cada bug resuelto mejora Sinatra y alimenta el modo Learn.

## Cómo anotar

```
### #NN · Título corto · AAAA-MM-DD
- Síntoma: qué viste/oíste
- Cómo reproducirlo:
- Contexto: skin (legacy/QML), modo (--developer sí/no), pista, qué tocaste
- Estado: abierto / resuelto / conocido-sin-arreglo
- Solución / workaround:
- Módulo afectado:
```

## Bugs conocidos (resueltos o con workaround)

### #01 · «Invalid sample rate» al abrir la FLX4 · 2026-09-20
- Síntoma: error al aplicar audio en Preferencias → Hardware de sonido.
- Causa: WASAPI exige el sample rate del dispositivo; la FLX4 está a 48000 Hz y Mixxx pedía 44100.
- Estado: **resuelto**. Solución: Frecuencia de muestreo = **48000 Hz**.
- Módulo: M2, M10 (checklist).

### #02 · La skin QML no carga («unavailable outside developer mode») · 2026-09-20
- Síntoma: Mixxx ignora `LateNightQML_Sinatra` y carga otra skin.
- Causa: las skins QML son «developer preview» y solo cargan con `--developer`.
- Estado: **resuelto con workaround**. Solución: arrancar con el lanzador **`Mixxx Sinatra.cmd`** del Escritorio (lleva `--developer`).
- Módulo: todos (arranque).

### #03 · Pantalla negra al copiar una skin legacy · 2026-09-20
- Síntoma: la copia de LateNight cargaba en negro (`Could not open template`).
- Causa: el prefijo `skins:` resuelve solo contra `res/skins` del sistema; una copia en la carpeta de usuario no se auto-referencia con `skins:<copia>/`.
- Estado: **resuelto**. Solución: rutas estructurales a `skins:LateNight/` y solo la QSS propia vía `skin:` (singular).
- Módulo: herramienta.

### #04 · Skin QML: `../../qml` y assets `LateNight/` no encontrados · 2026-09-20
- Síntoma: `MainWindow.qml: "../../qml": no such directory`; miles de `Cannot open ...LateNight/palemoon/...svg`.
- Causa: una skin QML copiada fuera de `res/skins` no encuentra la librería QML compartida ni los SVG del LateNight legacy.
- Estado: **resuelto con workaround**. Solución: junctions `%LOCALAPPDATA%\Mixxx\qml → res/qml` y `%LOCALAPPDATA%\Mixxx\skins\LateNight → res/skins/LateNight`. Pendiente: plan de empaquetado para Learn.
- Módulo: herramienta.

### #05 · Indicador Learn marcaba A 0.0 · B 0.0 · 2026-09-21
- Síntoma: el indicador de BPM igualados leía 0 aunque los decks mostraban BPM.
- Causa: `Mixxx.ControlProxy` creado en `main.qml` antes de `Mixxx.Core.ready` se queda en 0.
- Estado: **resuelto**. Solución: crear los proxies dentro de un `Loader` activo solo con el motor listo. Recarga en caliente: **Ctrl+Shift+R** (developer).
- Módulo: Learn.

### #06 · Diálogo «¿Permitir a Mixxx ocultar la barra de menú?» · 2026-09-20
- Síntoma: diálogo modal al arrancar con una skin recién instalada.
- Estado: **conocido, no es bug**. Responder **No** (mantener el menú). Aparece una vez por skin.

## Bugs abiertos

(ninguno todavía — aquí irán los que encontremos practicando)

## Ideas para Learn que salen de los bugs

- Un **checklist de arranque** automático en la cabina (sample rate, skin, controladora detectada) evitaría #01 y #02 a cualquier alumno.
- El indicador de BPM igualados (#05) es el primer checkpoint de Learn: extenderlo a «estás en el 1», «intercambio de graves en el 1», «loop en múltiplo de 4».
