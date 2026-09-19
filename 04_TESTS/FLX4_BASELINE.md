# SINATRA — FLX4 Baseline · Hito 001-B

> Plantilla creada al aprobar la spec 001-B (2026-09-19). Se copia/rellena **durante** la ejecución, no al final. No completar campos por suposición. Spec: `01_SPECS/SINATRA_Hito001B_FLX4_Baseline.md`.

## Identificación

| Campo | Valor |
|---|---|
| Fecha y hora | |
| Responsable | |
| Equipo | GARAGE1 — ASUS ROG Zephyrus G14 |
| Windows (edición/build) | |
| Build de Mixxx (ruta) | `C:\dev\mixxx\build\x64-portable\mixxx.exe` |
| Commit de Mixxx | (registrar el usado; 001-A fue `81a5eb87`) |
| Controladora | Pioneer DJ DDJ-FLX4 |
| Driver Pioneer FLX4 (versión) | |
| Mapping oficial cargado (nombre/versión) | |
| Resultado final | Éxito / Parcial / Fallo |
| Estado de salida de 001-B | Cerrada / Abierta con bloqueo diagnosticado / Requiere nueva decisión/spec |

## Fuente del procedimiento

- URL(s) de la guía oficial (FLX4 + configuración de sonido):
- Fecha de consulta:
- Fuente y versión del driver Pioneer:

## Configuración de audio

| Campo | Valor |
|---|---|
| Interfaz | Tarjeta integrada de la FLX4 (objetivo) / fallback G14 |
| API de audio | (ASIO esperado) |
| Dispositivo Master | |
| Dispositivo Cue (auriculares) | |
| Sample rate | |
| Tamaño de búfer | |
| Latencia mostrada por Mixxx | |

## Detección

- ¿Windows detecta la FLX4 (MIDI y audio)?:
- ¿Mixxx la detecta y ofrece el mapping oficial?:
- Evidencia (línea del log):

## Resultados por bloque de controles

Para cada control: **OK / Parcial / No responde / Anómalo** + observación.

| Bloque | Elemento | Resultado | Observación |
|---|---|---|---|
| Audio | Master suena (deck A/B) | | |
| Audio | Preescucha/Cue en auriculares (deck A/B) | | |
| Transporte | Play/Pause, Cue | | |
| Transporte | Carga de pista | | |
| Jogs | Scratch | | |
| Jogs | Pitch bend | | |
| Tempo | Tempo/Pitch fader | | |
| Mixer | Crossfader | | |
| Mixer | Line faders | | |
| Mixer | EQ (3 bandas) | | |
| Mixer | Filtro | | |
| Mixer | Ganancia | | |
| Pads | Hot cues | | |
| Pads | Loops | | |
| Pads | Otros modos de pad | | |
| FX | FX disponibles | | |
| LEDs | Feedback play/cue/pad | | |

## Latencia y estabilidad

- Búfer configurado / latencia percibida:
- xruns / cortes / dropouts observados:
- Estabilidad general en sesión corta:

## Anomalías (reproducibles)

### Anomalía 1 — Título

- **Síntoma:**
- **Cómo reproducir:**
- **¿Con mapping oficial sin editar?:** (sí — no se corrige aquí; es hallazgo)
- **Impacto:**

## Verificación de alcance

- [ ] No se modificó código funcional de Mixxx.
- [ ] No se modificó ni editó el mapping (XML/JS) de la FLX4.
- [ ] No se tocaron skins, QSS ni QML.
- [ ] No se creó la skin Sinatra (001-C) ni experimentos QML (001-D).
- [ ] No se creó ni publicó un fork; ningún commit dentro de `C:\dev\mixxx`.
- [ ] No se versionaron binarios, audio ni evidencia pesada en SINATRA.

## Estado final del árbol de Mixxx

```text
# git log -1 / git status --porcelain (sin datos sensibles). Evidencia completa en evidence/.
```

## Conclusión

- ¿001-B cumple todos los criterios de aceptación?:
- Criterios pendientes:
- Estado de salida (uno solo, según la sección 9 de la spec):
  - [ ] Cerrada
  - [ ] Abierta con bloqueo diagnosticado
  - [ ] Requiere nueva decisión/spec
- Justificación del estado:
- Próximo paso autorizado:
