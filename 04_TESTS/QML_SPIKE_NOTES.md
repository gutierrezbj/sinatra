# SINATRA — QML Spike Notes · Hito 001-D

> Plantilla creada al aprobar la spec 001-D (2026-09-20). Se rellena **durante** la ejecución, no al final. Spec: `01_SPECS/SINATRA_Hito001D_QML_Spike.md`.

## Identificación

| Campo | Valor |
|---|---|
| Fecha y hora | 2026-09-20/21 — Sesiones 05-06 |
| Responsable | Juan Ramón Gutiérrez, con agente Claude Code (Opus 4.8) |
| Equipo | GARAGE1 — ASUS ROG Zephyrus G14 |
| Build de Mixxx | `81a5eb87` (QML:BOOL=ON, Qt6) |
| Pregunta única | ¿Puede un QML propio leer un control del motor en vivo y dar feedback ante una condición simple, sin fork? |
| Criterio de éxito | Indicador "✓ igualados" cuando \|BPM1−BPM2\| < 0.5, reacción < 1 s |
| Resultado final | **Éxito** |
| Recomendación Learn | **GO** (con nota de empaquetado, ver conclusión) |
| Estado de salida de 001-D | **Cerrada** |

## Fuente del procedimiento

- Fuente autorizada para este commit: **código de Mixxx `81a5eb87`** — skin `res/skins/LateNightQML` y librería QML `res/qml`. Fecha: 2026-09-20/21.
- API confirmada en `res/skins/LateNightQML/Controls/ImageVuMeter.qml` y `res/skins/LateNightQML/Deck/*` (uso de `Mixxx.ControlProxy` + `.value`).
- Reload en caliente (developer): `Ctrl+Shift+R` (`src/widget/wmainmenubar.cpp`).

## Mecanismo de acceso a controles (hallazgos)

- **Cómo lee un QML un control:** `import Mixxx 1.0 as Mixxx` + `Mixxx.ControlProxy { group: "[Channel1]"; key: "bpm" }`; se lee `.value`.
- **En vivo:** `.value` es reactivo — un binding a `proxy.value` se actualiza solo cuando cambia el control del motor.
- **Controles usados:** `[Channel1],bpm` y `[Channel2],bpm` (BPM efectivo en vivo; funciona con el deck reproduciendo).
- **Carga del QML:** skin QML **copia aislada** (`LateNightQML_Sinatra`) desplegada en la carpeta de skins de usuario + selección en `mixxx.cfg`. **Requiere arrancar Mixxx con `--developer`** (las skins QML son "developer preview" y no cargan sin esa bandera).

## Experimento

- Componente creado: overlay en `02_MODS/skins/LateNightQML_Sinatra/main.qml` (copia aislada de LateNightQML), un `Rectangle` con dos `ControlProxy` de BPM y feedback de color/texto. Indicador "SINATRA Learn".
- Condición: `matched = bpm1>0 && bpm2>0 && |bpm1−bpm2| < 0.5` → verde "✓ TEMPOS IGUALADOS" / si no, cian "✗ ajusta el tempo".
- Cómo se provocó: cargando 2 pistas desde la **FLX4**, reproduciéndolas y usando **SYNC/TEMPO** (desde consola y desde el software).

## Resultado

- ¿El indicador reacciona al igualar BPM?: **Sí.** Con dos pistas a 100 BPM → verde "✓ IGUALADOS"; al desplazar el tempo (consola o software) → vuelve a "✗" al instante; al re-sincronizar → verde otra vez. **En vivo, en ambos sentidos.**
- Latencia de reacción observada: **< 1 s** (aparentemente inmediata).
- Margen: tolerancia de 0.5 BPM (verde con 100.0 vs 99.7) — intencional y ajustable.
- Capturas: en `04_TESTS/artifacts/` (no versionadas).

## Controles expuestos · límites · acoplamiento · coste

- **Controles expuestos:** toda la superficie de Control Objects de Mixxx está disponible a QML vía `ControlProxy` (bpm, play, rate, volume, EQ, pads…). Leer y observar es trivial.
- **Bug encontrado y resuelto:** un `ControlProxy` creado en `main.qml` **antes** de `Mixxx.Core.ready` queda pegado a 0. Solución: crearlo dentro de un `Loader` con `active: Mixxx.Core.ready && mainWindowLoader.status === Loader.Ready`.
- **Acoplamiento / coste de despliegue (clave para Learn):** una skin QML **copia fuera de `res/skins` NO es autocontenida**. Necesita:
  1. Arranque con **`--developer`** (gate experimental de Mixxx).
  2. Junction `<Mixxx>/qml` → `res/qml` (librería QML compartida; los QML importan `../../qml` / `../../../qml`).
  3. Junction `skins/LateNight` → `res/skins/LateNight` (assets SVG compartidos).
  Es decir, depende de recursos del build de Mixxx. Para empaquetar Learn habrá que decidir: incluir la skin en un build propio de `res/skins`, o bundlear `res/qml` + assets.
- **Coste estimado de Learn por esta vía:** la mecánica núcleo (leer motor + feedback reactivo) es **barata** en QML (el spike son ~40 líneas). El coste real está en (a) **empaquetado/distribución** (developer mode + deps compartidas) y (b) construir la UI/lógica completa de lecciones. Viabilidad técnica: **demostrada**.

## Verificación de alcance

- [x] Un solo experimento (indicador BPM); no se amplió el frontend.
- [x] Copia aislada (`LateNightQML_Sinatra`); originales `LateNightQML`/`qml`/`LateNight` no tocados (solo enlazados en lectura).
- [x] No se tocó el motor, audio ni mappings; sin commits dentro de `C:\dev\mixxx`.
- [x] No se creó ni publicó un fork.
- [x] No se construyó el modo Learn (solo el spike).

## Estado final del árbol de Mixxx

```text
git status --porcelain                                   -> (vacío: limpio)
git status --porcelain res/skins/LateNightQML res/qml    -> (vacío: originales intactos)
Junctions creados en %LOCALAPPDATA%\Mixxx (fuera del repo), no modifican res/.
```

## Conclusión

- ¿La pregunta quedó respondida (sí/no) con evidencia?: **Sí — SÍ se puede.** Un QML propio lee el motor de Mixxx en vivo (BPM de los dos decks) y da feedback reactivo (verde "✓ igualados" < 0.5 BPM, vuelve a "✗" al desigualar), reacción < 1 s, sin fork ni tocar el motor.
- **Recomendación: GO** para el modo Learn por la vía QML. La mecánica que Learn necesita (leer estado del motor y dar feedback en tiempo real) es directa y barata en QML. **Condición/nota:** resolver el **empaquetado** antes de invertir en Learn — las skins QML requieren developer mode y dependen de recursos compartidos de Mixxx (`res/qml`, assets); habrá que decidir cómo se distribuye (build propio de `res/skins` o bundle).
- Estado de salida (uno solo, sección 10 de la spec):
  - [x] **Cerrada**
  - [ ] Abierta con bloqueo diagnosticado
  - [ ] Requiere nueva decisión/spec
- Próximo paso autorizado: **ninguno automático.** Cerrar 001-D habilita la **Revisión de rumbo del Hito 001** y, si el responsable decide, **solicitar la spec del modo Learn** (con su plan de empaquetado). No habilita empezar Learn.
