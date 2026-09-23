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

### #07 · La consola no responde: indicador MIDI parpadeando · 2026-09-23
- Síntoma: **con Mixxx abierto**, Windows ve la FLX4 (audio + MIDI **OK**) pero **ningún control** llega al software, y el indicador **MIDI / Bluetooth** (centro, entre los medidores) **parpadea** en vez de quedarse fijo.
- ⚠️ **Ojo, no confundir:** con Mixxx **cerrado** ese parpadeo es **normal** — significa «ningún software de DJ me ha abierto todavía». Solo es síntoma si Mixxx está abierto. (Verificado el 2026-09-23: recién reiniciada la máquina parpadeaba; al lanzar Mixxx se quedó fija y el `MidiEndpoint` apareció en Windows.)
- Cómo reproducirlo: arrancar Mixxx con la FLX4 en modo Bluetooth (móvil emparejado), o arrancar Mixxx **antes** de que la consola esté lista.
- Causa: la FLX4 manda sus controles **o por USB o por Bluetooth**, no por los dos. Además Mixxx solo enumera dispositivos MIDI **al arrancar**.
- Estado: **resuelto con workaround**.
- Solución: (1) apagar el Bluetooth del móvil / desconectar la FLX4 desde él; (2) cerrar Mixxx; (3) apagar la FLX4, esperar 10 s, encenderla **sin** tocar el botón de Bluetooth; (4) abrir con `Mixxx Sinatra.cmd`. **Verificación:** la luz MIDI debe quedarse **fija**; en el log aparece SysEx saliente periódico hacia `DDJ-FLX4`.
- Módulo afectado: M0a (§2.7 leer las luces), M10 §4.


### #08 · El ∩ MIX físico no llega a MST · 2026-09-23
- Síntoma: girando el **∩ MIX** de la consola, `CUE` da la preescucha y el centro mezcla las dos — pero el extremo **MST** da **silencio** en vez del máster.
- Cómo reproducirlo: Deck 1 sonando al máster (fader arriba), CUE de canal 2 encendido, y girar el ∩ MIX físico a tope hacia MST.
- Bisección hecha: arrastrando el mando **`MIX` de la pantalla** con el ratón hasta el tope derecho, **sí suena** el máster en el casco. ⇒ el motor de Mixxx está bien; el problema está entre el mando físico y el valor que recibe Mixxx.
- Contexto: skin QML `LateNightQML_Sinatra`, `--developer`, mapping oficial `Pioneer-DDJ-FLX4.midi.xml` (headMix, 14 bits: MSB CC `0x0C` + LSB CC `0x2C`, status `0xB6`). Config verificada: Master→canales 1-2, Auriculares→canales 3-4, `headSplit 0`, 48000 Hz.
- Referencia del cálculo: `src/engine/enginemixer.cpp:388-396` — `pfl = 0.5*(-v+1)`, `main = 0.5*(v+1)`, con `headMix` en [-1, 1]. Con ese cálculo **ningún** valor produce silencio en los dos a la vez, así que el valor que llega no es el esperado.
- **Estado: RESUELTO (2026-09-23) — no era un bug: faltaba pulsar el botón `CUE` de máster.**
- **Causa real:** el `∩ MIX` actúa **a dos niveles a la vez**: (a) manda MIDI a Mixxx (`headMix`) — por eso el ratón funcionaba; y (b) **dentro de la consola** cruza entre la preescucha y la **monitorización del máster de la propia FLX4**, que está **muda** mientras no se pulse el botón **`CUE` de máster** (activo #48, junto al MASTER LEVEL). Al girar el mando físico hacia `MST` se cruzaba hacia un bus apagado → silencio. Con el ratón solo cambiaba lo que Mixxx manda por USB, sin mover el hardware → sonaba.
- **Secuencia correcta** (descubierta por Juan): 1) Deck 1 con el fader arriba; 2) pulsar el **`CUE` de máster** (bajo el MASTER LEVEL) → el máster entra en el casco; 3) pulsar el **CUE del canal** que quieras preescuchar; 4) el `∩ MIX` ya cruza entre los dos. Es la misma lógica que las mesas de club Pioneer (DJM): el `MASTER CUE` es un botón aparte.
- Confirma lo escrito en M0a §2.6: el botón no está en el mapping oficial **porque es una función de hardware**, no porque falte.
- **La contradicción:** con el ratón sobre el mando `MIX` de pantalla, el máster **sí** entra en el casco. Con el mando físico al mismo extremo, **silencio** — pese a que el mando manda el recorrido completo y correcto.
- Medición que lo descartó (con `--controller-debug`, 540 muestras de un barrido limpio): el ∩ MIX recorre **0 → 16383 de 16383 (100%)**, monótono, en la dirección correcta (CUE=0 → MST=16383), con MSB y LSB emparejados. Hardware, mapping y motor: **los tres correctos**.
- Descartado además: los mandos **MASTER LEVEL, ∩ LEVEL y MIC LEVEL** sí mandan MIDI (`0xB6` ctrl `0x05`, `0x08`, `0x0D`) pero **no están en el mapping oficial**, así que Mixxx los ignora. No interfieren con `headMix`.

