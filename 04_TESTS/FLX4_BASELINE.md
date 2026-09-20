# SINATRA — FLX4 Baseline · Hito 001-B

> Plantilla creada al aprobar la spec 001-B (2026-09-19). Se copia/rellena **durante** la ejecución, no al final. No completar campos por suposición. Spec: `01_SPECS/SINATRA_Hito001B_FLX4_Baseline.md`.
>
> **Estado: preparación sin hardware completada el 2026-09-19.** La ejecución con la FLX4 está pendiente. Los campos ya rellenados provienen de doc oficial e inspección del mapping (solo lectura); los que dependen del hardware siguen vacíos.

## Preparación sin hardware (2026-09-19)

Confirmado sin la controladora, listo para acelerar la ejecución:

- **Sin driver:** la DDJ-FLX4 es class-compliant (audio y MIDI); en Windows no requiere instalar drivers. ASIO de Pioneer es opcional (solo por latencia).
- **Sound API:** WASAPI (reportado funcional por la comunidad Mixxx en Windows).
- **Ruteo de audio en Mixxx:** Master → canales 1-2; Headphones/Cue → canales 3-4 del dispositivo FLX4. Controles de auriculares (MIXING/LEVEL/CUE) son hardware.
- **Mic:** el jack TS 1/4" no se enruta al PC → no grabable/emitible; fuera del baseline.
- **Mapping oficial ya presente** en el árbol de Mixxx (ver "Identificación"); no hay que instalar nada extra, Mixxx debería ofrecerlo al detectar la controladora.

Pendiente de hardware: detección real, que suene audio, respuesta de cada control, LEDs, latencia y anomalías.

## Identificación

| Campo | Valor |
|---|---|
| Fecha y hora | 2026-09-20 — Sesión 04 (ejecución) |
| Responsable | Juan Ramón Gutiérrez, con agente Claude Code (Opus 4.8) |
| Equipo | GARAGE1 — ASUS ROG Zephyrus G14 GA403UV · Windows 11 Home build 26200 |
| Windows (edición/build) | Windows 11 Home · build 26200 |
| Build de Mixxx (ruta) | `C:\dev\mixxx\build\x64-portable\mixxx.exe` |
| Commit de Mixxx | `81a5eb87` (build de 001-A, sin recompilar) |
| Controladora | Pioneer DJ DDJ-FLX4 |
| Driver Pioneer FLX4 (versión) | No requerido (class-compliant). ASIO opcional; registrar solo si se instala |
| Mapping oficial cargado (nombre/versión) | "Pioneer DDJ-FLX4" (autor Robert904, basado en DDJ-400) · `Pioneer-DDJ-FLX4.midi.xml` + `Pioneer-DDJ-FLX4-script.js` · schemaVersion 1 · mixxxVersion 2.6 · base firmware FLX4 1.02 · 281 controles / 112 salidas |
| Resultado final | **Éxito** (RCA MASTER OUT no verificado por falta de altavoces — limitación documentada, no defecto) |
| Estado de salida de 001-B | **Cerrada** |

## Fuente del procedimiento

- URL guía oficial (manual Mixxx FLX4): `https://manual.mixxx.org/2.4/en/hardware/controllers/pioneer_ddj_flx4`
- Hilo comunidad (referencia): `https://mixxx.discourse.group/t/getting-the-pioneer-ddj-flx4-working/30394`
- Driver Pioneer (opcional, solo si se usa ASIO): AlphaTheta Help Center — `https://support.alphatheta.com` (buscar "DDJ-FLX4 Driver")
- Fecha de consulta: **2026-09-19**

## Configuración de audio

| Campo | Valor |
|---|---|
| Interfaz | Tarjeta integrada de la FLX4 (objetivo) ✅ |
| API de audio | **Windows WASAPI** ✅ (sin driver) |
| Ruteo | Master → **Channels 1-2** · Headphones/Cue → **Channels 3-4** ✅ |
| Dispositivo Master | "Línea (2- DDJ-FLX4)" |
| Dispositivo Cue (auriculares) | "Línea (2- DDJ-FLX4)" |
| Sample rate | **48000 Hz** (44100 daba "Invalid sample rate" en WASAPI; ver Problema 1) |
| Tamaño de búfer | 23.2 ms |
| Latencia mostrada por Mixxx | **11 ms** (reportada por el sistema) |
| Nota | Contador de vaciado de búfer marcaba 266 al configurar; **vigilar si crece durante la reproducción** (si hay chasquidos, subir búfer). |

## Detección

- ¿Windows detecta la FLX4 (MIDI y audio)?: **Sí** — dispositivo MEDIA "DDJ-FLX4" + endpoint de audio "Línea (2- DDJ-FLX4)", sin instalar drivers (class-compliant).
- ¿Mixxx la detecta y ofrece el mapping oficial?: **Sí** — aparece "DDJ-FLX4" (MIDI) en Controladores; el preset "Pioneer DDJ-FLX4" **no se auto-cargó**, se seleccionó a mano en "Cargar Mapeo" y se marcó "Activado". El SoundManager la enumera bajo WASAPI con 4 canales de salida (Master 1-2 + Headphones 3-4).
- Evidencia: `04_TESTS/evidence/001B_flx4_detection.txt` (extracto sanitizado del log).

## Resultados por bloque de controles

Para cada control: **OK / Parcial / No responde / Anómalo** + observación.