**Descartado (todo verificado el 2026-09-23):**
| Hipótesis | Cómo se descartó |
|---|---|
| El mando no llega al tope | Medido: recorrido **0 → 16383 de 16383**, monótono, dirección correcta |
| MSB/LSB mal emparejados | En el instante del tope: `ctrl 0x0C val 0x7F` + `ctrl 0x2C val 0x7F`, consecutivos (9 ms) |
| Otro control se dispara a la vez | Log limpio: **ningún** otro mensaje en ±2 s alrededor del tope |
| El valor no llega a Mixxx | El mando **de pantalla** llega al mismo tope a la vez que el físico |
| No hay señal en el máster | **Los altavoces siguen sonando** durante todo el gesto |
| El ∩ LEVEL se roza al girar | Probado: subirlo en el tope MST no devuelve el sonido |
| Culpa de Sinatra (skin QML / `--developer`) | **Mixxx de serie** (skin `LateNight`, sin `--developer`): **mismo comportamiento** |
| MASTER LEVEL / ∩ LEVEL / MIC LEVEL interfieren | Mandan MIDI (`0xB6` ctrl `0x05`, `0x08`, `0x0D`) pero **no están en el mapping**: Mixxx los ignora |

- **Contradicción sin resolver:** según `enginemixer.cpp:388-396`, con `headMix = +1` y el máster sonando, el casco debe recibir **100% del máster**. Ningún valor de ese control puede producir silencio. Y sin embargo lo produce — solo cuando el valor llega por el mando físico, no por el ratón.
- Experimento de los **7 bits**: hecho y **descartado** (mismo comportamiento). Mapping oficial restaurado; los archivos de prueba, borrados.
- *(Propuesta que ya no hace falta)* duplicar el mapping oficial a la carpeta de usuario (**sin tocar `C:\dev\mixxx`**, ADR-001) y cambiar `headMix` de **14 bits** (`fourteen-bit-msb` + `fourteen-bit-lsb`) a **7 bits** (un solo CC, `0x0C`, sin opciones). Si en 7 bits funciona, el problema está en cómo Mixxx compone el valor de 14 bits → candidato a **reportar upstream a Mixxx**.
- No bloquea la práctica: el uso normal (`CUE` y centro) funciona, y el tutorial oficial de rekordbox recomienda el centro.
- Nota del tutorial oficial de rekordbox (paso 12/16): Pioneer recomienda dejar el ∩ MIX **al centro**, no en un extremo. En el uso diario se vive entre **CUE** y **centro**.
- Método que lo resolvió: **bisección** (ratón vs mando físico) → **medición** (`--controller-debug`) → **experimento de control** (mismo hardware en rekordbox). Sirve de plantilla para el próximo bug.
- Módulo afectado: M2 (monitorización).

## Bugs abiertos

(ninguno)

## Ideas para Learn que salen de los bugs

- Un **checklist de arranque** automático en la cabina (sample rate, skin, controladora detectada) evitaría #01 y #02 a cualquier alumno.
- El indicador de BPM igualados (#05) es el primer checkpoint de Learn: extenderlo a «estás en el 1», «intercambio de graves en el 1», «loop en múltiplo de 4».
- El «bug» #08 no era un bug: el alumno no sabía que el `MST` solo suena si hay máster. Learn podría avisarlo en contexto: «estás escuchando el máster y no hay nada sonando al público».
- El caso #08 en una frase: **el alumno no podía saber que existía un botón imprescindible.** Learn debería detectar «estás en MST y el CUE de máster está apagado» y decírtelo. Es un checkpoint perfecto.