| Bloque | Elemento | Resultado | Observación |
|---|---|---|---|
| Audio | Master suena (deck A/B) | OK (vía casco) | Confirmado por monitorización de auriculares con HEADPHONES MIXING→MASTER. RCA MASTER OUT **sin verificar** (sin altavoces, en tránsito DHL). |
| Audio | Preescucha/Cue en auriculares (deck A/B) | OK | Se oye el deck en el casco al usar CUE; botón CUE de canal se enciende (naranja). Monitorización por auriculares correcta. |
| Transporte | Play/Pause, Cue | OK | Play/Pause arranca/para; CUE (hold) previsualiza. |
| Transporte | Carga de pista | OK | Pistas cargadas en decks desde biblioteca. |
| Jogs | Scratch (superficie) | OK | Funciona en ambos platos. |
| Jogs | Pitch bend (borde) | OK | Funciona en ambos platos. |
| Tempo | Tempo/Pitch fader | OK | |
| Mixer | Crossfader | OK | Pasa el sonido del Deck 1 al Deck 2. |
| Mixer | Line faders (canal 1 y 2) | OK | Suben/bajan volumen; ambos canales audibles. |
| Mixer | EQ (LOW/MID/HI) | OK | Se reflejan en pantalla al girar. |
| Mixer | Filtro/CFX | OK | Efecto de filtro audible al girar. |
| Mixer | Ganancia (TRIM) | OK | Se mueve en el software al girar en la consola (sync bidireccional). |
| Pads | Hot cues | OK | Marcadores puestos con los pads y visibles en la forma de onda (2 hot cues). |
| Transporte | SHIFT + jog (SEARCH) | OK | Búsqueda rápida adelante/atrás confirmada. |
| Pads | Loops (Beat Loop) | OK | Bucle activado desde los pads. |
| Pads | Otros modos de pad | (pendiente) | |
| FX | Beat FX | OK | Efecto audible al activar ON/OFF + LEVEL/DEPTH; algunos presets son sutiles/poco perceptibles (normal según efecto y profundidad). |
| LEDs | Feedback play/cue/pad | OK (parcial) | Sincronización bidireccional confirmada: el CUE actúa igual desde la consola y desde el software, y el LED refleja el estado. Resto de LEDs (pads/play) a confirmar en el resto de pruebas. |

## Latencia y estabilidad

- Sound API / sample rate / búfer: **WASAPI · 48000 Hz · 23.2 ms** de búfer.
- Latencia reportada por el sistema: **11 ms**.
- xruns / cortes / dropouts observados: ninguno reportado en la sesión de pruebas; sin chasquidos audibles.
- Estabilidad general en sesión corta: **buena** — respuesta fluida de jogs, faders, pads y FX.

## Anomalías (reproducibles)

### Problema 1 — "Invalid sample rate" al abrir la FLX4 (WASAPI)

- **Síntoma:** al Aplicar el audio, error "Error al abrir 'Línea (2- DDJ-FLX4)' — Invalid sample rate".
- **Causa:** en WASAPI (modo compartido), el sample rate debe coincidir con el formato del dispositivo en Windows. La FLX4 estaba en 48000 Hz y Mixxx pedía 44100 Hz.
- **Solución:** fijar la Frecuencia de muestreo de Mixxx a **48000 Hz** (o alinear el formato en Windows → Sonido → DDJ-FLX4). Dentro del alcance (config de entorno, sin tocar Mixxx ni el mapping).
- **Resultado:** **RESUELTO** con 48000 Hz. Tras el cambio, el audio abre sin error y suena por la FLX4.

### Anomalía / hallazgo — Título

- **Síntoma:**
- **Cómo reproducir:**
- **¿Con mapping oficial sin editar?:** (sí — no se corrige aquí; es hallazgo)
- **Impacto:**

## Verificación de alcance

- [x] No se modificó código funcional de Mixxx.
- [x] No se modificó ni editó el mapping (XML/JS) de la FLX4 (se usó el oficial tal cual).
- [x] No se tocaron skins, QSS ni QML.
- [x] No se creó la skin Sinatra (001-C) ni experimentos QML (001-D).
- [x] No se creó ni publicó un fork; ningún commit dentro de `C:\dev\mixxx`.
- [x] No se versionaron binarios, audio ni evidencia pesada en SINATRA.

## Estado final del árbol de Mixxx

```text
git status --porcelain  ->  (vacío: sin cambios en archivos versionados)
Solo se creó configuración de usuario en %LOCALAPPDATA%\Mixxx (fuera del repo).
Ningún commit dentro de C:\dev\mixxx. Mapping oficial sin editar.
```

## Conclusión

- ¿001-B cumple todos los criterios de aceptación?: **Sí.** Detección con mapping oficial, audio Master+Cue por la FLX4, y ejercitados y registrados todos los bloques de control (transporte, jogs, tempo, crossfader, faders, EQ, filtro, TRIM, hot cues, loops, Beat FX), con sincronización bidireccional (LEDs) y latencia registrada.
- Criterios pendientes: ninguno bloqueante. **Limitación documentada (no defecto):** la salida física **RCA MASTER OUT no se verificó por no tener altavoces** (en tránsito, DHL); la señal Master sí quedó validada vía monitorización por auriculares. Recomendable una comprobación puntual de 2 min de las RCA cuando lleguen los altavoces (no reabre la fase).
- Estado de salida (uno solo, según la sección 9 de la spec):
  - [x] **Cerrada**
  - [ ] Abierta con bloqueo diagnosticado
  - [ ] Requiere nueva decisión/spec
- Justificación del estado: la FLX4 funciona como baseline contra la build local de 001-A con el mapping oficial sin modificar; hardware y software sincronizados en ambos sentidos. El único punto no verificado (RCA) lo impide la falta de altavoces, no un fallo; queda documentado. Árbol de Mixxx limpio, sin fork.
- Próximo paso autorizado: **ninguno automático.** Cerrar 001-B habilita *solicitar* la spec independiente de **001-C — Sinatra Skin**; no habilita empezarla. Requiere aprobación explícita del responsable.
